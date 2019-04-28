//////////////////////////////////////////////////////////////////////////////////
// Company: 	Shende Medical
// Engineer: 	YYC
// 
// Create Date: 2016/08/17 12:18:55
// 
// Usage: Configurable I2C Master Module NEW
//		
//////////////////////////////////////////////////////////////////////////////////

// `include "timescale.vh"
`timescale 1ns / 1ps

module i2cm	
	(
		input 								i_clk			,
		input 								i_rst_n			,
			
		input		[I2C_WR_BYTE_WIDTH-1:0]	i_wr_byte		,
		input		[I2C_WR_BUF_WIDTH-1:0]	i_wr_buf_Lalign	,
		input		[I2C_RD_BYTE_WIDTH-1:0]	i_rd_byte		,
		input		[3:0]					i_restart_byte	,
		output	reg	[I2C_RD_BUF_WIDTH-1:0]	o_rd_buf_Ralign	,
		
		input								i_do			,	//1 pulse	
		output	reg							o_busy			,
		output	reg							o_done			,	//1 pulse	
		output	reg							o_ack_err		,	//long signal
		output	reg	[15:0]					o_ack_err_cnt	,	
		
		input		[31:0]					i_i2c_T_clk_num	,
		output								O_I2CM_SCL		,
		inout								IO_I2CM_SDA		
	);
	
		
		parameter	I2C_ST_ACK_ERR_EN	= 1		;	
		parameter	I2C_WR_BYTE_WIDTH	= 3		;
		parameter	I2C_WR_BUF_WIDTH	= 32	;
		parameter	I2C_RD_BYTE_WIDTH	= 4		;
		parameter	I2C_RD_BUF_WIDTH	= 80	;
		
	localparam	ST_IDLE		=	0	;
	localparam	ST_START	=	1	;
	localparam	ST_WR_BYTE	=	2	;
	localparam	ST_WR_ACK	=	3	;
	localparam	ST_RESTART	=	4	;
	localparam	ST_RD_BYTE	=	5	;
	localparam	ST_RD_ACK	=	6	;
	localparam	ST_ERR		=	7	;
	localparam	ST_STOP		=	8	;
	
	
	reg		[I2C_WR_BYTE_WIDTH-1:0]	s_wr_byte		;
	reg		[I2C_WR_BUF_WIDTH-1:0]	s_wr_buf_Lalign	;	
	reg		[I2C_RD_BYTE_WIDTH-1:0]	s_rd_byte		;
	reg		[I2C_RD_BUF_WIDTH-1:0]	s_rd_buf_Ralign	;
	reg		[3:0]					s_restart_byte	;
	reg		[31:0]					s_i2c_T_clk_num	;
	
	
	reg		[4:0]					s_cur_st		;
	reg		[4:0]					s_next_st		;
	wire							s_st_change		;
	
	reg		[31:0]					s_clk_cnt		;
	reg		[2:0]					s_bit_cnt		;
	wire							s_half_bit		;
	wire							s_one_bit		;
	wire							s_wr_shift		;
	wire							s_rd_shift		;
	wire							s_one_byte		;
	reg		[I2C_WR_BYTE_WIDTH-1:0]	s_wr_byte_cnt	;	
	reg		[I2C_RD_BYTE_WIDTH-1:0]	s_rd_byte_cnt	;
	wire							s_wr_end		;
	wire							s_restart		;
	wire							s_rd_start		;
	wire							s_wr2stop		;
	wire							s_rd_end		;
	wire							s_rd_enable		;
	
	reg								s_scl			;
	wire							s_scl_reverse	;
	reg								s_sda_i			;
	reg								s_sda_o			;
	wire							s_sda_1			;
	wire							s_sda_0			;
	
	wire							s_ack_err		;
	
	wire							s_sda_i_source	;
	reg		[5:0]					s_sda_i_pipe	;
	
	wire							io_i2cm_scl_dbg	;
	wire							io_i2cm_sda_dbg	;
	
	assign io_i2cm_scl_dbg	=	s_scl	;
	assign io_i2cm_sda_dbg	=	s_sda_i_source;
	
	OBUFT	OBUFT_inst	(
            .O    (O_I2CM_SCL	), // Buffer output (connect directly to top-level port)
            .I    (0            ), // Buffer input
            .T    (s_scl        )  // 3-state enable input
	);
	
	IOBUF	IOBUF_inst	(
		.O	(s_sda_i_source	), // Buffer output
		.IO	(IO_I2CM_SDA	), // Buffer inout port (connect directly to top-level port)
		.I	(0				), // Buffer input
		.T	(s_sda_o		)  // 3-state enable input, high=input, low=output
	);
	
	//state machine
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_cur_st	<=	ST_IDLE		;
		else
			s_cur_st	<=	s_next_st	;
			
	
	always @(*)	begin
		case(s_cur_st)
			ST_IDLE: begin
				if(i_do)
					s_next_st	=	ST_START	;
				else
					s_next_st	=	ST_IDLE		;
			end	
			ST_START: begin
				if(s_half_bit)
					s_next_st	=	ST_WR_BYTE	;
				else
					s_next_st	=	ST_START	;
			end	
			ST_WR_BYTE: begin
				if(s_one_byte)
					s_next_st	=	ST_WR_ACK	;
				else
					s_next_st	=	ST_WR_BYTE	;
			end	
	        ST_WR_ACK: begin
				if(o_ack_err&&(I2C_ST_ACK_ERR_EN==1))
					s_next_st	=	ST_ERR		;
				else if(s_restart)
					s_next_st	=	ST_RESTART	;
				else if(s_rd_start)
					s_next_st	=	ST_RD_BYTE	;
				else if(s_wr2stop)
					s_next_st	=	ST_STOP		;
				else if(s_one_bit)
					s_next_st	=	ST_WR_BYTE	;
				else
					s_next_st	=	ST_WR_ACK	;
			end	
			ST_RESTART: begin
				if(s_one_bit)
					s_next_st	=	ST_START	;
				else
					s_next_st	=	ST_RESTART	;
			end	
	        ST_RD_BYTE: begin
				if(s_one_byte)
					s_next_st	=	ST_RD_ACK	;
				else
					s_next_st	=	ST_RD_BYTE	;
			end	
	        ST_RD_ACK: begin
				if(s_rd_end)
					s_next_st	=	ST_STOP		;
				else if(s_one_bit)
					s_next_st	=	ST_RD_BYTE	;
				else
					s_next_st	=	ST_RD_ACK	;
			end	
	        ST_ERR: begin
					s_next_st	=	ST_STOP		;
			end		
	        ST_STOP: begin
				if(s_one_bit)
					s_next_st	=	ST_IDLE		;
				else
					s_next_st	=	ST_STOP		;
			end	
			default: begin
					s_next_st	=	ST_IDLE		;
			end
		endcase
	end
	
	assign	s_st_change	=	(s_cur_st!=s_next_st)	;
	
	//When i_do, store input to reg.
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			s_wr_byte		<=	0;
			s_rd_byte		<=	0;
			s_restart_byte	<=	2;
			s_i2c_T_clk_num	<=	0;
		end
		else if(i_do) begin
			s_wr_byte		<=	i_wr_byte		;
			s_rd_byte		<=	i_rd_byte		;
			s_restart_byte	<=	i_restart_byte	;
			s_i2c_T_clk_num	<=	i_i2c_T_clk_num	;
		end	
		else begin
			s_wr_byte		<=	s_wr_byte		;
			s_rd_byte		<=	s_rd_byte		;
			s_restart_byte	<=	s_restart_byte	;
			s_i2c_T_clk_num	<=	s_i2c_T_clk_num	;
		end	
	end
	
	//s_clk_cnt, sometimes used as state cnt
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_clk_cnt	<=	0				;
		else if(s_st_change||(s_cur_st==ST_IDLE)||s_one_bit)
			s_clk_cnt	<=	0				;
		else
			s_clk_cnt	<=	s_clk_cnt + 1	;
	end
	
	assign	s_half_bit	=	(s_clk_cnt==s_i2c_T_clk_num[31:1])	;
	assign	s_one_bit	=	(s_clk_cnt==s_i2c_T_clk_num)		;
	assign	s_wr_shift	=	(s_one_bit&&(s_cur_st==ST_WR_BYTE))	;
	assign	s_rd_shift	=	(s_half_bit&&(s_cur_st==ST_RD_BYTE));
	
	//s_bit_cnt, 0~7 judge whether wr/rd 1 byte
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_bit_cnt	<=	0				;
		else if(s_st_change)
			s_bit_cnt	<=	0				;
		else if(s_one_bit&&((s_cur_st==ST_RD_BYTE)||(s_cur_st==ST_WR_BYTE)))
			s_bit_cnt	<=	s_bit_cnt + 1	;
		else
			s_bit_cnt	<=	s_bit_cnt		;
	end
	
	assign	s_one_byte	=	((s_bit_cnt==7)&&s_one_bit)	;
	
	//s_wr_byte_cnt, judge whether write all data over
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_wr_byte_cnt	<=	0					;
		else if(s_cur_st==ST_IDLE)
			s_wr_byte_cnt	<=	0					;
		else if(s_one_byte&&(s_cur_st==ST_WR_BYTE))
			s_wr_byte_cnt	<=	s_wr_byte_cnt + 1	;
		else
			s_wr_byte_cnt	<=	s_wr_byte_cnt		;
	end
	
	assign	s_wr_end	=	((s_wr_byte_cnt==s_wr_byte)&&s_one_bit)		;
	assign	s_restart	=	((s_wr_byte_cnt==s_restart_byte)&&s_one_bit&&s_rd_enable);
	assign	s_rd_start	=	(s_wr_end&&s_rd_enable)						;
	assign	s_wr2stop	=	(s_wr_end&&(!s_rd_enable))					;
	
	
	//s_rd_byte_cnt, judge whether read all data over
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_rd_byte_cnt	<=	0					;
		else if(s_cur_st==ST_IDLE)
			s_rd_byte_cnt	<=	0					;
		else if(s_one_byte&&(s_cur_st==ST_RD_BYTE))
			s_rd_byte_cnt	<=	s_rd_byte_cnt + 1	;
		else
			s_rd_byte_cnt	<=	s_rd_byte_cnt		;
	end
	
	assign	s_rd_enable	=	(s_rd_byte!=0)							;
	assign	s_rd_end	=	((s_rd_byte_cnt==s_rd_byte)&&s_one_bit)	;

	//s_scl
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_scl	<=	1		;
		else if(s_cur_st==ST_IDLE)
			s_scl	<=	1		;
		else if(s_scl_reverse)
			s_scl	<=	~s_scl	;
		else
			s_scl	<=	s_scl	;
	end
	
	assign	s_scl_reverse	=	((s_half_bit||s_one_bit)
								&&(!(s_one_bit&&(s_cur_st==ST_RESTART)))
								&&(!(s_one_bit&&(s_cur_st==ST_STOP))));
								
	// s_sda_o, s_wr_buf_Lalign
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_sda_o	<=	1								;
		else if(s_sda_0)
			s_sda_o	<=	0								;
		else if(s_sda_1)
			s_sda_o	<=	1								;
		else if(s_cur_st==ST_WR_BYTE)
			s_sda_o	<=	s_wr_buf_Lalign[I2C_WR_BUF_WIDTH-1]	;
		else
			s_sda_o	<=	s_sda_o							;
	end
	
	assign	s_sda_1	=	((s_cur_st==ST_IDLE)||(s_cur_st==ST_RESTART)
						||(s_cur_st==ST_WR_ACK)||(s_cur_st==ST_RD_BYTE)
						||((s_cur_st==ST_RD_ACK)&&(s_rd_byte_cnt==s_rd_byte)));
	assign	s_sda_0	=	((s_cur_st==ST_START)||((s_cur_st!=ST_STOP)&(s_next_st==ST_STOP))
						||((s_cur_st==ST_RD_ACK)&&(s_rd_byte_cnt<s_rd_byte)));
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_wr_buf_Lalign	<=	0				;
		else if(i_do)
			s_wr_buf_Lalign	<=	i_wr_buf_Lalign		;
		else if(s_wr_shift)
			s_wr_buf_Lalign	<=	(s_wr_buf_Lalign<<1);
		else
			s_wr_buf_Lalign	<=	s_wr_buf_Lalign		;
	end
	
	//s_rd_buf_Ralign, o_rd_buf_Ralign
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_sda_i_pipe	<=	6'b111111							;
		else
			s_sda_i_pipe	<=	{s_sda_i_pipe[4:0],s_sda_i_source}	;
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_sda_i	<=	1					;
		else begin
			case(s_sda_i_pipe)
				6'b111111:	s_sda_i	<=	1		;
				6'b000000:	s_sda_i	<=	0		;
				default:	s_sda_i	<=	s_sda_i	;
			endcase
		end
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			s_rd_buf_Ralign	<=	0											;
		else if(s_cur_st==ST_START)
			s_rd_buf_Ralign	<=	0											;
		else if(s_rd_shift)
			s_rd_buf_Ralign	<=	{s_rd_buf_Ralign[I2C_RD_BUF_WIDTH-2:0],s_sda_i}	;
		else
			s_rd_buf_Ralign	<=	s_rd_buf_Ralign								;
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			o_rd_buf_Ralign	<=	0												;
		// else if(s_cur_st==ST_START)
			// o_rd_buf_Ralign	<=	0												;
		else if(s_half_bit&&(s_cur_st==ST_STOP))
			// o_rd_buf_Ralign	<=	(s_rd_buf_Ralign<<(I2C_RD_BUF_WIDTH-{s_rd_byte,3'b0}))	;	
			o_rd_buf_Ralign	<=	s_rd_buf_Ralign										;
		else
			o_rd_buf_Ralign	<=	o_rd_buf_Ralign										;
	end
	
	//o_ack_err, o_ack_err_cnt
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			o_ack_err	<=	0	;
		else if((s_next_st==ST_START)&&(s_cur_st==ST_IDLE))
			o_ack_err	<=	0	;
		else if(s_ack_err)
			o_ack_err	<=	1	;
		else
			o_ack_err	<=	o_ack_err	;
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n)
			o_ack_err_cnt	<=	0					;
		else if(s_ack_err)
			o_ack_err_cnt	<=	o_ack_err_cnt + 1	;	
		else
			o_ack_err_cnt	<=	o_ack_err_cnt		;
	end
	
	assign	s_ack_err	=	((s_cur_st==ST_WR_ACK)&&s_half_bit&&(s_sda_i==1))	;
	
	//o_busy, o_done
	always @(posedge i_clk)	o_busy	<=	(s_cur_st!=ST_IDLE)	;
	always @(posedge i_clk)	o_done	<=	((s_cur_st==ST_STOP)&&(s_next_st==ST_IDLE))	;
	

	
	
endmodule

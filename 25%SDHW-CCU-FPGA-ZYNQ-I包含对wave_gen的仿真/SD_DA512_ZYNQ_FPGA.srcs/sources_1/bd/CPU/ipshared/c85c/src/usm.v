
`include "hardwarefpgadefine.vh"
`timescale 1ns / 1ps

module usm (
		input 		i_clk		,
		input 		i_rst_n		,
         input	    i_coder_A,
         input	    i_coder_B,
		output		O_SIN_P		,
		output 		O_SIN_N		,
		output 		O_COS_P		,
		output 		O_COS_N		,
		output		O_PWR_EN	,

		input					i_start,
		input					i_stop,
		input 					i_limit_sta,
		input 					i_limit_watch,
		input		[16-1:0]	i_freq_word,			
		input		[32-1:0]	i_delta_pulse,

		output	reg	[32-1:0]	o_move_pulse,
		output		o_irq_usm_done_pulse		,
		output		o_irq_usm_limit_pulse		,
		output		o_irq_usm_time_out_pulse	,
		output	    o_enter_idle_pulse				
);
		localparam	ST_IDLE		=	0	;
		localparam	ST_MOVING	=	1	;
		localparam	ST_OVER		=	2	;
		localparam	ST_WR_STOP	=	3	;
		localparam      ST_LIMIT        =       4       ;

		reg		[2:0]	s_cur_st		;
		reg		[2:0]	s_next_st		;
		reg		[31:0]	s_time_out_cnt		;
        wire s_time_out;
        wire s_time_wait;
		reg 			s_limit_sta		;

		wire			s_plus_pulse		;
		wire			s_minus_pulse		;
		wire 			s_place_ok		;
		wire                   	s_moving		;	

		wire	[32-1:0]	s_neg_delta_pulse	;
		wire	[32-1:0]	s_neg_move_pulse	;


	always @(posedge i_clk) begin
		if(!i_rst_n)begin
			s_cur_st	<= #1	ST_IDLE	;
			s_limit_sta	<= #1	1'b0;
		end
		else begin
			s_cur_st	<=	#1 s_next_st;
			s_limit_sta	<=	#1 i_limit_sta;
		end
	end

	assign o_irq_usm_limit_pulse= (!s_limit_sta) && i_limit_sta && i_limit_watch;

	always @(*) begin
		case(s_cur_st)
		ST_IDLE: begin
			if(i_start)
				s_next_st	=	ST_MOVING	;
			else
				s_next_st	=	ST_IDLE		;
			end
		ST_MOVING: begin
			if(s_time_out)
				s_next_st	=	ST_IDLE		;
			else if(i_stop)
				s_next_st	=	ST_WR_STOP	;
			else if(s_place_ok)
				s_next_st	=	ST_OVER		;
			else if(o_irq_usm_limit_pulse)    
				s_next_st   =   ST_LIMIT	;
			else
				s_next_st	=	ST_MOVING	;
			end	
		ST_LIMIT: begin
			if(s_time_wait)
				s_next_st 	= 	ST_IDLE		;
			else
				s_next_st	=	ST_LIMIT	;
			end
		ST_OVER: begin
			if(s_time_wait )
				s_next_st 	= 	ST_IDLE		;
			else
				s_next_st	=	ST_OVER		;
			end
		ST_WR_STOP: begin
			if(s_time_wait)
				s_next_st 	= 	ST_IDLE		;
			else
				s_next_st	=	ST_WR_STOP	;
			end
		default:        s_next_st	=	ST_IDLE		;
		endcase
	end

	assign	o_enter_idle_pulse   =	s_cur_st!=ST_IDLE && s_next_st==ST_IDLE	;

	assign	s_moving	     =	s_cur_st==ST_MOVING	;

	always @(posedge i_clk)
		if(!i_rst_n)
			o_move_pulse	<=	#1 0	;
		else if(i_start)
			o_move_pulse	<=	#1 0	;
		else if(s_cur_st!=ST_IDLE & s_plus_pulse)
			o_move_pulse	<=	#1 o_move_pulse + 1;
		else if(s_cur_st!=ST_IDLE & s_minus_pulse)
			o_move_pulse	<=	#1 o_move_pulse - 1;

	assign s_neg_delta_pulse = i_delta_pulse[32-1]?(~i_delta_pulse+1):i_delta_pulse;
	assign s_neg_move_pulse  = o_move_pulse[32-1]?(~o_move_pulse+1):o_move_pulse;
	assign s_place_ok = !(i_delta_pulse[32-1]^o_move_pulse[32-1])&&(s_neg_delta_pulse <= s_neg_move_pulse);
 

	assign	o_irq_usm_done_pulse	=	(s_cur_st==ST_OVER    & s_next_st==ST_IDLE);
	//					            |(s_cur_st==ST_WR_STOP & s_next_st==ST_IDLE);

	always @(posedge i_clk)
		if(!i_rst_n)
			s_time_out_cnt	<=	#1 0	;
		else if(i_start)
			s_time_out_cnt	<=  #1 0	;
		else if(s_cur_st!=ST_IDLE & (s_plus_pulse | s_minus_pulse))
			s_time_out_cnt	<=	#1 0	;
		else if(s_cur_st!=ST_IDLE)
			s_time_out_cnt	<=	#1 s_time_out_cnt + 1;

	assign	s_time_out			=	s_time_out_cnt>=(`FPGA_SYS_CLK_FREQ*2);
	assign	s_time_wait			=	s_time_out_cnt>=(`FPGA_SYS_CLK_FREQ/2);
	assign	o_irq_usm_time_out_pulse	=	s_time_out & s_cur_st==ST_MOVING & s_next_st==ST_IDLE;
             
    reg		s_coder_B_r;
    always@(posedge i_clk)  
        if(!i_rst_n)    s_coder_B_r <= #1 1; 
        else            s_coder_B_r <= #1 i_coder_B;
	
	wire	s_coder_B_posedge;
	assign	s_coder_B_posedge 	= 	 i_coder_B && (!s_coder_B_r)	;
	
	assign	s_plus_pulse  =	(s_coder_B_posedge & ~i_coder_A);	
	assign	s_minus_pulse =	(s_coder_B_posedge &  i_coder_A);

	assign	O_PWR_EN	=	s_moving	;

	wave_gen u_wave_gen
	(
	 .i_clk			(i_clk		),
	 .i_rst_n		(i_rst_n	),				
	 .i_enable		(s_moving	),

	 .i_dir_neg		(~i_delta_pulse[32-1]	),	//0:pos
	 .i_T_clk_num	({i_freq_word,1'b0}),

	 .o_sin_p		(O_SIN_P	),
	 .o_sin_n		(O_SIN_N	),
	 .o_cos_p		(O_COS_P	),
	 .o_cos_n		(O_COS_N	)
	);
	endmodule

`timescale 1ns/1ps
`define CHN 64
`define I2C_ST_ACK_ERR_EN	0  	
`define I2C_WR_BYTE_WIDTH	3   
`define I2C_WR_BUF_WIDTH	32  
`define I2C_RD_BYTE_WIDTH	1   
`define I2C_RD_BUF_WIDTH	8 
module tb();

  

reg i_clk 	;
reg i_rst_n ;

reg[`I2C_WR_BUF_WIDTH-1:0] i_wr_buf_Lalign;
reg 					  	i_do;
reg[`I2C_RD_BYTE_WIDTH-1:0]i_rd_byte;
reg[`I2C_WR_BYTE_WIDTH-1:0]i_wr_byte;
reg[3:0] 				  i_restart_byte;
reg[31:0]				  i_i2c_T_clk_num;

wire 					  o_ack_err;
wire 					  o_busy;
wire 					  o_done;
wire[`I2C_RD_BUF_WIDTH-1:0]o_rd_buf_Ralign;
wire 					  O_I2CM_SCL;
//wire IO_I2CM_SDA;
wire					  s_sda_i_source;
wire    				  s_sda_o	;

i2cm #(
.I2C_ST_ACK_ERR_EN	(0	  ) ,
.I2C_WR_BYTE_WIDTH	(3	  ) ,
.I2C_WR_BUF_WIDTH	(32	  ) ,
.I2C_RD_BYTE_WIDTH	(1	  ) ,
.I2C_RD_BUF_WIDTH	(8	  )
	
)
I2CM(
.i_clk				(i_clk),
.i_rst_n			(i_rst_n),

.i_wr_buf_Lalign	(i_wr_buf_Lalign)	,
.i_do				(i_do)	,
.i_rd_byte			(i_rd_byte)	,
.i_wr_byte			(i_wr_byte)	,
.i_restart_byte		(i_restart_byte)	,
.i_i2c_T_clk_num	(i_i2c_T_clk_num),
			
.o_ack_err			(o_ack_err)	,
.o_busy				(o_busy),
.o_done				(o_done),
.o_rd_buf_Ralign	(o_rd_buf_Ralign),	
.O_I2CM_SCL	   		(O_I2CM_SCL),
//.IO_I2CM_SDA   	(IO_I2CM_SDA),
.s_sda_i_source		(s_sda_i_source),
.s_sda_o			(s_sda_o)
);

parameter CYCLE = 20;
initial begin
		i_clk =0;
		forever 
		i_clk = #(CYCLE/2)~i_clk;
end
		
parameter RST_TIME = 2;
initial begin
		i_rst_n =1;
		#2;
		i_rst_n =0;
		#(CYCLE*RST_TIME)
		i_rst_n =1;
end

initial begin
		#1
		i_wr_buf_Lalign=0	;
		i_rd_byte=0			;
		i_wr_byte=0			;
		i_restart_byte=0	;
		i_do=0;
		i_i2c_T_clk_num=0;
		
		//genvar i
		//for(i=8'h88;i<64;i++)begin
		#(10*CYCLE)
		i_wr_buf_Lalign= {8'h6e,8'h88,8'h81,8'h03}	;
		i_rd_byte=0		;
		i_wr_byte=4			;
		i_restart_byte=2	;
		i_do=1;
		i_i2c_T_clk_num=500;
		#(5*CYCLE)
		i_do=0;
end






//wire 		  s_sclSlaveIn_Cfpga    ;
//wire 		  s_sdaSlaveIn_Cfpga    ;
//wire 		  s_sdaSlaveOut_Cfpga   ;


//wire[511:0] reg_amp_res_r;
//wire[7:0]   reg_cf_gen_scr;
//wire        wrEn;
//wire [3:0]  CurrState_SISt;
//wire          clk;
//wire [15:0]   addr;
//wire[319:0] state;
//wire[4:0]   next_state;

//wire        reg_amp_res_wr_r ;
//wire[63:0]  amp_scl_in       ;
//wire  [63:0]  amp_scl_out      ;
//wire  [63:0]  amp_sda_out      ;
//wire  [63:0]  amp_sda_in_R_tmp       ;
//wire  [63:0]  amp_sda_in_VI_tmp       ;
//wire  [63:0]  amp_sda_in       ;

//wire [63:0] power_up_delay;
//wire [63:0] start;
//wire [31:0] cnt;
//wire [255:0]  s_CurrState_SISt_R;
//wire [255:0]  s_CurrState_SISt_VI;
//wire [63:0]	  s_wrEn_amp_R;
//wire [63:0]   s_rdEn_amp_VI;
//wire [127:0]next_wrLen;
//wire [511:0]  reg_amp_r;
//wire [511:0]  reg_amp_vv;
//wire [511:0]  reg_amp_rv;
wire [31:0] out_value;
wire [15:0] in_value;
wire        inlet_scl_out   ;
wire        inlet_sda_out   ;
wire        inlet_sda_in   ;
wire        outlet_scl_out  ;
wire        outlet_sda_in  ;
wire        outlet_sda_out  ;
wire cs_reg_out_air0_tv;
wire [7:0]rdDa_inlet0;

PHS_CTRL PHS_CTRLInst(
	.CLK_IN    	  	     (   i_clk                ),
	//.SCL_Pfpga         (                        ),
	//.SDA_Pfpga         (                        ),
	//.TRIGGER_IN		 (                        ),
	//.EXT_IO    		 (                        ),
	//.IRQ_Pfpga    	 (                        ),
	//.LED       		 (                        ),
     
	 
	//.reg_amp_res_wr_r  ( reg_amp_res_wr_r   ),
	//.amp_scl_in        ( amp_scl_in         ),
	//.state(state),
	//.power_up_delay(power_up_delay),
	//.start(start),
	////.cnt(cnt),
	//.next_state(next_state),
	//.next_start(next_start),
	//.next_wrLen(next_wrLen),
	//.reg_amp_r(reg_amp_r), 
	.out_value(out_value ),
	.in_value(in_value),
	.inlet_sda_out  (inlet_sda_out ),
	.outlet_sda_out (outlet_sda_out),
	.outlet_sda_in (outlet_sda_in),
	.inlet_sda_in  (inlet_sda_in ),
	.outlet_scl_out (outlet_scl_out),
	.inlet_scl_out  (inlet_scl_out ),  
	.cs_reg_out_air0_tv(cs_reg_out_air0_tv),
	.rdDa_inlet0(rdDa_inlet0),
	//.reg_amp_res_r(reg_amp_res_r),
	//.reg_cf_gen_scr(reg_cf_gen_scr),
	//.wrEn(wrEn),
	//.CurrState_SISt(CurrState_SISt),
	//.clk(clk),
	//.addr(addr),
	//.amp_scl_out       		(amp_scl_out        	 ),
    //.amp_sda_in_R_tmp       (amp_sda_in_R_tmp        ),
	//.amp_sda_in_VI_tmp      (amp_sda_in_VI_tmp       ),
	//.amp_sda_in				(amp_sda_in				 ),
    //.amp_sda_out      		(amp_sda_out             ),
	//.s_wrEn_amp_R			(s_wrEn_amp_R            ),
	//.s_rdEn_amp_VI			(s_rdEn_amp_VI           ),
	.s_sclSlaveIn_Cfpga  	(O_I2CM_SCL              ),
	.s_sdaSlaveIn_Cfpga  	(s_sda_o                 ),
	.s_sdaSlaveOut_Cfpga 	(s_sda_i_source          )
	//.s_CurrState_SISt_R		(s_CurrState_SISt_R      ),
	//.s_CurrState_SISt_VI	(s_CurrState_SISt_VI     ),
	//.reg_amp_rv				(reg_amp_rv              ),
	//.reg_amp_vv				(reg_amp_vv				 ),
  
	//.switch			 (                       ),
	//.IRQ_Cfpga     	     (                       ),
	//.SCL_Cfpga   	     (                		 ),
	//.SDA_Cfpga   	     (                   	 )
	//.beep			     (                       ),
	//.PRESENT     	     (                       )
                         
	
);



endmodule

	
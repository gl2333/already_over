`timescale 1ns / 1ps
`include "zynqfpgaregdef.vh"
`define BRAM_DEPTH 1024

module usm_sample  
(
input 		  clk					      ,
input 		  rst					      ,
input 		  i_reg_usm_run			      ,
input 		  i_reg_usm_sample_intv       ,
input 		  i_reg_usm_sample_index_addr ,
input   	  i_reg_usm_move_pulse        ,
input 		  i_reg_usm_sample_read       ,
output  	  o_reg_usm_sample_depth_count,
output 		  o_reg_usm_sample_data		  ,
output 		  o_reg_usm_sample_vald       
);

wire 								i_reg_usm_run				;			     
wire [`USM_SAMPLE_INTV_BIT_WID-1 :0]i_reg_usm_sample_intv       ;
wire [`USM_SAMPLE_INDEX_BIT_WID-1:0]i_reg_usm_sample_index_addr ;
wire [`USM_MOVE_PULSE_BIT_WID-1  :0]i_reg_usm_move_pulse        ;
wire [`USM_SAMPLE_READ_BIT_WID-1 :0]i_reg_usm_sample_read       ;
reg  [`USM_SAMPLE_DEPTH_BIT_WID-1:0]o_reg_usm_sample_depth_count;
reg  [`USM_SAMPLE_DATA_BIT_WID-1 :0]o_reg_usm_sample_data		;  


reg  [`USM_SAMPLE_INTV_BIT_WID-1 :0]intv_cnt       			 ;
wire [`USM_SAMPLE_DATA_BIT_WID-1 :0]s_rd			         ;
reg  [`USM_SAMPLE_INDEX_BIT_WID-1:0]raddr	                 ;
wire 	   							wen  	              	 ;
wire 	   							full 	              	 ;
wire 	   							wen_wire             	 ;	
wire 	   							ren 		          	 ;

assign wen_wire 	= i_reg_usm_run &&(intv_cnt == i_reg_usm_sample_intv -1);
assign full 	  	= wen_wire && (o_reg_usm_sample_depth_count == `BRAM_DEPTH);
assign wen          = full?0:wen_wire;
assign ren 			= i_reg_usm_sample_read;

reg [`USM_MOVE_PULSE_BIT_WID-1  :0]i_reg_usm_move_pulse_next;
always@(posedge clk)
	if(rst)  		i_reg_usm_move_pulse_next <= 0;
	else if(wen)	i_reg_usm_move_pulse_next <= i_reg_usm_move_pulse;

wire s_sample_limit_en;
assign s_sample_limit_en = wen && ((i_reg_usm_move_pulse_next-i_reg_usm_move_pulse)< reg_usm_sample_limit_val);

reg reg_usm_sample_limit_en;
always@(posedge clk)
	if(rst)						reg_usm_sample_limit_en <= 0;
	else if(s_sample_limit_en)  reg_usm_sample_limit_en <= 1;
	else 						reg_usm_sample_limit_en <= 0;
	
always@(posedge clk)
	if(rst) 					  				  intv_cnt <=0;
	else if(i_reg_usm_run)
		if (intv_cnt == i_reg_usm_sample_intv -1) intv_cnt <= 0;
		else 					  				  intv_cnt <= intv_cnt +1;
	else 						  				  intv_cnt <= 0;

always@(posedge clk)
	if(rst||!i_reg_usm_run) 	    o_reg_usm_sample_depth_count <= 0;
	else if(wen) 					o_reg_usm_sample_depth_count <= o_reg_usm_sample_depth_count +1;
	else 							o_reg_usm_sample_depth_count <= o_reg_usm_sample_depth_count;
	
always@(posedge clk)
	if(rst||!i_reg_usm_sample_read)	raddr  <= 0; 
	else if(ren)					raddr  <= i_reg_usm_sample_index_addr;
	else							raddr  <= raddr;

always@(posedge clk)
	if(rst) 					   o_reg_usm_sample_data <= 0;
	else if(o_reg_usm_sample_vald) o_reg_usm_sample_data <= s_rd;
	
reg [1:0]rd_delay_cnt;
always@(posedge clk)
	if(rst)						o_reg_usm_sample_vald <= 0;
	else if(rd_delay_cnt == 2 )	o_reg_usm_sample_vald <= 1;
	else 						o_reg_usm_sample_vald <= 0;
	
always@(posedge clk)
	if(rst) 				   rd_delay_cnt <= 0;
	else if(ren)	
		if (rd_delay_cnt == 2) rd_delay_cnt <= rd_delay_cnt;
		else 				   rd_delay_cnt <= rd_delay_cnt+1;
	else 					   rd_delay_cnt <= 0;
		
bram u_bram
(
.addra	(o_reg_usm_sample_depth_count),
.clka   (clk        				 ),
.dina   (i_reg_usm_move_pulse    	 ),
.douta  (							 ),
.wea    (wen		  				 ),
                                     
.addrb  (raddr 					     ),
.clkb   (clk        				 ),
.dinb   (							 ),
.doutb  (s_rd          				 ),
.web    (!ren 				         )
);
endmodule




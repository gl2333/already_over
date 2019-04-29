`timescale 1ns / 1ps
`include "zynqfpgaregdef.vh" //zynq

module usm_sample#  (
	parameter BRAM_DEPTH        =1024
)
(
input 		  clk					      ,
input 		  rst					      ,
input 		  i_reg_usm_run			      ,
input 		  i_reg_usm_sample_intv       ,
input 		  i_reg_usm_sample_index_addr ,
input         i_reg_usm_move_dir          ,
input   	  i_reg_usm_move_pulse        ,
input 		  i_reg_usm_sample_read       ,
input         i_reg_usm_sample_limit_val  ,
output  	  o_reg_usm_sample_depth_count,
output 		  o_reg_usm_sample_data		  ,
output 		  o_reg_usm_sample_vald       ,
output        s_rd_delay                  ,
output        o_usm_sample_small_pulse
);

wire 								     i_reg_usm_run				 ;			     
wire [`USM_SAMPLE_INTV_BIT_WID		-1:0]i_reg_usm_sample_intv       ;
wire [`USM_SAMPLE_INDEX_BIT_WID		-1:0]i_reg_usm_sample_index_addr ;
wire [`USM_MOVE_PULSE_BIT_WID		-1:0]i_reg_usm_move_pulse;
wire 									 i_reg_usm_move_dir;
wire [`USM_SAMPLE_READ_BIT_WID		-1:0]i_reg_usm_sample_read       ;
reg  [`USM_SAMPLE_DEPTH_BIT_WID		-1:0]o_reg_usm_sample_depth_count;
reg  [`USM_SAMPLE_DATA_BIT_WID		-1:0]o_reg_usm_sample_data		 ;  
wire [`USM_SAMPLE_LIMIT_VAL_BIT_WID	-1:0]i_reg_usm_sample_limit_val  ;
reg  [`USM_SAMPLE_VALD_BIT_WID		-1:0]o_reg_usm_sample_vald       ;
reg  								     i_reg_usm_run_r			 ;
reg                                      ren_r                       ;
reg                                      o_reg_usm_sample_vald_r     ;
wire								     s_run_posedge               ;
wire                                     s_ren_posedge               ;
wire                                     s_reg_usm_sample_vald_posedge;


reg  [`USM_SAMPLE_INTV_BIT_WID	-1:0]intv_cnt       		 ;
wire [`USM_SAMPLE_DATA_BIT_WID	-1:0]s_rd			         ;
reg  [`USM_SAMPLE_INDEX_BIT_WID -1:0]raddr	                 ;
wire 	   							 wen  	              	 ;
wire 	   							 full 	              	 ;
wire 	   							 wen_wire             	 ;	
wire 	   							 ren 		          	 ;

//assign wen_wire 	= i_reg_usm_run &&(intv_cnt == i_reg_usm_sample_intv -1);
//assign full 	  	= wen_wire && (o_reg_usm_sample_depth_count == BRAM_DEPTH);
assign wen_wire 	= (intv_cnt == i_reg_usm_sample_intv -1);
assign full 	  	= (o_reg_usm_sample_depth_count == BRAM_DEPTH);
assign wen          = full?0:wen_wire;
assign ren 			= i_reg_usm_sample_read;
	
always@(posedge clk)
	if(rst) 					  				  intv_cnt <= 0;
	else if(i_reg_usm_run)
		if (intv_cnt == i_reg_usm_sample_intv -1) intv_cnt <= 0;
		else 					  				  intv_cnt <= intv_cnt +1;
	else 						  				  intv_cnt <= 0;

always@(posedge clk)
	if(rst)begin 
	i_reg_usm_run_r         <= 0;
	ren_r                   <= 0;
	o_reg_usm_sample_vald_r <= 0;
	end
	else begin
	i_reg_usm_run_r         <= i_reg_usm_run;
	ren_r                   <= ren;
	o_reg_usm_sample_vald_r <= o_reg_usm_sample_vald;
	end

assign s_run_posedge = !i_reg_usm_run_r&&i_reg_usm_run;	
assign s_ren_posedge = !ren_r &&ren ;	
assign s_reg_usm_sample_vald_posedge = !o_reg_usm_sample_vald_r&&o_reg_usm_sample_vald;
	
always@(posedge clk)
	if(rst)						   o_reg_usm_sample_depth_count <= 0;
	else if(s_run_posedge)         o_reg_usm_sample_depth_count <= 0;
	else if(wen_wire)      		   
		if(full)                   o_reg_usm_sample_depth_count <= o_reg_usm_sample_depth_count;
		else                       o_reg_usm_sample_depth_count <= o_reg_usm_sample_depth_count+1;
	else 						   o_reg_usm_sample_depth_count <= o_reg_usm_sample_depth_count;
	
always@(posedge clk)
	if(rst)							raddr  <= 0; 
	else if(ren)					raddr  <= i_reg_usm_sample_index_addr;
	else							raddr  <= raddr; 

always@(posedge clk)
	if(rst) 					   	        o_reg_usm_sample_data <= 0;
	else if(s_reg_usm_sample_vald_posedge) 	o_reg_usm_sample_data <= s_rd;
	
reg [1:0]rd_delay_cnt;
//always@(posedge clk)
//	if(rst)		                         o_reg_usm_sample_vald <= 0;
//	else if(rd_delay_cnt == 2 )	         o_reg_usm_sample_vald <= 1;
//	else                                 o_reg_usm_sample_vald <= 0;
wire s_rd_delay;
assign s_rd_delay = (rd_delay_cnt == 2);
 
always@(posedge clk)
	if(rst||s_ren_posedge)		        o_reg_usm_sample_vald <= 0;
	else if(s_rd_delay )			    o_reg_usm_sample_vald <= 1;

always@(posedge clk)
	if(rst) 				   		rd_delay_cnt <= 0;
	else if(ren)			
		if (s_rd_delay) 		    rd_delay_cnt <= rd_delay_cnt;
		else 				   		rd_delay_cnt <= rd_delay_cnt+1;
	else 					   		rd_delay_cnt <= 0;

reg [`USM_MOVE_PULSE_BIT_WID-1  :0]i_reg_usm_move_pulse_next;
always@(posedge clk)
	if(rst)  		i_reg_usm_move_pulse_next <= 0;
	else if(wen)	i_reg_usm_move_pulse_next <= i_reg_usm_move_pulse;

wire   s_sample_small_pulse;
wire   s_pulse_compare;
assign s_pulse_compare      = i_reg_usm_move_dir?(i_reg_usm_move_pulse_next-i_reg_usm_move_pulse)< i_reg_usm_sample_limit_val:(i_reg_usm_move_pulse-i_reg_usm_move_pulse_next)<i_reg_usm_sample_limit_val;
assign s_sample_small_pulse = wen && s_pulse_compare;

reg o_usm_sample_small_pulse;
always@(posedge clk)
	if(rst)						    o_usm_sample_small_pulse <= 0;
	else if(s_sample_small_pulse)  	o_usm_sample_small_pulse <= 1;
	else 						    o_usm_sample_small_pulse <= 0;

wire [31:0]douta ;
wire [31:0]dinb  ;

	
bram u_bram
(
.addra	(o_reg_usm_sample_depth_count),
.clka   (clk        				 ),
.dina   (i_reg_usm_move_pulse         ),
.douta  (douta					     ),
.wea    (wen		  				 ),
                                     
.addrb  (raddr 					     ),
.clkb   (clk        				 ),
.dinb   (dinb					     ),
.doutb  (s_rd          				 ),
.web    (!ren 				         )
);
endmodule




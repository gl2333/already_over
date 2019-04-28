`timescale 1ns / 1ps

module top (

	input clk,
	input rst,
	input in ,
	 output cnt_run   ,
	 output cnt_start ,
	 output cnt_done  ,
	output  usm_limit_deb,
	output usm_limit_hold
);
    parameter RST_V = 1'b0       ;
    parameter CNT   = 5        ; //debounce time,
  
    reg [31:0] cnt;  
    reg cnt_run,usm_limit_deb;
    //always@(posedge clk) 
    //    if(rst || (cnt == CNT) || (usm_limit_deb!=in))
    //            cnt <= 0;
    //    else    cnt <= cnt +1;
    
    assign cnt_start =  (!cnt_run) && (usm_limit_deb!=in);
    assign cnt_done  =  cnt_run && (cnt == CNT);
    
    always@(posedge clk) 
        if(rst || cnt_done) cnt_run <= 0;
        else if(cnt_start) cnt_run <= 1;
       
    always@(posedge clk) 
        if(rst || cnt_done) cnt <=  0;
        else if(cnt_run) cnt <=  cnt +1;
    
    always@(posedge clk) 
        if(rst)
            usm_limit_deb <=  RST_V;
        else if(cnt_done) 
            usm_limit_deb <=  in;
			
holdup_cnt uholdup_cnt(
	.clk(clk),
	.rst(rst),
	.in (usm_limit_deb),
	.out(usm_limit_hold)
);			
			

endmodule
//lwjiee @ shende
//2018-4-10

module deb_cnt(
	input clk,
	input rst,
	input in ,
	output reg out
);
    parameter RST_V = 1'b0       ;
    parameter CNT   = 100        ; //debounce time,
  
    reg [31:0] cnt;  
    
    //always@(posedge clk) 
    //    if(rst || (cnt == CNT) || (out!=in))
    //            cnt <= 0;
    //    else    cnt <= cnt +1;
    
    reg cnt_run;
    wire cnt_start =  (!cnt_run) && (out!=in);
    wire cnt_done  =  cnt_run && (cnt == CNT);
    
    always@(posedge clk) 
        if(rst || cnt_done) cnt_run <= 0;
        else if(cnt_start) cnt_run <= 1;
       
    always@(posedge clk) 
        if(rst || cnt_done) cnt <= #1 0;
        else if(cnt_run) cnt <= #1 cnt +1;
    
    always@(posedge clk) 
        if(rst)
            out <= #1 RST_V;
        else if(cnt_done) 
            out <= #1 in;

endmodule
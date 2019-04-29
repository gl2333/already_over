//lwjiee @ shende
//2018-4-10

module deb_cnt(
	input clk,
	input rst,
	input in ,
	output reg out
);
    parameter RST_V = 1'b0       ;
    parameter FREQ  = 100_000_000; //clock freq, unit hz
    parameter T_NS  = 50         ; //debounce time, unit ns
  
    localparam CNT_MAX = (T_NS*FREQ)/1000_000_000;

    reg [31:0] cnt;  
    
    always@(posedge clk) 
        if(rst || (cnt == CNT_MAX) || (out!=in))
                cnt <= 0;
        else    cnt <= cnt +1;
    
    always@(posedge clk) 
        if(rst)
            out <= RST_V;
        else if(cnt == CNT_MAX) 
            out <= in;
endmodule
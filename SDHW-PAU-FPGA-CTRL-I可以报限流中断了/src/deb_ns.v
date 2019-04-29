//lwjiee @ shende
//2018-4-10

//2018-5-2 fix bug

module deb_ns(
	input clk,
	input rst,
	input in ,
	output reg out
);
    parameter RST_V = 1'b0       ;
    parameter FREQ  = 64'd100_000_000; //clock freq, unit hz
    parameter T_NS  = 64'd50         ; //debounce time, unit ns
  
    localparam CNT_MAX = (T_NS*FREQ/1000_000_000);

    reg [31:0] cnt;  
    
    always@(posedge clk) 
        if(rst || (out!=in)) cnt <= #1 0;
        else if(cnt < CNT_MAX) cnt <= #1 cnt +1;
    
    always@(posedge clk) 
        if(rst)
            out <= #1 RST_V;
        else if(cnt == CNT_MAX) 
            out <= #1 in;
endmodule
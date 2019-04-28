module holdup_cnt(
	input clk,
	input rst,
	input in ,
	output  out
);
    parameter RST_V = 1'b0       ;
    parameter CNT   = 1000         ; //debounce time
  

    reg [31:0] cnt;  
    reg in_r,out;
    wire in_raise_pulse = (!in_r) && in; 
    reg  up_status;
    wire up_start = (!up_status) && in_raise_pulse;
    wire up_done  = ( up_status) && (cnt == CNT);

    always@(posedge clk) 
        if(rst) in_r <= RST_V;
        else in_r <= in;
        
    always@(posedge clk) 
        if(rst || up_done) cnt <= 0;
        else if (up_status) cnt <= cnt + 1;
    
    always@(posedge clk) 
        if(rst || up_done) up_status <= 0;
        else if(up_start) up_status <= 1;
    
    always@(posedge clk) 
        if(rst)
            out <= RST_V;
        else if(up_status) out <= 1;
        else out <= in;
endmodule

//lwjiee @ shende
//2018-4-19
`include "timescale.vh"

module sync #(
    parameter LEVEL = 3, //must beyond 2
    parameter RST_V = 0
)
(
	input clk,
	input rst,
	input i,
	output o
);

reg [LEVEL-1:0] i_r;

always@(posedge clk)
    if(rst) i_r <= #1 RST_V?{LEVEL{1'b1}}:{LEVEL{1'b0}};
    else    i_r <= #1 {i_r[LEVEL-2:0],i};
    
    assign o = i_r[LEVEL-1];
    
endmodule
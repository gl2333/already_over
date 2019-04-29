//lwjiee @ shende
//2018-4-19
`include "timescale.vh"

module sync #(
    parameter BIT   = 1,
    parameter LEVEL = 3, //must beyond 2
    parameter RST_V = 0
)
(
	input clk,
	input rst,
	input  [BIT-1:0] i,
	output [BIT-1:0] o
);
    reg [LEVEL-1:0]i_r[BIT-1:0];    
    genvar j;
    generate
        for(j=0;j<BIT;j=j+1) 
        begin: sync_shift       
            always@(posedge clk)
                if(rst) i_r[j] <= #1 RST_V?{LEVEL{1'b1}}:{LEVEL{1'b0}};
                else    i_r[j] <= #1 {i_r[j][LEVEL-2:0],i[j]};
            assign o[j] = i_r[j][LEVEL-1];
        end
    endgenerate
endmodule
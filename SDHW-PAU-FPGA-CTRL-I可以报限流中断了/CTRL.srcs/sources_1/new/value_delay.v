`include "timescale.vh"
`include "simulation.vh"

module value_delay #(
    parameter LEVEL 	= 3, 
    parameter RST_V 	= 0,
	parameter BIT_WID 	= 8
)
(
	input clk,
	input rst,
	input value_update,
	input [BIT_WID-1:0] reg_value_limit,
	input [BIT_WID-1:0]i,
	output[BIT_WID-1:0]o,
	output irq_valid
);


reg [LEVEL*BIT_WID-1:0] i_r;
wire [LEVEL-1:0]         irq_value_over_limit;
wire                     irq_valid;
wire[BIT_WID-1:0]       reg_value_limit;
wire[BIT_WID-1:0]       o;


always@(posedge clk)
    if(rst) 	        		i_r <=  RST_V?{LEVEL*BIT_WID{1'b1}}:{LEVEL*BIT_WID{1'b0}};
    else if (value_update)		i_r <=  {i_r[(LEVEL-1)*BIT_WID-1:0],i};

	assign o = i_r[LEVEL*BIT_WID-1:(LEVEL-1)*BIT_WID];
	
	
genvar j;
generate 
	for(j=0;j<LEVEL;j=j+1)begin: irq_vol
		assign irq_value_over_limit[j]= i_r[j*BIT_WID+:BIT_WID]> reg_value_limit?1:0;
	end
endgenerate
assign irq_valid = &irq_value_over_limit ? 1:0;			


endmodule

`timescale 1ns / 1ps
module fifo_test     //fifo_serial
(
input 		clk,
input 		rst,

input 		wen,
input 		ren,

output[7:0] data_in,
output[9:0] waddr,
output[9:0] raddr,
output[9:0] count,
output      wen_wire,
output      ren_wire,

output[7:0] data_out,
output 		full,
output 		empty
);

wire clk;
wire rst;
wire wen;
wire ren;
reg [9:0]count;
wire wen_wire;
wire ren_wire;
reg[9:0] 	waddr;
reg[9:0] 	raddr;
reg[7:0]data_in;
wire[7:0]data_out;
wire full;
wire empty;

always@ (posedge clk)begin
	if (rst)      data_in <=0;
	else if (wen) data_in <=data_in+1;
	else          data_in <=0;
end


always@ (posedge clk)begin
	if (rst)              waddr <= 0;
	else if(wen && !full) waddr <= waddr+1;
	else                  waddr <= waddr;                        
end

always@ (posedge clk)begin
	if (rst)			   raddr <=0;
	else if(ren && !empty) raddr <= raddr+1;
	else                   raddr <= raddr;
end

always@ (posedge clk)begin
	if (rst) count <=0;
	else begin
	case({wen,ren})
		2'b00: 					count <= count;
		
		2'b01: if(empty)   	    count <= count;
			else             	count <= count -1;
			
		2'b10: if(full) 		count <= count;
			else             	count <= count +1;
			
		2'b11:					count <= count;
		default:                count <= count;
	endcase
	end
end

assign full  = wen && (count == 1023);
assign empty = ren && (count == 0);

assign wen_wire = full ?0:wen;
assign ren_wire = empty?0:ren;

Bram u_Bram
(
.addra	(waddr		),
.clka   (clk        ),
.dina   (data_in    ),
.wea    (wen_wire   ),
.douta  (           ),

.addrb  (raddr      ),
.clkb   (clk        ),
.dinb   (           ),
.web    (!ren_wire   ),
.doutb  (data_out   )
);
endmodule


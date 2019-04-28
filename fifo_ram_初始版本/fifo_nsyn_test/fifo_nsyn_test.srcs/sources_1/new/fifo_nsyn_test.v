`timescale 1ns / 1ps
module fifo_nsyn_test
(
input wclk,
input rclk,
input rst,
input wen,
input ren,
input [7:0]data_in,
output[7:0]data_out,
output full,
output empty,

output wen_wire,
output ren_wire,
output waddr_bin           ,
output waddr_bin_next      ,
output waddr_gray          ,
output waddr_gray_next     ,
output raddr_bin           ,
output raddr_bin_next      ,
output raddr_gray          ,
output raddr_gray_next     ,
output wclk_raddr_gray_reg1,
output wclk_raddr_gray_reg2,
output rclk_waddr_gray_reg1,
output rclk_waddr_gray_reg2
);

parameter ADDR_WIDTH = 5; // depth of Bram :32

wire wclk;
wire rclk;
wire rst ;
wire wen ;
wire ren ;
wire wen_wire;
wire ren_wire;
wire [7:0]data_in				;
wire [7:0]data_out              ;
reg  [ADDR_WIDTH-1:0]waddr_bin             ;
wire [ADDR_WIDTH-1:0]waddr_bin_next        ;
reg  [ADDR_WIDTH-1:0]waddr_gray            ;
wire [ADDR_WIDTH-1:0]waddr_gray_next       ;
reg  [ADDR_WIDTH-1:0]raddr_bin             ;
wire [ADDR_WIDTH-1:0]raddr_bin_next        ;
reg  [ADDR_WIDTH-1:0]raddr_gray            ;
wire [ADDR_WIDTH-1:0]raddr_gray_next       ;
reg  [ADDR_WIDTH-1:0]wclk_raddr_gray_reg1  ;
reg  [ADDR_WIDTH-1:0]wclk_raddr_gray_reg2  ;
reg  [ADDR_WIDTH-1:0]rclk_waddr_gray_reg1  ;
reg  [ADDR_WIDTH-1:0]rclk_waddr_gray_reg2  ;
reg full;
reg empty;

assign waddr_bin_next   = waddr_bin +1;
assign raddr_bin_next   = raddr_bin +1;
assign waddr_gray_next  = (waddr_bin_next)^{1'b0,waddr_bin_next[ADDR_WIDTH-1:1]};
assign raddr_gray_next  = (raddr_bin_next)^{1'b0,raddr_bin_next[ADDR_WIDTH-1:1]};

//addr at write operation 
always@(posedge wclk)begin
	if (rst)               waddr_bin <= 0;
	else if (wen && !full) waddr_bin <= waddr_bin_next;
	else                   waddr_bin <= waddr_bin;
end

// from addr_bin code to addr_gray code
always@(posedge wclk)begin
	if (rst)               waddr_gray <= 0;
	else if (wen && !full) waddr_gray <= waddr_gray_next;
	else                   waddr_gray <= waddr_gray;
end

// waddr_gray delay 2 times in read_clock 
always@(posedge rclk)begin
	if (rst) rclk_waddr_gray_reg1 <=0;
	else     rclk_waddr_gray_reg1 <= waddr_gray;
end

always@(posedge rclk)begin
	if (rst) rclk_waddr_gray_reg2 <=0;
	else     rclk_waddr_gray_reg2 <= rclk_waddr_gray_reg1;
end

//addr at read operation
always@(posedge rclk)begin
	if (rst)                raddr_bin <= 0;
	else if (ren && !empty) raddr_bin <= raddr_bin_next;
	else                    raddr_bin <= raddr_bin;
end

//from addr_bin code to addr_gray code
always@(posedge rclk)begin
	if (rst)                raddr_gray <= 0;
	else if (ren && !empty) raddr_gray <= raddr_gray_next;
	else                    raddr_gray <= raddr_gray;
end

//raddr_gray delay 2 times at write_clock
always@(posedge wclk)begin
	if (rst) wclk_raddr_gray_reg1 <=0;
	else     wclk_raddr_gray_reg1 <= raddr_gray;
end

always@(posedge wclk)begin
	if (rst) wclk_raddr_gray_reg2 <=0;
	else     wclk_raddr_gray_reg2 <= wclk_raddr_gray_reg1;
end

//full 
always@(posedge wclk)begin
	if (rst) full <=0;
	else if(wen && waddr_gray_next == wclk_raddr_gray_reg2)  full <= 1;
	else if(waddr_gray_next != wclk_raddr_gray_reg2)         full <= 0;
	else full <= full;
end

//empty
always@(posedge rclk)begin
	if(rst) empty <= 0;
	else if(ren && raddr_gray_next == rclk_waddr_gray_reg2) empty <= 1;
	else if(raddr_gray_next != rclk_waddr_gray_reg2)        empty <= 0;
	else empty <= empty;
end

assign wen_wire = (wen && !full) ?1:0;
assign ren_wire = (ren && !empty)?1:0;

Bram Bram
(
.addra	(waddr_bin),
.clka   (wclk     ),
.dina   (data_in  ),
.douta  (         ),
.wea    (wen_wire ),
.addrb  (raddr_bin),
.clkb   (rclk     ),
.dinb   (         ),
.doutb  (data_out ),
.web    (!ren_wire)


);
endmodule
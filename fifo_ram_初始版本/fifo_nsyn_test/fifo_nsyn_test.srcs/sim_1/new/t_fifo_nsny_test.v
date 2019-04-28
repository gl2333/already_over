`timescale 1ns / 1ps
module t_fifo_nsyn_test;

reg wclk;
reg rclk;

reg wen;
reg ren;

wire [ADDR_WIDTH-1:0]raddr_bin             ;
wire [ADDR_WIDTH-1:0]raddr_gray            ;
wire [ADDR_WIDTH-1:0]raddr_gray_next       ;
wire [ADDR_WIDTH-1:0]waddr_gray            ;
wire [ADDR_WIDTH-1:0]rclk_waddr_gray_reg1  ;
wire [ADDR_WIDTH-1:0]rclk_waddr_gray_reg2  ;
wire	  empty;

wire [ADDR_WIDTH-1:0]waddr_bin             ;
reg  [7:0]data_in;
//wire [ADDR_WIDTH-1:0]waddr_gray            ;
wire [ADDR_WIDTH-1:0]waddr_gray_next       ;
wire [7:0]data_out;
//wire [ADDR_WIDTH-1:0]raddr_gray            ;
wire [ADDR_WIDTH-1:0]wclk_raddr_gray_reg1  ;
wire [ADDR_WIDTH-1:0]wclk_raddr_gray_reg2  ;
wire	  full;

reg rst;
wire [ADDR_WIDTH-1:0]waddr_bin_next        ;
wire [ADDR_WIDTH-1:0]raddr_bin_next        ;

parameter ADDR_WIDTH = 5;
always #40 wclk = ~wclk;
always #20 rclk = ~rclk;

always@(posedge wclk)begin
	if(rst) data_in <= 0;
	else 	data_in <= data_in +1 ;
end

initial begin
wclk = 0;
rclk = 0;
rst  = 1;
wen  = 0;
ren  = 0;
#80
rst  = 0;
#80
wen  = 1;

#800
ren  = 1;
end

fifo_nsyn_test #
(.ADDR_WIDTH(5)) 
fifo_nsyn_test
(
.wclk					(wclk					),
.rclk                   (rclk                   ),
.rst                    (rst                    ),
.wen                    (wen                    ),
.ren                    (ren                    ),
.data_in                (data_in                ),
.data_out               (data_out               ),
.full                   (full                   ),
.empty                  (empty                  ),
.waddr_bin              (waddr_bin              ),
.waddr_bin_next         (waddr_bin_next         ),
.waddr_gray             (waddr_gray             ),
.waddr_gray_next        (waddr_gray_next        ),
.raddr_bin              (raddr_bin              ),
.raddr_bin_next         (raddr_bin_next         ),
.raddr_gray             (raddr_gray             ),
.raddr_gray_next        (raddr_gray_next        ),
.wclk_raddr_gray_reg1   (wclk_raddr_gray_reg1   ),
.wclk_raddr_gray_reg2   (wclk_raddr_gray_reg2   ),
.rclk_waddr_gray_reg1   (rclk_waddr_gray_reg1   ),
.rclk_waddr_gray_reg2   (rclk_waddr_gray_reg2   )

);
endmodule
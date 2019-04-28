`timescale 1ns / 1ps

module t_fifo_test;

reg clk				;
reg rst             ;
reg wen             ;
wire [9:0]waddr      ;
wire [7:0]data_in    ;
wire full           ;
wire wen_wire;
wire [9:0]count     ;
reg ren             ;
wire [9:0]raddr      ;
wire[7:0]data_out   ;
wire empty          ;
wire ren_wire;



always #20 clk = ~clk;

initial begin
clk =0;
rst =1;
wen =0;
ren =0;
#100

rst =0;
wen =1;
#40880
wen =0;

end

fifo_test fifo_test
(
.clk		(clk	 ),	
.rst        (rst     ),
.wen        (wen     ),
.ren        (ren     ),
.waddr      (waddr   ),
.raddr      (raddr   ),
.count      (count   ),
.data_in    (data_in ),
.data_out   (data_out),
.wen_wire   (wen_wire),
.ren_wire    (ren_wire),
.full       (full    ),
.empty      (empty   )
);
endmodule

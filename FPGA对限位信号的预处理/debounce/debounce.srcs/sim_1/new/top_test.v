`timescale 1ns / 1ps


module top_test();

reg clk;
reg rst;
 
wire cnt_run   ;
wire cnt_start ;
wire cnt_done  ;


always #10    clk = ~clk; //50000

integer seed;
reg rand_num;

initial begin
clk = 0;
rst = 1;
#20
rst =0;
end

always@(posedge clk)begin
rand_num <= $random(seed);
end

top utop(

.clk           (clk           ),
.rst           (rst           ),
.cnt_run  (cnt_run  ),
.cnt_start(cnt_start),
.cnt_done (cnt_done ),
.in(rand_num),
.usm_limit_deb(usm_limit_deb),
.usm_limit_hold(usm_limit_hold)


);

endmodule
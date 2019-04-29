`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/19 16:36:08
// Design Name: 
// Module Name: tb_sync
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sync(

    );
    
    reg clk;
    reg rst;
    reg i;
    wire o;
    
    sync#(.LEVEL(4),.RST_V(0)) dut(.clk(clk),.rst(rst),.i(i),.o(o));
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        
        #105
            rst = 1;
            i = 1;
        #100
            rst = 0;
        #100
            i = 0;
            #100
            i = 0;
    end
            
    
    
endmodule

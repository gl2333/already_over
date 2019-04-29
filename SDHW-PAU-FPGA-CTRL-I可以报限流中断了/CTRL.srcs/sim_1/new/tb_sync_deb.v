`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/03 13:13:59
// Design Name: 
// Module Name: tb_sync_deb
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

module tb_sync_deb(

    );
    
    reg clk;
    reg rst;
    reg PRESENT;
    wire present_sync;
    wire present_deb;
    
    localparam SYS_FREQ = 25_000_000;
    
    sync          #(.LEVEL(3),.RST_V(1)) 
        u_sync_pres(.clk(clk),.rst(rst),.i(PRESENT),.o(present_sync));

    deb_ns     #(.RST_V(1'b1),.FREQ(SYS_FREQ),.T_NS(100)) 
        u_deb_ns(.clk(clk),.rst(rst),.in(present_sync),.out( present_deb));
        
        
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        PRESENT = 0;
        
        #200
            rst = 0;
        #200
            PRESENT = 0;
        #200
            PRESENT = 0;
    end
            
    
    
endmodule

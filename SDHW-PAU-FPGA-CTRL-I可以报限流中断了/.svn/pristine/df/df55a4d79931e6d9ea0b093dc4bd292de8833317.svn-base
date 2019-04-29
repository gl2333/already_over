`include "timescale.vh"
`include "simulation.vh"

module tb_fan_ctrl;


    parameter sys_clk_freq = 50_000_000;
    parameter pwm_freq     = 20_000    ;
    
    reg       clk         ;
    reg       rstn        ;
    reg [7:0] min_in_temp ;
    reg [7:0] max_out_temp;
    reg       manual      ; 
    reg [2:0] manual_speed;  
    wire      pwm         ;

    parameter T     = 1_000_000_000/sys_clk_freq;
    
    always #(T/2) clk = ~clk;
    
    initial begin
        clk          = 0;
        rstn         = 0;
        min_in_temp  = 0;
        max_out_temp = 0;
        manual       = 0;
        manual_speed = 0;
        
        #(500_000) rstn = 1; //reset mode
        #(500_000)     
                min_in_temp  = 15*2;  //auto, out > in 3
                max_out_temp = 18*2;
                manual       = 0;
                manual_speed = 0;
        #(500_000) 
                min_in_temp  = 40*2;  //auto, out > 40
                max_out_temp = 40*2;
                manual       = 0;
                manual_speed = 0;
        #(500_000)
                min_in_temp  = 15*2;  //manual, speed 0
                max_out_temp = 18*2;
                manual       = 1;
                manual_speed = 0;
        #(500_000)
                min_in_temp  = 15*2;  //manual, speed 2
                max_out_temp = 18*2;
                manual       = 1;
                manual_speed = 4;  
        end
    
    fan_ctrl #(
        .sys_clk_freq(sys_clk_freq),        
        .pwm_freq    (pwm_freq    )
    )
    dut (
        .clk         ( clk         ),
        .rstn        ( rstn        ),
        .min_in_temp ( min_in_temp ),
        .max_out_temp( max_out_temp),
        .manual      ( manual      ),
        .manual_speed( manual_speed),
        .pwm         ( pwm         )    
    );
endmodule

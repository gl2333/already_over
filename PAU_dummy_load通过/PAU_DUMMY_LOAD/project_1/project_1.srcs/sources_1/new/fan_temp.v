//lwjiee @ shende
//2018-4-13

//YYC@shende
//2017/02/16

`include "timescale.vh"
//`include "simulation.vh"

module fan_temp #(
    parameter SYS_FREQ = 100_000_000,
    parameter I2C_FREQ = 100_000   
)
(
    input         clk           ,
    input         rst           , 
    input         manual        ,
    input  [ 2:0] manual_speed  , 
    output [15:0] in_value      ,
    output [ 1:0] in_valid      , 
    output [31:0] out_value     ,
    output [ 3:0] out_valid     ,
    input         inlet_scl_in  ,
    output        inlet_scl_out ,
    input         inlet_sda_in  ,
    output        inlet_sda_out ,
    input         outlet_scl_in ,
    output        outlet_scl_out,
    input         outlet_sda_in ,
    output        outlet_sda_out,
    output        pwm  ,
	output        speed
);
    
    
        

 
    wire [7 :0] min_in_temp;
    wire [7 :0] max_out_temp,max_out_temp_01,max_out_temp_23;
    
    assign min_in_temp = (&in_valid) ?((in_value[15:8]>in_value[7:0]) ? in_value[7:0]:in_value[15:8]) :
                         (in_valid[0] ? in_value[7:0] : (in_valid[1] ? in_value[15:8]: 8'h0));
                         
    assign max_out_temp_01 = (&out_valid) ?((out_value[15:8 ]>out_value[7 :0 ]) ? out_value[15:8 ]:out_value[7 :0 ]) :
                             (out_valid[0] ? out_value[7 :0 ] : (out_valid[1] ? out_value[15:8]: 8'hFF));
    assign max_out_temp_23 = (&out_valid) ?((out_value[31:24]>out_value[23:16]) ? out_value[31:24]:out_value[23:16]) :
                             (out_valid[2] ? out_value[23:16] : (out_valid[3] ? out_value[31:24]: 8'hFF));                                
                         
    assign max_out_temp = (max_out_temp_01 > max_out_temp_23) ? max_out_temp_01 : max_out_temp_23;     
    
    fan_ctrl #(
        .SYS_FREQ(SYS_FREQ),        
        .PWM_FREQ(20_000  )
    )
    fan (
        .clk         ( clk         ),
        .rst         ( rst         ),
        .min_in_temp ( min_in_temp ),
        .max_out_temp( max_out_temp),
        .manual      ( manual      ),
        .manual_speed( manual_speed),
        .pwm         ( pwm         ),
		.speed(speed)
    );
    
    
    
    i2c_read_loop #(
        .SYS_FREQ(SYS_FREQ),        
        .I2C_FREQ(I2C_FREQ),        
        .CHN        (2          ),         
        .CHN_BIT_WID(1          ),         
        .HEAD_ADDR  (6'b100100  )
    )
    in_temp (
     .clk     ( clk          ),
     .rst     ( rst          ),
     .value   ( in_value     ),
     .valid   ( in_valid     ),
     .scl_in  ( inlet_scl_in ),
     .sda_in  ( inlet_sda_in ),
     .scl_out ( inlet_scl_out),
     .sda_out ( inlet_sda_out)
    );
    
    i2c_read_loop #(
        .SYS_FREQ(SYS_FREQ),        
        .I2C_FREQ(I2C_FREQ),        
        .CHN        (4          ),         
        .CHN_BIT_WID(2          ),         
        .HEAD_ADDR  (5'b10010   )
    )
    out_temp (
     .clk     ( clk           ),
     .rst     ( rst           ),
     .value   ( out_value     ),
     .valid   ( out_valid     ),
     .scl_in  ( outlet_scl_in ),
     .sda_in  ( outlet_sda_in ),
     .scl_out ( outlet_scl_out),
     .sda_out ( outlet_sda_out)
    );
endmodule

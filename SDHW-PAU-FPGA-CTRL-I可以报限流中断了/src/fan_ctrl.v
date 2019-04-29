//lwjiee @ shende
//2018-4-13

//YYC@shende
//2017/02/16

`include "timescale.vh"
`include "simulation.vh"

module fan_ctrl #(
    parameter SYS_FREQ = 100_000_000,
    parameter PWM_FREQ  = 20_000     
)
    (
     input       clk         ,
     input       rst         ,
     input [7:0] min_in_temp ,  //unit is °c
     input [7:0] max_out_temp,  //unit is °c
     input       manual      ,  //1 manual, 0 auto
     input [2:0] manual_speed,  //from 0 to 5
     output reg  pwm         
 );

    //PWM 0~5 stop~full speed 0 40 55 70 85 100
    localparam PWM0_HIGH_CNT =  0*SYS_FREQ/PWM_FREQ/10;
    localparam PWM1_HIGH_CNT =  2*SYS_FREQ/PWM_FREQ/10;
    localparam PWM2_HIGH_CNT =  4*SYS_FREQ/PWM_FREQ/10;
    localparam PWM3_HIGH_CNT =  6*SYS_FREQ/PWM_FREQ/10;
    localparam PWM4_HIGH_CNT =  8*SYS_FREQ/PWM_FREQ/10;
    localparam PWM5_HIGH_CNT = 10*SYS_FREQ/PWM_FREQ/10;
 
    wire [2:0] auto_speed = (((max_out_temp>(min_in_temp+8*2)) || max_out_temp>36*2) ? 5:
                            (((max_out_temp>(min_in_temp+6*2)) || max_out_temp>33*2) ? 4:
                            (((max_out_temp>(min_in_temp+4*2)) || max_out_temp>30*2) ? 3:
                            (((max_out_temp>(min_in_temp+2*2)) || max_out_temp>27*2) ? 2:
                            3'b1))));
                            
    wire [2:0] speed = manual? manual_speed: auto_speed;  
    
    reg  [31:0] pwm_high_cnt ;       
    always @(posedge clk) begin
        if(rst)
            pwm_high_cnt <= PWM1_HIGH_CNT ;
        else begin
            case(speed)
                3'd0:       pwm_high_cnt <= PWM0_HIGH_CNT;
                3'd1:       pwm_high_cnt <= PWM1_HIGH_CNT;
                3'd2:       pwm_high_cnt <= PWM2_HIGH_CNT;
                3'd3:       pwm_high_cnt <= PWM3_HIGH_CNT;
                3'd4:       pwm_high_cnt <= PWM4_HIGH_CNT;
                3'd5:       pwm_high_cnt <= PWM5_HIGH_CNT;
                default:    pwm_high_cnt <= PWM1_HIGH_CNT;
            endcase
        end
    end

    reg [31:0] pwm_total_cnt;
    always @(posedge clk) begin
            if(rst || (pwm_total_cnt==SYS_FREQ/PWM_FREQ-1))
                pwm_total_cnt <= 0;
            else
                pwm_total_cnt <= pwm_total_cnt + 1;
    end
        
    always @(posedge clk) begin
        if(rst)
            pwm <= 1'b0;
        else
            pwm <= (pwm_total_cnt < pwm_high_cnt);
    end

endmodule

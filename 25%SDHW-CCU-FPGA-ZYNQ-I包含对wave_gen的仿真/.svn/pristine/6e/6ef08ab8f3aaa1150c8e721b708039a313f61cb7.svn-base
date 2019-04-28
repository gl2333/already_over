module timer_pulse
#(
    parameter integer CLK_FREQ = 50_000_000
)
(
    input  clk         ,
    input  rstn        ,
    output p1us_loop   ,
    output p1ms_loop   ,
    output p10ms_loop  ,
    output p100ms_loop ,
    output p1s_once      
);

localparam CNT_1_US  = CLK_FREQ/1_000_000;

pulse_loop_counter #(.CNT_BIT_WID( 8),.GATE_NUM(CNT_1_US),.LOOP_TYPE(1)) plc_1_us  (.clk(clk),.rstn(rstn),.p_in(          1),.p_out(   p1us_loop));
pulse_loop_counter #(.CNT_BIT_WID(10),.GATE_NUM(    1000),.LOOP_TYPE(1)) plc_1_ms  (.clk(clk),.rstn(rstn),.p_in(  p1us_loop),.p_out(   p1ms_loop));
pulse_loop_counter #(.CNT_BIT_WID( 4),.GATE_NUM(      10),.LOOP_TYPE(1)) plc_10_ms (.clk(clk),.rstn(rstn),.p_in(  p1ms_loop),.p_out(  p10ms_loop));
pulse_loop_counter #(.CNT_BIT_WID( 4),.GATE_NUM(      10),.LOOP_TYPE(1)) plc_100_ms(.clk(clk),.rstn(rstn),.p_in( p10ms_loop),.p_out( p100ms_loop));
pulse_loop_counter #(.CNT_BIT_WID( 4),.GATE_NUM(      10),.LOOP_TYPE(0)) plc_1_s   (.clk(clk),.rstn(rstn),.p_in(p100ms_loop),.p_out(    p1s_once));
endmodule
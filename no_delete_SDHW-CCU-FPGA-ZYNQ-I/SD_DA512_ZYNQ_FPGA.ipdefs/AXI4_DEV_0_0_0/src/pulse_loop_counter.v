module pulse_loop_counter 
#( 
    parameter integer CNT_BIT_WID = 32,
    parameter integer GATE_NUM = 100,
    parameter integer LOOP_TYPE = 1)  //1: loop, 0:only once
(
    input clk,
    input rstn,
    input p_in,
    output reg p_out,
    output reg [CNT_BIT_WID-1:0]p_in_cnt  
);

always@(posedge clk) begin
    if(!rstn || (p_in_cnt == GATE_NUM + 1))begin
        p_out <= 0;
        p_in_cnt <= 0;
    end
    else if(p_in_cnt == GATE_NUM) begin
        p_out <= 1;
        if(~LOOP_TYPE) p_in_cnt <= GATE_NUM+1;
        else if(p_in) p_in_cnt <= 1;
        else p_in_cnt <= 0;
    end
    else begin
        p_out <= 0;
        if(p_in) p_in_cnt <= p_in_cnt + 1;
    end
end
endmodule


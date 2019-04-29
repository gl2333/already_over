module phs_gen 
(
    input rst,
    input clk,
    input en,
    input [7:0] cfg,
    output reg o
);

    localparam INVL = 16;       //inteveral time, also dead time
    localparam HALF = 128;      //half cycle 
    
    localparam IDLE      = 3'd0;
    localparam WAIT_UP   = 3'd1;
    localparam UP        = 3'd2;
    localparam WAIT_DOWN = 3'd3;
    localparam DOWN      = 3'd4;
    
    reg [2:0] state, next_state;
    reg [7:0] cnt,next_cnt,cnt_r;    
    reg next_o;
    reg up, down;
    
    
    always@(posedge clk) 
        if(rst) state <= #1 IDLE;        
        else state    <= #1 next_state;

    always@(posedge clk) begin
        cnt     <= #1 next_cnt;
        cnt_r   <= #1 cnt;
        up      <= #1 (cnt_r == 8'd0);
        down    <= #1 (cnt_r == HALF-INVL);        
        o       <= #1 next_o;
    end
    
    always@(*) begin
        next_state <= state;
        next_cnt <= cnt + 8'd1;
        next_o <= o;
        
        case(state)
            IDLE : begin
                next_o <= 1'b0;
                if(en) begin
                    next_state <= WAIT_UP;
                    next_cnt   <= cfg;
                end
            end
            WAIT_UP :
                if(up) next_state <= UP;
            UP: begin
                next_o <= 1'b1;
                next_state <= WAIT_DOWN;
            end
            WAIT_DOWN : 
                if(down) next_state <= DOWN;
            DOWN: begin
                next_o <= 1'b0;
                if(en) next_state <= WAIT_UP;
                else next_state <= IDLE;
            end
            default : next_state <= IDLE;
        endcase
    end
endmodule      
   
//localparam DT_SET = 16;
//	reg [255:0] shiftRegA;
//	reg [255:0] shiftRegB;
//    
//	always @(posedge clk_phs) 
//        if(!TRIGGER_IN) begin
//		    shiftRegA <= #1  {{128{1'b0}},{128-DT_SET{1'b1}},{DT_SET{1'b0}}};	
//		    shiftRegB <= #1  {{128-DT_SET{1'b1}},{DT_SET{1'b0}},{128{1'b0}}};
//		end			
//		else begin
//		    shiftRegA <= #1  {shiftRegA[254:0],shiftRegA[255]};
//		    shiftRegB <= #1  {shiftRegB[254:0],shiftRegB[255]}; 
//		end
//    
//    wire XiDadaApproved = TRIGGER_IN && (!rst) && reg_sw_glb; // && reg_gen_vf
//    
//	generate
//		for(j=0;j<`CHN;j=j+1)
//		begin: Mux
//			assign PHASE_A[j] = (XiDadaApproved && reg_sw_chn[j]) ? shiftRegA[reg_phs[j*8+:8]]: 1'b0;
//			assign PHASE_B[j] = (XiDadaApproved && reg_sw_chn[j]) ? shiftRegB[reg_phs[j*8+:8]]: 1'b0;
//		end
//	endgenerate
//



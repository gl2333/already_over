//lwjiee@Shende
//2017-3-20 15:12:31
`timescale 1ns/100ps



//wire [                          `OFTM_NUM-1:0]                temp_valid;   
//generate
//for(j=0;j<`OFTM_NUM;j=j+1)begin: oftm_master_inst   
//    oftm  #(
//        .SYS_FREQ (`FPGA_SYS_CLK_FREQ),
//        .BAUD_RATE(19200))
//    u_oftm (
//        .clk(S_CLK),
//        .rst(reg_zynq_gen_rst),
//        //.RX(temp_tx_deb[j]),
//        .RX(1'b1),
//        .linkOK(reg_oftm_sta[j]),
//        .tempVal(reg_oftm_tv[j*32+:`OFTM_TV_BIT_WID]),
//        .tvValid(temp_valid[j]),
//        .errCode());
//end
//endgenerate

module oftm #(
	parameter SYS_FREQ=100000000,
    parameter BAUD_RATE=19200)(
	input clk,
	input rst,
	input RX,
	output reg linkOK, 	//1 ok, 0 error
	output reg tvValid, //1 ok, 0 error
	output reg [15:0] tempVal,
	output reg [3:0 ] errCode
);

reg nextLinkOK;
reg nextTvValid;
reg [15:0]nextTempVal;
reg [3:0]nextErrCode;
reg [3:0]state;
reg [3:0]nextState;
reg [29:0]clkCnt;
reg [29:0]nextClkCnt;
reg [2:0]bitCnt;
reg [2:0]nextBitCnt;
reg [2:0]byteCnt;
reg [2:0]nextByteCnt;
reg [7:0]rdByte;
reg [7:0]nextRdByte;

localparam WAIT_HIGH = 0; 
localparam WAIT_IDLE = 1;
localparam WAIT_START= 2;
localparam START	 = 3;
localparam RD_WAIT	 = 4;
localparam RD_DATA	 = 5;
localparam STOP		 = 6;
localparam ERR_LINE  = 7;	
localparam ERR_WAIT  = 8;
localparam ERR_START = 9;
localparam ERR_STOP  =10;		

wire TIME_100_MS   = (clkCnt == SYS_FREQ/10			);
wire TIME_500_MS   = (clkCnt == SYS_FREQ/2			);
wire HALF_BIT    = (clkCnt == SYS_FREQ/BAUD_RATE/2	);
wire FULL_BIT    = (clkCnt == SYS_FREQ/BAUD_RATE	);	

always@(posedge clk)begin
	if(rst) begin
		state   <= #1 WAIT_HIGH;
		linkOK  <= #1 0;
		tempVal <= #1 0;
		clkCnt	<= #1 0;
		bitCnt	<= #1 0;
		byteCnt <= #1 0;
		rdByte	<= #1 0;
		errCode <= #1 0;
		tvValid <= #1 0;
	end         
	else begin  
		state   <= #1 nextState;
		linkOK  <= #1 nextLinkOK;
		tempVal <= #1 nextTempVal;
		clkCnt  <= #1 nextClkCnt;
		bitCnt	<= #1 nextBitCnt;
		rdByte	<= #1 nextRdByte;
		byteCnt <= #1 nextByteCnt;
		errCode <= #1 nextErrCode;
		tvValid <= #1 nextTvValid;
	end
end

always @(*)begin
	nextState		<= #1 state     ;
	nextLinkOK		<= #1 linkOK    ;
	nextTempVal  	<= #1 tempVal	;
	nextClkCnt    	<= #1 clkCnt 	;
	nextBitCnt		<= #1 bitCnt 	;
	nextRdByte		<= #1 rdByte	;
	nextErrCode  	<= #1 errCode	;
	nextTvValid 	<= #1 tvValid	;
	nextByteCnt     <= #1 byteCnt   ;

	if(state != nextState) nextClkCnt <= #1 0;
	else nextClkCnt <= #1 clkCnt + 1;
	
	case(state)
	WAIT_HIGH : if(RX) begin
					nextState <= #1 WAIT_IDLE;
					nextByteCnt <= #1 0;
				end
				else if(TIME_500_MS)nextState <= #1 ERR_LINE; 
	WAIT_IDLE : if(!RX)nextState <= #1 WAIT_HIGH;
				else if(TIME_100_MS)nextState <= #1 WAIT_START; 
	WAIT_START: if(!RX)nextState <= #1 START;
				else if(TIME_500_MS)nextState <= #1 ERR_WAIT;
	START	  : if(RX)nextState <= #1 ERR_START;
				else if(HALF_BIT) begin
					nextState <= #1 RD_WAIT;
					nextBitCnt <= #1 0;
				end
	RD_WAIT	  : if(FULL_BIT) nextState <= #1 RD_DATA;
	RD_DATA	  :	begin
					nextRdByte <= #1 {RX, rdByte[7:1]};
					nextBitCnt <= #1  bitCnt + 1;
					if(bitCnt == 7)	nextState <= #1 STOP;
					else nextState <= #1 RD_WAIT;
				end
	STOP	  : if(FULL_BIT) begin
					nextByteCnt <= #1  byteCnt + 1;
					if(RX) begin 
                        if(byteCnt == 3) begin
                            nextTempVal[15:8] <= #1 rdByte;
							nextTvValid <= 1;
							nextLinkOK <= 1;
                        end
						else if(byteCnt == 2) begin 
							nextTempVal[7:0]  <= #1 rdByte; 
							nextTvValid <= 0;
						end
						else if(byteCnt == 7)                             
							nextState <= #1 WAIT_HIGH;
						nextState <= #1 WAIT_START;		
					end
					else nextState <= #1 ERR_STOP;
				end
	ERR_LINE :  begin
					nextErrCode[0] <= #1 1;
					nextLinkOK <= 0;
					nextState <= #1 WAIT_HIGH;
				end
	ERR_WAIT :  begin
					nextErrCode[1] <= #1 1;
					nextLinkOK <= 0;
					nextState <= #1 WAIT_HIGH;
				end
	ERR_START:  begin
					nextErrCode[2] <= #1 1;
					nextLinkOK <= 0;
					nextState <= #1 WAIT_HIGH;
				end
	ERR_STOP :  begin
					nextErrCode[3] <= #1 1;
					nextLinkOK <= 0;
					nextState <= #1 WAIT_HIGH;
				end
	default  : 	nextState <= #1 WAIT_HIGH;
	endcase
end
endmodule



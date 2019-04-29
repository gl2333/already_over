//2018-3-28
//lwjiee @ Shende Medical


//see THE I2C-BUS SPECIFICATION Version 2.1 2000.01
//support 10Khz to 100Khz

`include "timescale.vh"
`include "simulation.vh"

module i2cMaster#(
    parameter RD_ONLY        =0,
    parameter SYS_FREQ       =25_000_000,
    parameter I2C_FREQ       =10_000,
    parameter MUTEX_ENABLE   =1,
    parameter WR_LEN_BIT_WID =3,
    parameter WR_BUF_BYTE_NUM=4, //max is 1022
    parameter RD_LEN_BIT_WID =3,
    parameter RD_BUF_BYTE_NUM=4
)
(  
    input                               rst      ,//
    input                               clk      ,//
    input                               start    ,//output, 0 free, 1 busy, auto clear after I2C operation done
    input                               sclIn    ,//input pulse, when sta=0 set sta to 1, when sta=1 nothing happen
    input                               sdaIn    ,//not allow change when busy
    output                              mutexSta ,//not allow change when busy
    input                               mutexGet ,//not allow change when busy
    output reg                          sclOut   ,//
    output                              sdaOut   ,//not allow change when busy
    output reg                          busy     ,//pulse              
    output reg                          done     ,//last until done
    output reg                          errLine  ,//pulse, generate both include OK and ERROR
    output reg                          errNack  ,//pulse
    input       [                  6:0] addr     ,//pulse
    output wire [                  7:0] debug    ,//input for master
    input       [WR_BUF_BYTE_NUM*8-1:0] wrBuf    ,//output for master
    input       [   WR_LEN_BIT_WID-1:0] wrLen    ,//output for master
    output reg  [RD_BUF_BYTE_NUM*8-1:0] rdBuf    ,//wire
    input       [   RD_LEN_BIT_WID-1:0] rdLen    //
);

    localparam IDLE    =4'd0 ;    
    localparam MUTEX   =4'd1 ;    
    localparam START1  =4'd2 ;
    localparam START2  =4'd3 ;
    localparam WR1     =4'd4 ;
    localparam WR2     =4'd5 ;
    localparam SACK1   =4'd6 ;
    localparam SACK2   =4'd7 ;
    localparam RD1     =4'd8 ;
    localparam RD2     =4'd9 ;
    localparam MACK1   =4'd10;
    localparam MACK2   =4'd11;
    localparam STOP1   =4'd12;
    localparam STOP2   =4'd13;
    localparam ERR_LINE=4'd14;
    localparam ERR_NACK=4'd15;

    localparam SDA_DELAY=4;	
	reg                 sdaOutOri;
    reg [SDA_DELAY-1:0] sdaOutDly;
    
    always @( posedge clk )
        if (rst)   sdaOutDly <= #1 {SDA_DELAY{1'b1}};
        else       sdaOutDly <= #1 {sdaOutDly[SDA_DELAY-2:0],sdaOutOri};
    
    assign sdaOut=sdaOutDly[SDA_DELAY-1];  
    
    localparam MUTEX_DELAY=6;
    reg                   mutexStaOri;
    reg [MUTEX_DELAY-1:0] mutexStaDly;
    
    always @( posedge clk )
        if (rst)   mutexStaDly <= #1 {MUTEX_DELAY{1'b0}};
        else       mutexStaDly <= #1 {mutexStaDly[MUTEX_DELAY-2:0],mutexStaOri};
    
    assign mutexSta=mutexStaDly[MUTEX_DELAY-1]; //for axi bus read right value
    
    reg [15:0]STATE,nSTATE;
    reg [12:0]clkCnt;
    reg [2:0]bitCnt;
    reg [WR_LEN_BIT_WID+RD_LEN_BIT_WID:0]byteCnt;
    reg restart;

    always@(posedge clk)
        if(rst)   STATE <= #1 32'b1 ; //IDLE
        else      STATE <= #1 nSTATE;

    wire halfBit = (clkCnt==(SYS_FREQ/I2C_FREQ)/2-1);
	wire stop2Idle = restart || (rdLen==0) || errNack;
    always @(*) begin
        nSTATE  =32'b0;        
        case(1'b1)
        STATE[IDLE]: 
            if(MUTEX_ENABLE && (!mutexGet)) nSTATE[IDLE] =1'b1; 
            else                            nSTATE[MUTEX]=1'b1;
                
        STATE[MUTEX]: 
            if(!start)                 nSTATE[MUTEX]   =1'b1;             
            else if (!sclIn || !sdaIn) nSTATE[ERR_LINE]=1'b1;
            else                       nSTATE[START1]  =1'b1;
        
        STATE[START1]: 
            if(!halfBit) nSTATE[START1]=1'b1;
            else         nSTATE[START2]=1'b1;
        
        STATE[START2]:
            if(!halfBit) nSTATE[START2]=1'b1;
            else         nSTATE[WR1]   =1'b1;

        STATE[WR1]:    
            if(!halfBit) nSTATE[WR1]=1'b1;
            else         nSTATE[WR2]=1'b1;
        
        STATE[WR2]:  
            if(!halfBit)       nSTATE[WR2]  =1'b1;
            else if(bitCnt==7) nSTATE[SACK1]=1'b1;
            else               nSTATE[WR1]  =1'b1;       
        
        STATE[SACK1]:
            if(!halfBit)   nSTATE[SACK1]   =1'b1;
            else if(sdaIn) nSTATE[ERR_NACK]=1'b1;
            else           nSTATE[SACK2]   =1'b1;
        
        STATE[SACK2]:
            if(!halfBit)              nSTATE[SACK2]=1'b1;            
            else if(restart)          nSTATE[RD1]  =1'b1; 
            else if(byteCnt==wrLen+1) nSTATE[STOP1]=1'b1;
            else                      nSTATE[WR1]  =1'b1;
        
        STATE[RD1]:
            if(!halfBit) nSTATE[RD1]=1'b1;
            else         nSTATE[RD2]=1'b1;
        
        STATE[RD2]:
            if(!halfBit)         nSTATE[RD2]=1'b1;
            else if(bitCnt==7) nSTATE[MACK1]=1'b1;
            else                 nSTATE[RD1]=1'b1;
        
        STATE[MACK1]:
            if(!halfBit) nSTATE[MACK1]=1'b1;
            else         nSTATE[MACK2]=1'b1;
        
        STATE[MACK2]:
            if(!halfBit)              nSTATE[MACK2]=1'b1;
            else if(byteCnt==rdLen+1) nSTATE[STOP1]=1'b1;
            else                      nSTATE[RD1]  =1'b1;
    
        STATE[STOP1]:
            if(!halfBit) nSTATE[STOP1]=1'b1;
            else         nSTATE[STOP2]=1'b1;
        
        STATE[STOP2]:
            if(!halfBit)                   nSTATE[STOP2] =1'b1;
            else if(stop2Idle) 			   nSTATE[IDLE]  =1'b1;
            else                           nSTATE[START1]=1'b1;
        
        STATE[ERR_LINE]: nSTATE[IDLE]=1'b1;

        STATE[ERR_NACK]: 
			if(!halfBit) nSTATE[ERR_NACK]=1'b1;
			else		 nSTATE[STOP1]	 =1'b1;
        
        default: nSTATE[IDLE]=1'b1;    
        endcase
    end
    
    always@(posedge clk) 
        if(STATE[IDLE])         busy <= #1 0;
        else if(STATE[START1])  busy <= #1 1;
    
    always@(posedge clk) 
        if(STATE[IDLE])                                       restart <= #1 0;               
        else if(RD_ONLY || (STATE[STOP2] && nSTATE[START1]))  restart <= #1 1;
    
    always@(posedge clk)
        if(STATE!=nSTATE) clkCnt <= #1 0;
        else              clkCnt <= #1 clkCnt + 1;
    
    wire bitAdd=(STATE[WR2] || STATE[RD2]) && halfBit;
    
    always@(posedge clk)
        if(STATE[START1]) 
            bitCnt <= #1 0;
        else if(bitAdd) 
            bitCnt <= #1 bitCnt + 1;
    
    always@(posedge clk)
        if(STATE[START1]) 
            byteCnt <= #1 0;
        else if(bitAdd && (bitCnt==7)) 
            byteCnt <= #1 byteCnt + 1;
    
    always@(posedge clk)
        if(STATE[RD1] && halfBit)
            rdBuf[byteCnt*8-1-bitCnt] <= #1 sdaIn;
            
    always@(posedge clk)
        if(STATE[WR1]||STATE[RD1]||STATE[MACK1]||STATE[SACK1]||STATE[STOP1])
             sclOut <= #1 0;
        else sclOut <= #1 1; 

    always@(posedge clk)
        if(STATE[START2]||STATE[STOP1]||STATE[STOP2])
            sdaOutOri <= #1 0;
        else if(STATE[WR1]||STATE[WR2])begin
            if(byteCnt !=0)      sdaOutOri <= #1 wrBuf[byteCnt*8-1-bitCnt];
            else if (bitCnt==7)  sdaOutOri <= #1 restart;
            else                 sdaOutOri <= #1 addr[6-bitCnt];
        end
        else if(STATE[MACK1]||STATE[MACK2])
             sdaOutOri <= #1 (byteCnt==rdLen+1);
        else sdaOutOri <= #1 1;

		
		
		
    always@(posedge clk)
        if(STATE[ERR_LINE]) 
		errLine <= #1 1;
        else                errLine <= #1 0;

    always@(posedge clk)
        if(STATE[ERR_NACK])  errNack <= #1 1;
        else if(STATE[IDLE]) errNack <= #1 0;
    
    wire errOrDone= STATE[ERR_LINE]||STATE[ERR_NACK]|| (STATE[STOP2] && halfBit && stop2Idle);
    always@(posedge clk)
        if(errOrDone) 
             done <= #1 1;
        else done <= #1 0;
    
    always@(posedge clk)
        if(STATE[IDLE] && MUTEX_ENABLE && mutexGet) mutexStaOri <= #1 1;
        else if(errOrDone)                          mutexStaOri <= #1 0;

assign debug[4:0]=STATE;
assign debug[7:5]=byteCnt; 
endmodule

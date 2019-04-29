`timescale 1ns/1ps
//lwjiee@shende
//2018-4-11
`include "timescale.vh"
//`include "simulation.vh"



module amp_ctrl #(
    parameter SYS_FREQ = 50_000_000,
    parameter I2C_FREQ = 100_000    
)
(
    input            clk     ,
    input            rst     ,
    output reg       r_err   ,
    output reg       vi_err  ,
    output reg [7:0] v       ,
    output reg [7:0] i       ,
    output reg [7:0] r_rd    ,
    input      [7:0] r_wr    ,  //r_wr must remain unchanged during i2c write operation
    input            r_wren  ,  //
	//output     [4:0] state,
	//output 			 power_up_delay,
	//output 			 start,
	//output 			 next_state,
	//output 			 next_start,
	//output 			 next_wrLen,
    input            scl_in  ,
    output           scl_out ,
    input            sda_in  ,
    output           sda_out 
);
    localparam R_ISL95811_ADDR = 7'b0101_000;  
    localparam E_PAC1710_ADDR  = 7'b0011_000;  
 
    localparam IDLE       = 0  ;
    localparam CFG1_GO    = 1  ;
    localparam CFG1_BUSY  = 2  ;
    localparam CFG1_END   = 3  ;
    localparam CFG2_GO    = 4  ;
    localparam CFG2_BUSY  = 5  ;
    localparam CFG2_END   = 6  ;
    localparam CFG3_GO    = 7  ;
    localparam CFG3_BUSY  = 8  ;
    localparam CFG3_END   = 9  ;
    localparam RD_V_GO    = 10 ;
    localparam RD_V_BUSY  = 11 ;
    localparam RD_V_END   = 12 ;
    localparam RD_I_GO    = 13 ;
    localparam RD_I_BUSY  = 14 ;
    localparam RD_I_END   = 15 ;
    localparam RD_R_GO    = 16 ;
    localparam RD_R_BUSY  = 17 ;
    localparam RD_R_END   = 18 ;
    localparam WR_R_SETUP = 19 ;
    localparam WR_R_GO    = 20 ;
    localparam WR_R_BUSY  = 21 ;
    localparam WR_R_END   = 22 ;
    localparam VI_ERR     = 23 ;
    localparam R_ERR      = 24 ;
    localparam ERROR_SLEEP= 25 ;
    
    reg  [4 :0] state;  
    reg  [6 :0] addr;
    reg  [15:0] wrBuf;
    reg  [1 :0] wrLen;
    reg         rdLen;
    reg         start;
    reg  [31:0] cnt;
    reg         r_wr_cmd;
    wire [7 :0] rdBuf;
    wire        err;
    wire        errLine;
    wire        errNack;
    wire        done;
    reg  [4 :0] next_state;
    reg  [7 :0] next_v; 
    reg  [7 :0] next_i;
    reg  [7 :0] next_r_rd;
    reg         next_r_err;
    reg         next_vi_err;
    reg  [6 :0] next_addr;
    reg  [15:0] next_wrBuf;
    reg  [1 :0] next_wrLen;  
    reg         next_rdLen;
    reg         next_start;
    reg  [31:0] next_cnt;
    reg         next_r_wr_cmd;
    
 
always @(posedge clk)begin
    if(rst)begin
        state    <=  IDLE;
        addr     <=  0;
        wrBuf    <=  16'b0;
        wrLen    <=  0;
        rdLen    <=  0;
        start    <=  0;
        cnt      <=  0;
        r_err    <=  0;
        vi_err   <=  0;
        v        <=  0;
        i        <=  0;
        r_rd     <=  0;
        r_wr_cmd <=  0;  
    end
    else begin
        state    <=  next_state   ;
        addr     <=  next_addr    ;
        wrBuf    <=  next_wrBuf   ;
        wrLen    <=  next_wrLen   ;
        rdLen    <=  next_rdLen   ;
        start    <=  next_start   ;
        cnt      <=  next_cnt     ;
        r_err    <=  next_r_err   ;
        vi_err   <=  next_vi_err  ;
        v        <=  next_v       ;
        i        <=  next_i       ;
        r_rd     <=  next_r_rd    ;
        r_wr_cmd <=  next_r_wr_cmd;
    end
end



/*
when I2C freq set to 100Khz, T is 10us
write one byte cost 33 cycles = 330 us
read one byte cost 47 cycles = 470 us
*/

  
//assign beat           = (cnt == 50); //unit 100 us
//assign power_up_delay =	(cnt == 5); //unit 1 ms
//assign wr_r_setup     = (cnt == 15); //unit 300 us
//assign wr_r_hold      = (cnt == 20); //unit 400 us
//assign error_sleep    = (cnt == 5  ); //unit 1 ms


`ifdef SIMULATION
wire beat           = cnt == 1*(SYS_FREQ/1000_0); //unit 100 us
wire power_up_delay = cnt == 1*(SYS_FREQ/1000  ); //unit 1 ms
wire wr_r_setup     = cnt == 3*(SYS_FREQ/1000_0); //unit 300 us
wire wr_r_hold      = cnt == 4*(SYS_FREQ/1000_0); //unit 400 us
wire error_sleep    = cnt == 1*(SYS_FREQ/1000  ); //unit 1 ms
`else    
//this style is very danger, because 2000*sys is beyond 2^32 >>>>>>>>> (2_000*SYS_FREQ)/1000                           
wire beat           = (cnt == (SYS_FREQ/100  )); //10ms , read V/I/R loop costs 30ms
wire power_up_delay = (cnt == (SYS_FREQ/2    )); //500ms, delay from power up to start run
wire wr_r_setup     = (cnt == (SYS_FREQ/100  )); //10ms , delay before write resistor value
wire wr_r_hold      = (cnt == (SYS_FREQ/20   )); //50ms , delay after resistor nand flash programming 
                                                 //     , must above 20ms accord to ISL95811 spec
wire error_sleep    = (cnt == (SYS_FREQ/1    )); //1s   , delay after err_nack / err_line occurs
`endif

assign err = errLine || errNack;
  
always @ (*)begin 
    next_state    <= #1 state   ;
    next_addr     <= #1 addr    ;
    next_wrBuf    <= #1 wrBuf   ;
    next_wrLen    <= #1 wrLen   ;
    next_rdLen    <= #1 rdLen   ;
    next_start    <= #1 start   ;
    next_r_err    <= #1 r_err   ;
    next_vi_err   <= #1 vi_err  ;
    next_v        <= #1 v       ;
    next_i        <= #1 i       ;
    next_r_rd     <= #1 r_rd    ;
    next_r_wr_cmd <= #1 r_wr_cmd;
   
    
    if(state!=next_state) next_cnt <=  0;
    else  next_cnt <=  cnt + 1;
     
    if(start) next_start <=  0;
    if(r_err) next_r_err <=  0;
    if(vi_err) next_vi_err <=  0;
    
    if(r_wren) next_r_wr_cmd <=  1;
    
    case(state)
    IDLE:
        if(power_up_delay) next_state <= CFG1_GO;
    
    CFG1_GO:begin  //cfg resistor to zero
        next_addr  <= R_ISL95811_ADDR;
        next_wrBuf <= {8'h00,8'h00}; //high reg val, low reg addr  
        next_wrLen <= 2;
        next_rdLen <= 0;
        next_start <= 1;
        next_state <= CFG1_BUSY;
    end
    
    CFG1_BUSY:
        if(done)begin
            if(err)next_state <= R_ERR; 
            else next_state <= CFG1_END; 
        end
    
    CFG1_END:
        if(beat) next_state <= CFG2_GO; 
        
    CFG2_GO:
        next_state <= CFG2_BUSY;
        
    CFG2_BUSY:
        next_state <= CFG2_END;
    
    CFG2_END:        
        if(beat) next_state <= CFG3_GO;
            
    CFG3_GO:
        next_state <= CFG3_BUSY;
        
    CFG3_BUSY:
        next_state <= CFG3_END;
    
    CFG3_END:        
        if(beat) next_state <= RD_V_GO;
        
    RD_V_GO:begin
        next_addr  <= E_PAC1710_ADDR ;
        next_wrBuf <= {8'h00,8'h11}  ;
        next_wrLen <= 1              ;
        next_rdLen <= 1              ;
        next_start <= 1              ;
        next_state <= RD_V_BUSY      ;
    end
    
    RD_V_BUSY:    //b
        if(done)begin
            if(err)begin
                next_v     <= 0;
                next_state <= VI_ERR; 
            end            
            else begin     
                next_v     <= rdBuf;
                next_state <= RD_V_END; 
            end
        end
        
    RD_V_END:    //c
        if(r_wr_cmd)  next_state <= WR_R_SETUP;
        else if(beat) next_state <= RD_I_GO;
        
    RD_I_GO:begin     //d
        next_addr  <= E_PAC1710_ADDR;
        next_wrBuf <= {8'h00,8'h0D}  ;
        next_wrLen <= 1              ;
        next_rdLen <= 1              ;
        next_start <= 1              ;
        next_state <= RD_I_BUSY      ;
    end
    
    RD_I_BUSY:   
        if(done)begin
            if(err)begin
                next_i     <= 0;
                next_state <= VI_ERR; 
            end
            else begin
                next_i     <= rdBuf;
                next_state <= RD_I_END; 
            end
        end
        
    RD_I_END:
        if(r_wr_cmd)  next_state <= WR_R_SETUP;
        else if(beat) next_state <= RD_R_GO;
        
    RD_R_GO:begin
        next_addr  <= R_ISL95811_ADDR;
        next_wrBuf <= {8'h00,8'h00}   ;
        next_wrLen <= 1               ; 
        next_rdLen <= 1               ;
        next_start <= 1               ;
        next_state <= RD_R_BUSY       ;
    end
    
    RD_R_BUSY:
        if(done)begin
            if(err)begin
                next_r_rd  <= 0;
                next_state <= R_ERR; 
            end
            else begin
                next_r_rd  <= rdBuf;
                next_state <= RD_R_END; 
            end
        end
        
    RD_R_END:
        if(r_wr_cmd)  next_state <= WR_R_SETUP;
        else if(beat) next_state <= RD_V_GO;
    
    WR_R_SETUP:   //13
        if(wr_r_setup) next_state <= WR_R_GO;
    
    WR_R_GO: begin
        next_addr     <= R_ISL95811_ADDR;
        next_wrBuf    <= {r_wr,8'h00}    ;//high 8 reg val, low 8 reg addr
        next_wrLen    <= 2               ;
        next_rdLen    <= 0               ;
        next_start    <= 1               ;
        next_state    <= WR_R_BUSY       ;        
        next_r_wr_cmd <= 0               ;
    end
    
    WR_R_BUSY:
        if(done)begin
            if(err)next_state <= R_ERR; 
            else   next_state <= WR_R_END; 
        end
        
    WR_R_END:
        if(wr_r_hold) begin
            if(r_wr_cmd) next_state <= WR_R_SETUP;
            else         next_state <= RD_V_GO;
        end
    
    R_ERR:begin
        next_r_err <= 1;
        next_state <= ERROR_SLEEP;
        next_r_wr_cmd <= 0;  
    end
    
    VI_ERR:begin
        next_vi_err <= 1;
        next_state <= ERROR_SLEEP;        
        next_r_wr_cmd <= 0;
    end
    
    ERROR_SLEEP:
        if(error_sleep)   next_state <= RD_V_GO;
    
    default:
        next_state <= IDLE;
    endcase
end

 i2cMaster # ( 
    .SYS_FREQ       (SYS_FREQ),
    .I2C_FREQ       (I2C_FREQ),
    .WR_LEN_BIT_WID (2       ),  
    .WR_BUF_BYTE_NUM(2       ),
    .RD_LEN_BIT_WID (1       ),
    .RD_BUF_BYTE_NUM(1       ),
    .MUTEX_ENABLE   (0       )
 ) 
 u_i2cm (
 .rst     (rst    ),
 .clk     (clk    ),
 .mutexSta(       ),
 .mutexGet(1'b0   ),
 .addr    (addr   ),
 .wrBuf   (wrBuf  ),
 .wrLen   (wrLen  ),
 .rdBuf   (rdBuf  ),
 .rdLen   (rdLen  ),
 .start   (start  ),
 .busy    (       ),
 .done    (done   ),
 .errLine (errLine),
 .errNack (errNack),
 .sclIn   (scl_in ),
 .sdaIn   (sda_in ),
 .sclOut  (scl_out),
 .sdaOut  (sda_out),
 .debug   (       )
 );  
endmodule

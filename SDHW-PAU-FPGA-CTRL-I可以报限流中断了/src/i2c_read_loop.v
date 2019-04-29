//lwjiee@shende
//2018-4-13

`include "timescale.vh"
`include "simulation.vh"

module i2c_read_loop#(
    parameter SYS_FREQ    = 100_000_000, 
    parameter I2C_FREQ    = 100_000    , 
    parameter CHN         = 2          , 
    parameter CHN_BIT_WID = 1          , 
    parameter HEAD_ADDR   = 6'b100100   // wid = 7-CHN_BIT_WID
)
(
    input                       clk     ,
    input                       rst     ,
    output reg [CHN*8-1:0]  	value   ,
    output reg [CHN-1  :0]  	value_update,
    input                       scl_in  ,
    input                       sda_in  ,
    output                      scl_out ,
    output                      sda_out 
); 

    localparam IDLE       = 0  ;    
    localparam RD_GO      = 1  ;
    localparam RD_BUSY    = 2  ;
    localparam RD_END     = 3  ;
    localparam ERR_SLEEP  = 4  ;
    
    reg [2:0] state, next_state;
    reg  [31:0] cnt, next_cnt;
    reg [CHN_BIT_WID-1:0] chn, next_chn;
    reg [6:0] addr, next_addr;
    reg start, next_start;
    reg [CHN*8-1:0]  next_value;
    reg [CHN-1  :0]  next_value_update;
      
    always @(posedge clk)begin
        if(rst)begin
            state <= #1  IDLE;
            chn   <= #1  0   ;
            addr  <= #1  0   ;
            value <= #1  0   ;
            start <= #1  0   ;
            cnt   <= #1  0   ;
        end
        else begin 
            state <= #1  next_state;
            chn   <= #1  next_chn  ;
            addr  <= #1  next_addr ;
            value <= #1  next_value;
            start <= #1  next_start;
            cnt   <= #1  next_cnt  ;
        end
    end
    
	always @(posedge clk)begin
        if(rst)						value_update <= #1  0   ;
		else if(state == RD_BUSY)   value_update <= #1  next_value_update;
		else 						value_update <= #1  0   ;
	end
	
    `ifdef SIMULATION    
    wire beat           = (cnt == SYS_FREQ/1000_00); //10 us 
    wire power_up_delay = (cnt == SYS_FREQ/1000_00)   ; //1ms  
    `else       
    wire beat           = (cnt == SYS_FREQ/100)    ; //10 ms
    wire power_up_delay = (cnt == SYS_FREQ*1)      ; //1 sec
    `endif
    
    wire done;
    wire [7:0] rd_buf;    
    wire err_both, err_line, err_nack;
    assign err_both = err_line || err_nack;
       
    always @ (*)begin 
        next_state        <= #1  state ;
        next_chn          <= #1  chn   ;
        next_addr         <= #1  addr  ;
        next_value        <= #1  value ;
        next_value_update <= #1  value_update ;
        next_start        <= #1  start ;
        
        if(state!=next_state) next_cnt <= #1 0;
        else  next_cnt <= #1 cnt + 1;
                
        if(start) next_start <= #1 0;
        
        case(state)
        IDLE:
            if(power_up_delay) next_state <= #1 RD_GO;               
        RD_GO:begin
            next_addr  <= #1 {HEAD_ADDR,chn};            
            next_start <= #1 1;            
            next_state <= #1 RD_BUSY;
        end           
        RD_BUSY:begin
            if(done)begin
                if(err_both)begin
                    next_value_update[chn]      <= #1 0;
                    next_value[chn*8+:8]        <= #1 0;
                    next_state                  <= #1 ERR_SLEEP;
                end
                else begin                    
                    next_value_update[chn]      <= #1 1;
                    next_value[chn*8+:8]        <= #1 rd_buf;
                    next_state                  <= #1 RD_END;
                end     
                if(chn == CHN-1) next_chn <= #1 0;
                else next_chn <= #1 chn + 1;                
            end
        end                 
        RD_END:
            if(beat)next_state <= #1 RD_GO;        
        ERR_SLEEP:
            if(beat) next_state <= #1 IDLE;
        default: next_state <= #1 IDLE;
        endcase
    end
    
    i2cMaster #(
        .SYS_FREQ       (SYS_FREQ),
        .I2C_FREQ       (I2C_FREQ),
        .MUTEX_ENABLE   (0),
        .WR_LEN_BIT_WID (1),
        .WR_BUF_BYTE_NUM(1),
        .RD_LEN_BIT_WID (1),
        .RD_BUF_BYTE_NUM(1)
    )        
    i2cm(
        .rst     (rst     ),
        .clk     (clk     ),
        .mutexSta(        ),
        .mutexGet(0       ),
        .addr    (addr    ),
        .wrBuf   (8'b0    ),
        .wrLen   (1       ),
        .rdBuf   (rd_buf  ),
        .rdLen   (1       ),
        .start   (start   ),
        .busy    (        ),
        .done    (done    ),
        .errLine (err_line),
        .errNack (err_nack),
        .sclIn   (scl_in  ),
        .sdaIn   (sda_in  ),
        .sclOut  (scl_out ),
        .sdaOut  (sda_out ),
        .debug   (        )
    );
endmodule

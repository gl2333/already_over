`timescale 1ns / 1ps

module cur_meas # ( 
    parameter SYS_FREQ       =25_000_000,
    parameter I2C_FREQ       =10_000
)
(
    input              i_clk    ,
    input              i_rst_n  ,
    output [15:0]      o_adc    ,
    output reg         o_adc_vld,
    input              scl_in   ,
    input              sda_in   , 
    output             scl_out  ,
    output             sda_out       
);
 
    localparam I2C_7BIT_DEV_ADDR = 7'b0010100 ;
    localparam I2C_WR            = 1'b0       ;
    localparam I2C_RD            = 1'b1       ;  
    
    reg         s_wr_byte; 
    reg  [1:0]  s_rd_byte;
    wire [15:0] s_rd_buf ;
    reg         s_do     ; //1 pulse 
    wire        s_busy   ;
    wire        s_done   ; //1 pulse 
    wire        s_ack_err; //long signal    
    wire        s_line_err; //long signal
    
    reg  [31:0] s_clk_cnt ;
    wire        s_auto_pulse ;
    
    
    always @(posedge i_clk) begin
        if(!i_rst_n || s_auto_pulse)
            s_clk_cnt <= 0 ;
        else
            s_clk_cnt <= s_clk_cnt + 1 ;
    end
    
    assign s_auto_pulse = s_clk_cnt==SYS_FREQ/10 ;
    
    //result
    always @(posedge i_clk) begin
        if(!i_rst_n) begin
            o_adc_vld <= 0 ;
        end
        else if(s_done) begin
            o_adc_vld <= (!s_line_err) && (!s_ack_err);
        end
    end
    
    //I2C CFG
    always @(posedge i_clk) begin
        if(!i_rst_n || s_do) begin
            s_do      <= 0     ;
        end        
        else if(s_auto_pulse)
            s_do  <= 1 ;
    end
    
    
    i2cMaster # ( 
    
    .SYS_FREQ       (SYS_FREQ  ),
    .I2C_FREQ       (I2C_FREQ  ),
    .RD_ONLY        (1 ),
    .MUTEX_ENABLE   (0 ),
    .WR_LEN_BIT_WID (1 ), 
    .WR_BUF_BYTE_NUM(1 ),
    .RD_LEN_BIT_WID (2 ),
    .RD_BUF_BYTE_NUM(2 )
    )u_i2cm(
        .rst     (!i_rst_n),
        .clk     (i_clk),
        .mutexSta(),
        .mutexGet(),
        .addr    (I2C_7BIT_DEV_ADDR),
        .wrBuf   (8'b0),
        .wrLen   (1),
        .rdBuf   ({o_adc[7:0],o_adc[15:8]}),   //msb first in ltc2451
        .rdLen   (2),
        .start   (s_do),
        .busy    (s_busy),
        .done    (s_done),
        .errLine (s_line_err),
        .errNack (s_ack_err),
        .sclIn   (scl_in ),
        .sdaIn   (sda_in ),
        .sclOut  (scl_out),
        .sdaOut  (sda_out),
        .debug   ()
    );  
endmodule

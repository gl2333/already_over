`include "timescale.vh"
`include "simulation.vh"

module tb_i2c_read_loop;


    parameter sys_freq_hz = 50_000_000              ;
    parameter i2c_freq_hz = 100_000                 ;
    
    //`define IN_AIR_TEMP_TEST
    
    `ifdef IN_AIR_TEMP_TEST
        parameter chn_num     = 2                       ;
        parameter chn_bit_wid = 1                       ;
        parameter head_addr   = 6'b100100               ;
    `else //OUT_AIR_TEMP
        parameter chn_num     = 4                       ;
        parameter chn_bit_wid = 2                       ;
        parameter head_addr   = 5'b10010                ;
    `endif

    
    reg                       clk     ;
    reg                       rstn    ;
    wire [chn_num*8-1:0]      value   ;
    wire [chn_num-1  :0]      valid   ;
    reg                       scl_in  ;
    reg                        sda_in  ;
    wire                      scl_out ;
    wire                       sda_out ;
    
    
    wire scl;
    wire  sda;
    
    assign scl = (scl_out && scl_in) ? 1'bz:1'b0;
    assign  sda = ( sda_out &&  sda_in) ? 1'bz:1'b0;
    
    parameter T     = 1_000_000_000/sys_freq_hz;
    parameter I2C_T = 1_000_000_000/i2c_freq_hz;
    
    always #(T/2) clk = ~clk;
    
    initial begin
        clk=0;
        rstn=0;
        scl_in=1;
         sda_in=1;
        
        #(T*100) rstn = 1;
        
        //read 0
        #107_000  sda_in = 0;
        #I2C_T  sda_in = 1;
        
        #(I2C_T*8)  sda_in = 0;
        #I2C_T  sda_in = 1;
        
        #104_000  sda_in = 0;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 1;
        #I2C_T  sda_in = 1;        
        #I2C_T  sda_in = 0;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 1;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 1;       
        #I2C_T  sda_in = 1;
        
         //read 1
        #130_000  sda_in = 0;
        #I2C_T  sda_in = 1;
        
        #(I2C_T*8)  sda_in = 0;
        #I2C_T  sda_in = 1;
        
        #104_000  sda_in = 0;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 1;
        #I2C_T  sda_in = 1;        
        #I2C_T  sda_in = 0;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 0;
        #I2C_T  sda_in = 0;        
        #I2C_T  sda_in = 1;       
        #I2C_T  sda_in = 1;
 
        //read2
        #130_000 sda_in=0;
        #I2C_T sda_in=1;
        
        #(I2C_T*8) sda_in=0;
        #I2C_T sda_in=1;
        
        #104_000 sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        
        //read3
        #130_000 sda_in=0;
        #I2C_T sda_in=1;
        
        #(I2C_T*8) sda_in=0;
        #I2C_T sda_in=1;
        
        #104_000 sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        
        //read4
        #130_000 sda_in=0;
        #I2C_T sda_in=1;
        
        #(I2C_T*8) sda_in=0;
        #I2C_T sda_in=1;
        
        #104_000 sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        
        //read5
        #130_000 sda_in=0;
        #I2C_T sda_in=1;
        
        #(I2C_T*8) sda_in=0;
        #I2C_T sda_in=1;
        
        #104_000 sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;
        #I2C_T sda_in=0;
        #I2C_T sda_in=0;
        #I2C_T sda_in=1;

 end
    
    i2c_read_loop #(
        .sys_freq_hz(sys_freq_hz),        
        .i2c_freq_hz(i2c_freq_hz),        
        .chn_num    (chn_num    ),         
        .chn_bit_wid(chn_bit_wid),         
        .head_addr  (head_addr  )
    )
    dut (
     .clk     ( clk    ),
     .rstn    ( rstn   ),
     .value   ( value  ),
     .valid   ( valid  ),
     .scl_in  ( scl_in ),
     .sda_in  (  sda_in ),
     .scl_out ( scl_out),
     .sda_out (  sda_out)
    
    );
endmodule

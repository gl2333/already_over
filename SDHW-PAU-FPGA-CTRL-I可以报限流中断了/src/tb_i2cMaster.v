`include "timescale.vh"
`include "simulation.vh"

module tb_i2cMaster;

reg         rst     ;
reg         clk     ;
reg  [31 :0]wrBuf   ;
wire [31 :0]rdBuf   ; 
reg  [2  :0]wrLen   ;
reg  [2  :0]rdLen   ;
reg         start   ;
wire        sclOut  ;
wire        sdaOut  ;
reg         sclIn   ;
reg         sdaIn   ;
wire        busy    ;
wire        errLine ;
wire        errNack ;
wire [7  :0]debug   ;
reg  [15 :0]pres    ;
reg  [ 6 :0]addr    ;
wire        done    ;
wire        mutexSta;
reg         mutexGet;

parameter T     = 100  ;
parameter I2C_T = 10000;

always #(T/2) clk = ~clk;

wire scl;
wire sda;

assign scl = (sclOut && sclIn) ? 1'bz:1'b0;
assign sda = (sdaOut && sdaIn) ? 1'bz:1'b0;

initial begin
#1

        pres     = I2C_T/T/2;
        rst      = 1        ;
        clk      = 1        ;
        start    = 0        ;
        wrBuf    = 0        ;
        wrLen    = 0        ;
        rdLen    = 0        ;
        sclIn    = 1        ;
        sdaIn    = 1        ;
        mutexGet = 0        ;
        
     #(T*10) rst      = 0;
     #(T*10) mutexGet = 1;
     #T      mutexGet = 0;
            
`define TEST_1_5

`ifdef TEST_1_1
    #(T*10+1)
        wrBuf ={8'h35};
        wrLen =1;
        rdLen =0;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.1)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;        
`endif

`ifdef TEST_1_2
    #(T*10+1)
        wrBuf ={8'h12,8'h34,8'h60,8'h35};
        wrLen =4;
        rdLen =0;
        start =1;
        addr  =7'b1110101;
    #T
        start =0;
    #(I2C_T*1.1)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;  
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
    
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
    
`endif

`ifdef TEST_1_3
    #(T*10+1)
        wrBuf ={8'h12};
        wrLen =1;
        rdLen =1;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.1)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
   
    #(I2C_T*2)
    
    #(I2C_T*8)
            sdaIn =0;
            
    #I2C_T
            sdaIn =1;
    #I2C_T
        sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;

`endif


`ifdef TEST_1_4
    #(T*10+1)
        wrBuf ={8'h34,8'h12};
        wrLen =2;
        rdLen =1;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.1)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
   
    #(I2C_T*2)
    
    #(I2C_T*8)
            sdaIn =0;
            
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =1;

`endif


`ifdef TEST_1_5
    #(T*10+1)
        wrBuf ={8'h34,8'h12};
        wrLen =2;
        rdLen =4;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.1)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
   
    #(I2C_T*2)
    
    #(I2C_T*8)
            sdaIn =0;
            
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T 
           
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T 
           
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T 
           
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T sdaIn =1;
    #I2C_T sdaIn =0;
    #I2C_T 
           
    #I2C_T sdaIn =1;

`endif



`ifdef TEST_1_6
     sclIn = 0;
    sdaIn = 1;
    #(T*10+1)
        wrBuf ={8'h34,8'h12};
        wrLen =2;
        rdLen =4;
        start =1;
        addr  =7'b0110101;
       
    #T
        start =0; 
     

`endif

`ifdef TEST_1_7
    #(T*10+1)
        wrBuf ={8'h35};
        wrLen =1;
        rdLen =0;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;

`endif


`ifdef TEST_1_8
    #(T*10+1)
        wrBuf ={8'h35};
        wrLen =1;
        rdLen =0;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.6)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;       
`endif


`ifdef TEST_1_9
    #(T*10+1)
        wrBuf ={8'h35};
        wrLen =1;
        rdLen =0;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.6)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1; 
        
        #(I2C_T*3)
            mutexGet  = 1;
            #T mutexGet  = 0;
        #(I2C_T*3)
                wrBuf ={8'h35};
                wrLen =1;
                rdLen =0;
                start =1;
                addr  =7'b0110101;
            #T
                start =0;
            #(I2C_T*1.6)  
             
            #(I2C_T*8)
                sdaIn =0;
            #I2C_T
                sdaIn =1;
                
            #(I2C_T*8)
                sdaIn =0;
            #I2C_T
                sdaIn =1; 
       
               
`endif

`ifdef TEST_1_10
 #(T*10+1)
       wrBuf ={8'h35};
       wrLen =1;
       rdLen =0;
       start =1;
       addr  =7'b0110101;
   #T
       start =0;
   #(I2C_T*1.6)  
    
   #(I2C_T*8)
       sdaIn =0;
   #I2C_T
       sdaIn =1;
       
   #(I2C_T*8)
       sdaIn =0;
   #I2C_T
       sdaIn =1;
     #(I2C_T*3)
                  mutexGet  = 1;
                  #T mutexGet  = 0;
              #(I2C_T*3)   
    #(I2C_T*10+1)
        wrBuf ={8'h12};
        wrLen =1;
        rdLen =1;
        start =1;
        addr  =7'b0110101;
    #T
        start =0;
    #(I2C_T*1.6)  
     
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
        
    #(I2C_T*8)
        sdaIn =0;
    #I2C_T
        sdaIn =1;
   
    #(I2C_T*2.5)
    
    #(I2C_T*8)
            sdaIn =0;
            
    #I2C_T
            sdaIn =1;
    #I2C_T
        sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;
    #I2C_T
            sdaIn =0;
    #I2C_T
            sdaIn =1;

`endif


end
  
    i2cMaster #(
        .MUTEX_ENABLE(1),
        .WR_LEN_BIT_WID(3),
        .RD_LEN_BIT_WID(3),
        .WR_BUF_BYTE_NUM(4),
        .RD_BUF_BYTE_NUM(4),
        .SYS_CLK_FREQ(10_000_000),
        .I2C_CLK_FREQ(100_000)
    )
    dut (
        .rstn    (!rst    ),
        .clk     (clk     ),
        .wrBuf   (wrBuf   ),
        .rdBuf   (rdBuf   ),
        .wrLen   (wrLen   ),
        .rdLen   (rdLen   ),
        .start   (start   ),
        .busy    (busy    ),
        .mutexSta(mutexSta),
        .mutexGet(mutexGet),
        .errLine (errLine ),
        .errNack (errNack ),
        .addr    (addr    ),
        .sclOut  (sclOut  ),
        .sdaOut  (sdaOut  ),
        .sclIn   (sclIn   ),
        .sdaIn   (sdaIn   ),
        .debug   (debug   ),
        .done    (done    )
    );
    
endmodule 
`include "timescale.vh"
`include "simulation.vh"

module tb_amp_ctrl;

reg        clk     ;
reg        rstn    ;
wire       r_err   ;
wire       vi_err  ;
wire [7:0] v       ;
wire [7:0] i       ;
wire [7:0] r_rd    ;
reg  [7:0]      r_wr    ;
reg        r_wren  ;
reg        scl_in  ;
wire       scl_out ;
reg        sda_in  ;
wire       sda_out ;

parameter T     = 100    ;
parameter I2C_T = 10_000;

always #(T/2) clk = ~clk;

wire scl;
wire sda;

assign scl = (scl_out && scl_in) ? 1'bz:1'b0;
assign sda = (sda_out && sda_in) ? 1'bz:1'b0;


initial begin

clk=0;
rstn=0;
r_wr=0;
r_wren=0;
scl_in=1;
sda_in=1;

#(T*10)rstn=1;

`define TEST_1_5

`ifdef TEST_1_1

//write res
#1092_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;
`endif 


`ifdef TEST_1_2
//write res
#1092_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;


//read voltage
#400_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

`endif 


`ifdef TEST_1_3
#1092_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;


//read voltage
#400_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read amp
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read res
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
`endif 




`ifdef TEST_1_4

#1092_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;


//read voltage
#400_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read amp
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read res
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read vol
#210_000 sda_in=0;
#I2C_T sda_in=1;

r_wr = 8'h53;
r_wren = 1;
#T r_wren = 0;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;


//write res
#412_000 sda_in=0;
#I2C_T sda_in=1;

//r_wr = 8'h53;
//r_wren = 1;
//#T r_wren = 0;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;   


//read again
//read voltage
#500_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read amp
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read res
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
`endif 
 
 
`ifdef TEST_1_5

#1092_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;


//read voltage
#400_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read amp
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read res
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read vol
#210_000 sda_in=0;
#I2C_T sda_in=1;

r_wr = 8'h53;
r_wren = 1;
#T r_wren = 0;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;


//write res first time
#412_000 sda_in=0;
#I2C_T sda_in=1;

r_wr = 8'h53;
r_wren = 1;
#T r_wren = 0;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;   


//write res second time
#802_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;  


//read again
//read voltage
#500_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read amp
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;

//read res
#210_000 sda_in=0;
#I2C_T sda_in=1;

#80_000 sda_in=0;
#I2C_T sda_in=1;

#100_000 sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=1;
#I2C_T sda_in=0;
#I2C_T sda_in=0;
#I2C_T sda_in=1;
`endif 
               
end
wire v_update;
wire i_update;
/*    */
    amp_ctrl #(
        .SYS_FREQ(10_000_000),
        .I2C_FREQ(100_000)
    )
    dut (
        .clk    (clk    ),
        .rst    (!rstn  ),
        .r_err  (r_err  ),
        .vi_err (vi_err ),
        .v      (v      ),
        .i      (i      ),
        .r_rd   (r_rd   ),
        .r_wr   (r_wr   ),
        .r_wren (r_wren ),
        .scl_in (scl_in ),
        .scl_out(scl_out),
        .sda_in (sda_in ),
        .sda_out(sda_out)
    );
		
	

endmodule 
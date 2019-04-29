`timescale 1ns / 1ps

module tb_value_delay();

reg          clk;
reg          clk1;
reg          rst;
reg         v_update;
reg  [7:0]  reg_value_limit;
reg  [7:0]  reg_amp_vv;
wire [7:0]  o;
wire 	   reg_vol_irq_valid;

always #10 clk =~clk;
always #20 clk1 =~clk1;


initial begin
	clk =0;
	clk1=0;
	rst =1;
	reg_value_limit =8'h22;
	#40 
	rst =0;
	#500
	reg_value_limit =8'h08;
end


always@(posedge clk)
	if(rst) begin 
		v_update   <= 0;
		reg_amp_vv <= 0;
	end 
	else if(clk1) begin 
		reg_amp_vv <= reg_amp_vv+1;
		v_update   <= 1;
	end
	else begin
		v_update   <= 0;
    end		
		
value_delay #(.LEVEL(3),.RST_V(0),.BIT_WID(8))sdip_reg_amp_vv_delay
(
.clk		    (clk             ),
.rst		    (rst             ),
.value_update   (v_update        ),
.i				(reg_amp_vv     ),
.o				(o		        ),
.reg_value_limit(reg_value_limit),
.irq_valid		(reg_vol_irq_valid));	


        

endmodule

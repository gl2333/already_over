//https://blog.csdn.net/FPGADesigner/article/details/83689811

module DualRAM       //
(
input clk_wr	,  // 20M
input clk_rd    ,  //100M
input rst     ,
input [7:0]din  ,
                
output out_valid,
output [7:0]dout
);

dual_port_ram u1(
.clka	(clk_wr	),
.ena    (en_wr1 ),
.wea    (we_wr1 ),
.addra  (addr_wr),
.dina   (din    ),
.douta  (       ),

.clkb   (clk_rd	),
.enb    (en_rd1 ),
.web    (0      ),
.addrb  (addr_rd),
.dinb   (0      ),
.doutb  (dout1  )

);

dual_port_ram u2(
.clka	(clk_wr	),
.ena    (en_wr2 ),
.wea    (we_wr2 ),
.addra  (addr_wr),
.dina   (din    ),
.douta  (       ),

.clkb   (clk_rd	),
.enb    (en_rd2 ),
.web    (0      ),
.addrb  (addr_rd),
.dinb   (0      ),
.doutb  (dout2  )
);

always@ (posedge clk_wr)
if (rst) addr_wr <= 0;
else addr_wr <= addr_wr + 1;

//轮流写ram1\ram2
always@ (posedge clk_wr)
if (rst) we_wr1 <= 1;
		 we_wr2 <= 0;
		 en_wr1 <= 1;
		 en_wr2 <= 0;
else if(addr_wr == 1023)
		 we_wr1 <= ~we_wr1;
		 we_wr2 <= ~we_wr2;
         en_wr1 <= ~en_wr1;
         en_wr2 <= ~en_wr2;

always@ (posedge clk_rd)
if (rst)  addr_rd <= 1021;//对齐延迟
else      addr_rd <= addr_rd +1;

always@ (posedge clk_rd)
if (rst) cnt <= 16'hfffe;//对齐延迟
else if(cnt == 5119) cnt <=0;
else cnt <= cnt +1;
		 
always@ (posedge clk_rd)//读RAM 标志
if (rst) flag1 <=0;
		 flag2 <=0;
else if (cnt == 5119) 
		 flag1 <= ~flag1;
		 flag2 <= ~flag2;
else     
		 flag1 <= ~flag1;
		 flag2 <= ~flag2;
		 
always@ (posedge clk_rd)//读RAM使能，在cnt的前1/5时间读取
if (rst) en_rd1 <= 0;
		 en_rd2 <= 0;
else if(cnt < 1024) en_rd1 <= flag1;
					en_rd2 <= flag2;
else                
					en_rd1 <= 0;
					en_rd2 <= 0;		 
		 	 
always@ (posedge clk_rd)//对齐时序
if (rst) en_rd1_reg <= 0;
		 en_rd2_reg <= 0;
else                
		 en_rd1_reg <= en_rd1;
		 en_rd2_reg <= en_rd2;	

always@ (posedge clk_rd)
if(rst) dout <=0;
		out_valid <= 0;
else if(en_rd1_reg) dout <= dout1;
					out_valid <= 1;
else if(en_rd2_reg) dout <= dout2;
					out_valid <=1;
else 				dout <= 0;
					out_valid <=0;
endmodule
		 
		 
		 

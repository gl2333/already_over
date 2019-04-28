`timescale 1ns / 1ps

module tb_wave_gen();

reg clk;
reg rst;
reg enable;
reg dir_neg;
reg enable_r	;
reg dir_neg_r   ;
reg enable_r_r	;
reg dir_neg_r_r ;
reg [16:0]T_clk_num;
wire [16:0]s_clk_cnt;
wire s_phs_0_p  ;
wire s_phs_0_n  ;
wire s_phs_90_p ;
wire s_phs_90_n ;
wire sin_p,n_sin_p  ;
wire sin_n,n_sin_n  ;
wire cos_p,n_cos_p  ;
wire cos_n,n_cos_n  ;
assign n_sin_p = ~sin_p ;
assign n_sin_n = ~sin_n ;
assign n_cos_p = ~cos_p ;
assign n_cos_n = ~cos_n ;

always #10 clk = ~clk;

initial begin
clk =0;
rst =0;
enable   =0;
dir_neg  =0;
T_clk_num=0;
#50
rst =1;
dir_neg =0;
T_clk_num=20;
enable =1;
end

always@(posedge clk)begin 
if(!rst) begin
enable_r	<=0;
dir_neg_r   <=0;
enable_r_r	<=0;
dir_neg_r_r <=0;
end
else begin 
enable_r	<=enable;
dir_neg_r   <=dir_neg;
enable_r_r	<=enable_r;
dir_neg_r_r <=dir_neg_r;
end
end


wave_gen u_wave_gen(
.i_clk		(clk	)		,
.i_rst_n	(rst	)		,
.i_enable	(enable_r_r	)		,	
.i_dir_neg	(dir_neg_r_r)		,
.i_T_clk_num(T_clk_num)		,
.s_clk_cnt(s_clk_cnt),
.s_phs_0_p  (s_phs_0_p),
.s_phs_0_n  (s_phs_0_n ),
.s_phs_90_p (s_phs_90_p),
.s_phs_90_n (s_phs_90_n),
.o_sin_p	(sin_p	)		,
.o_sin_n	(sin_n	)		,
.o_cos_p	(cos_p	)		,
.o_cos_n	(cos_n	)	
);
endmodule

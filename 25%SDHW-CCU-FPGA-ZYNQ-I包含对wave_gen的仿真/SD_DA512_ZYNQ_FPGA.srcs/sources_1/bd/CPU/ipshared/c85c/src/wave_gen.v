`include "hardwarefpgadefine.vh"

module wave_gen
	(
		input			i_clk		,
		input			i_rst_n		,				
		input			i_enable	,
			
		input			i_dir_neg	,	//0:pos
		input	[16:0]	i_T_clk_num	,
//		output          s_clk_cnt,
//
//		output          s_phs_0_p	,
//		output          s_phs_0_n   ,
//		output          s_phs_90_p  ,
//		output          s_phs_90_n  ,
		output			o_sin_p		,
		output			o_sin_n		,
		output			o_cos_p		,
		output			o_cos_n		
    );
	
	// reg				s_dir_neg			;
	// reg		[16:0]	s_T_clk_num			;
	wire	[15:0]	s_half_T_clk_num	;
	wire	[15:0]	s_invert_clk_num	;
	wire	[14:0]	s_quat_T_clk_num	;
	
	
	reg		[16:0]	s_clk_cnt			;
	
	reg				s_phs_0_p			;
	reg				s_phs_0_n			;
	reg				s_phs_90_p			;
	reg				s_phs_90_n			;
	
	
	assign	s_half_T_clk_num	=	i_T_clk_num[16:1]	;
//	assign	s_invert_clk_num	=	i_T_clk_num[16:1] - 4	;
	assign	s_quat_T_clk_num	=	i_T_clk_num[16:2]	;
	
	
	//s_clk_cnt
	always @(posedge i_clk) begin
		if(!i_rst_n) 
			s_clk_cnt	<=	0	;
		else if(s_clk_cnt==i_T_clk_num-1)
			s_clk_cnt	<=	0	;
		else if(i_enable)
			s_clk_cnt	<=	s_clk_cnt + 1	;
		else
			s_clk_cnt	<=	0	;
	end
	
	//OUTPUT
//	always @(posedge i_clk) begin
//		if(!i_rst_n) begin
//			s_phs_0_p	<=	1	;
//			s_phs_0_n   <=	1	;
//			s_phs_90_p  <=	1	;
//			s_phs_90_n  <=	1	;
//		end
//		else if(~i_enable) begin
//			s_phs_0_p	<=	1	;
//			s_phs_0_n   <=	1	;
//			s_phs_90_p  <=	1	;
//			s_phs_90_n  <=	1	;
//		end
//		else if(i_enable&&(s_clk_cnt==s_quat_T_clk_num))begin
//			s_phs_0_p	<=	0	;	
//			s_phs_0_n	<=	0	;
//			s_phs_90_p  <=	1	;
//			s_phs_90_n	<=	0	;	
//		end
//		else if(i_enable&&(s_clk_cnt==s_half_T_clk_num))begin
//			s_phs_0_p	<=	0	;	
//			s_phs_0_n	<=	1	;
//			s_phs_90_p  <=	0	;
//			s_phs_90_n	<=	0	;	
//		end
//		else if(i_enable&&(s_clk_cnt==s_half_T_clk_num+s_quat_T_clk_num))begin
//			s_phs_0_p	<=	0	;	
//			s_phs_0_n	<=	0	;
//			s_phs_90_p  <=	0	;
//			s_phs_90_n	<=	1	;	
//		end
//		else if(i_enable&&(s_clk_cnt==0))begin
//			s_phs_0_p	<=	1	;	
//			s_phs_0_n	<=	0	;
//			s_phs_90_p  <=	0	;
//			s_phs_90_n	<=	0	;	
//		end
//		else begin
//			s_phs_0_p	<=	s_phs_0_p	;
//			s_phs_0_n   <=	s_phs_0_n   ;
//			s_phs_90_p  <=	s_phs_90_p  ;
//			s_phs_90_n  <=	s_phs_90_n  ;
//		end
//	end
	always @(posedge i_clk) begin
		if(!i_rst_n) begin
			s_phs_0_p	<=	1	;
			s_phs_0_n   <=	1	;
			s_phs_90_p  <=	1	;
			s_phs_90_n  <=	1	;
		end
		else if(~i_enable) begin
			s_phs_0_p	<=	1	;
			s_phs_0_n   <=	1	;
			s_phs_90_p  <=	1	;
			s_phs_90_n  <=	1	;
		end
		else if(i_enable&&(s_clk_cnt==s_quat_T_clk_num))begin
			s_phs_0_p	<=	1	;	
			s_phs_0_n	<=	1	;
			s_phs_90_p  <=	0	;
			s_phs_90_n	<=	1	;	
		end
		else if(i_enable&&(s_clk_cnt==s_half_T_clk_num))begin
			s_phs_0_p	<=	1	;	
			s_phs_0_n	<=	0	;
			s_phs_90_p  <=	1	;
			s_phs_90_n	<=	1	;	
		end
		else if(i_enable&&(s_clk_cnt==s_half_T_clk_num+s_quat_T_clk_num))begin
			s_phs_0_p	<=	1	;	
			s_phs_0_n	<=	1	;
			s_phs_90_p  <=	1	;
			s_phs_90_n	<=	0	;	
		end
		else if(i_enable&&(s_clk_cnt==0))begin
			s_phs_0_p	<=	0	;	
			s_phs_0_n	<=	1	;
			s_phs_90_p  <=	1	;
			s_phs_90_n	<=	1	;	
		end
		else begin
			s_phs_0_p	<=	s_phs_0_p	;
			s_phs_0_n   <=	s_phs_0_n   ;
			s_phs_90_p  <=	s_phs_90_p  ;
			s_phs_90_n  <=	s_phs_90_n  ;
		end
	end

	assign  o_sin_p	=	i_dir_neg?	s_phs_90_p	:	s_phs_0_p	;
	assign  o_sin_n	=	i_dir_neg?	s_phs_90_n	:	s_phs_0_n	;
	assign  o_cos_p	=	i_dir_neg?	s_phs_0_p	:	s_phs_90_p	;
	assign  o_cos_n	=	i_dir_neg?	s_phs_0_n	:	s_phs_90_n	;
	
endmodule
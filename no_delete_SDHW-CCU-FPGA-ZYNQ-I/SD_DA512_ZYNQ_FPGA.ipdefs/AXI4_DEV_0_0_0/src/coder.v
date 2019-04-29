`include "hardwarefpgadefine.vh"

module coder (
		input 		i_clk		,
		input 		i_rst_n		,
		
		//coder
        input	    i_coder_A,
        input	    i_coder_B,

		//output status
		output		o_plus_pulse	,	
		output		o_minus_pulse		
	);
	
	reg		s_coder_B_r			;
	wire	s_coder_B_posedge	;
	
    always@(posedge i_clk) if(!i_rst_n) s_coder_B_r<=1; else s_coder_B_r <= i_coder_B;
	
	assign	s_coder_B_posedge 	= 	i_coder_B & ~s_coder_B_r	;
	
	
	assign	o_plus_pulse		=	(s_coder_B_posedge & ~i_coder_A);	
	assign	o_minus_pulse		=	(s_coder_B_posedge & i_coder_A)	;	
	
endmodule

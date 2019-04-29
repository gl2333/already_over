`timescale 1ns / 1ps
`include "hardwarefpgadefine.vh"
`include "phasefpgaregdef.vh"
`include "controlfpgaregdef.vh"

`define SVN_VERSION 							32'd0
`define SVN_COMPILE_DATE 						32'h20180615
//INLET_AIR & OUTLET_AIR DUMMY 
`define	INLET_DUMMY_I2C_SLV_ADDR_BYTE_WID	 	1
`define	INLET0_DUMMY_I2C_SLV_ADDR_7BIT 			7'b1001000
`define	INLET1_DUMMY_I2C_SLV_ADDR_7BIT 			7'b1001001
`define	OUTLET_DUMMY_I2C_SLV_ADDR_BYTE_WID 		1
`define	OUTLET0_DUMMY_I2C_SLV_ADDR_7BIT 		7'b1001000
`define	OUTLET1_DUMMY_I2C_SLV_ADDR_7BIT 		7'b1001001
`define	OUTLET2_DUMMY_I2C_SLV_ADDR_7BIT 		7'b1001010
`define	OUTLET3_DUMMY_I2C_SLV_ADDR_7BIT 		7'b1001011
`define INLET_DUMMY_TEM_ADDR					8'h00
`define OUTLET_DUMMY_TEM_ADDR					8'h00
//AMP DUMMY
`define	AMP_DUMMY_I2C_SLV_ADDR_BYTE_WID			1
`define	AMP_DUMMY_R_CFG_ADDR					8'h00
`define	AMP_DUMMY_R_ADDR						8'h00		
`define	AMP_DUMMY_A_ADDR   						8'h0D 
`define	AMP_DUMMY_V_ADDR 						8'h11
`define R_ISL95811_ADDR 					    7'b0101000
`define E_PAC1710_ADDR  					    7'b0011000



module PHS_CTRL(
	//PHS 
	input         CLK_IN    	  	,
	inout         SCL_Pfpga       	,
	inout         SDA_Pfpga       	,	 
	input         TRIGGER_IN		,	
	output [1:0]  LED       		,//LED0：life	
	
	//CTRL 
   	input  [7:0]  switch			,//swith[1:0]:set_in_air_temp
	inout         SCL_Cfpga   		,
	inout         SDA_Cfpga   		
	
	//  input         PRESENT     		

);

	localparam 	SYS_FREQ = 50_000_000;
	wire 		clk    				 ;
	wire 		clk_phs				 ;	
	genvar j ;
	clk_gen u_clk_gen(
		.CLK_IN (CLK_IN  ),
		.clk    (clk     ),   //50Mhz SYS_FREQ
		.clk_phs(clk_phs ),   //350Mhz            
		.locked (        )
	);

	localparam 	RSTN_SHIFT_WID		=32;
	reg [31:0] 	rstn_shift 			= {RSTN_SHIFT_WID{1'b0}};
	
	always@(posedge clk) 
				rstn_shift 			<= {rstn_shift[RSTN_SHIFT_WID-2:0],1'b1};
	
	wire 		rst_wire 			= !rstn_shift[RSTN_SHIFT_WID-1];
	
	BUFG u_bufg_rst(.I(rst_wire),.O(rst_tmp));
	reg rst;
	always@(posedge clk) 
				rst					<=rst_tmp;
				
//life light
	reg [31:0]chip_active_cnt ;
	wire chip_active_pulse  = (chip_active_cnt == SYS_FREQ);    
	wire chip_active_valid 	= (chip_active_cnt < SYS_FREQ/2);
	always@(posedge clk)
		if(rst || chip_active_pulse) 
			chip_active_cnt <= 0;
		else 
			chip_active_cnt <= chip_active_cnt + 1;
	assign LED[0]= chip_active_valid; //led blink 1 HZ

////i2c light
//	reg [31:0]i2c_active_cnt;
//    wire i2c_active_pulse 	= (!sdaSlaveIn_Pfpga || !sclSlaveIn_Pfpga|| !sdaSlaveIn_Cfpga || !sclSlaveIn_Cfpga);
//    wire i2c_active_valid 	= (i2c_active_cnt < SYS_FREQ/2);
//    always@(posedge clk)
//        if(rst || i2c_active_pulse)
//			i2c_active_cnt <= 0;
//        else if(i2c_active_valid) 
//			i2c_active_cnt <= i2c_active_cnt + 1;  
//    assign LED[1] = i2c_active_valid;//half seconds ligth on

	reg [31:0]speed_active_cnt;
	reg  speed_active_valid;
	wire speed_active_pulse  = (speed_active_cnt == SYS_FREQ<<1);  
	always@(posedge clk)
			 if(speed==0||speed==1||speed==2) speed_active_valid 	<= (speed_active_cnt < SYS_FREQ);
		else if(speed==3||speed==4||speed==5) speed_active_valid 	<= (speed_active_cnt < (SYS_FREQ>>1));
		
    always@(posedge clk)
        if(rst||speed_active_pulse)
			speed_active_cnt <= 0;
        else 
			speed_active_cnt <= speed_active_cnt + 1;  
    assign LED[1] = speed_active_valid;

	
//i2cslave inout 
    wire sclSlaveIn_Pfpga	;
    wire sdaSlaveIn_Pfpga	;
    wire sdaSlaveOut_Pfpga	;
		
    IOBUF iobuf_sclSlave_Pfpga(
        .O(sclSlaveIn_Pfpga),.I(1'b0),.IO(SCL_Pfpga),.T(1'b1));
    IOBUF iobuf_sdaSlave_Pfpga(
        .O(sdaSlaveIn_Pfpga),.I(1'b0),.IO(SDA_Pfpga),.T(sdaSlaveOut_Pfpga));

	wire  [15:0] addr_Pfpga	;
	wire         wrEn_Pfpga	;
    wire         rdEn_Pfpga	;
	wire  [7:0]  wrDa_Pfpga	;
	reg   [7:0]  rdDa_Pfpga	;
	
	i2cSlave #(
	    .I2C_ADDRESS       	(`PHS_FPGA_I2C_SLV_ADDR_7BIT),
	    .I2C_ADDR_BYTE_WIDTH(`I2C_SLV_ADDR_BYTE_WID     )
	)
	u_i2c_slave(
		.clk   		(clk         	   ),
		.rst      	(rst         	   ),
		.scl       	(sclSlaveIn_Pfpga  ),
		.sdaIn     	(sdaSlaveIn_Pfpga  ),		
		.sdaOut    	(sdaSlaveOut_Pfpga ),		
		.addr      	(addr_Pfpga        ), //8 bite addr_PfpgaESS
		.readEn   	(rdEn_Pfpga        ),
		.writeEn  	(wrEn_Pfpga        ),  
		.writeData	(wrDa_Pfpga        ),
		.readData 	(rdDa_Pfpga        )
	);
	wire[13:0]addr32_Pfpga = addr_Pfpga[15:2];
	//
	wire[`PF_GEN_ID_BIT_WID      -1:0]	  reg_gen_id      ;//Shende ID
	wire[`PF_GEN_SN_BIT_WID      -1:0]	  reg_gen_sn      ;//serial number, for future use
	wire[`PF_GEN_FM_BIT_WID      -1:0]	  reg_gen_svn     ;//svn version, and compile date
	wire[`PF_GEN_DNA_BIT_WID     -1:0]	  reg_gen_dna     ;//chip dna
	wire[`PF_GEN_VF_BIT_WID      -1:0]	  reg_gen_vf      ;//password check result, for future use
	
	reg [`PF_GEN_SCR_BIT_WID     -1:0]	  reg_gen_scr     ;//for write/read test
	reg [`PF_GEN_PW_BIT_WID      -1:0]	  reg_gen_pw      ;//password, for future use
	reg [`PF_SW_GLB_BIT_WID      -1:0]	  reg_sw_glb      ;//chassis phase switch, default 1, open
	reg [`CHN                    -1:0]	  reg_sw_chn      ;//channel phase switch, default 1, open
	reg [`PF_PHS_DIR_BIT_WID     -1:0]	  reg_phs         ;
	reg [`IRQ_STA_PF_CRC_BIT_WID -1:0]	  reg_sta_i2c_crc ;
	reg [`IRQ_MASK_PF_CRC_BIT_WID-1:0]	  reg_mask_i2c_crc;
	reg [`PF_PHS_HEATING_BIT_WID -1:0]	  reg_heat_sta	  ;	
	
	assign reg_gen_id  	   = `SHENDE_MEDICAL_ID;
	assign reg_gen_sn  	   = 0;
	assign reg_gen_svn 	   = {`SVN_VERSION,`SVN_COMPILE_DATE};
	assign reg_gen_vf  	   = 1;	
	//
	assign cs_gen_scr      = (addr_Pfpga ==     `PF_GEN_SCR_BYTE_ADDR);
	assign cs_gen_vf       = (addr_Pfpga ==      `PF_GEN_VF_BYTE_ADDR);
	assign cs_sw_glb       = (addr_Pfpga ==      `PF_SW_GLB_BYTE_ADDR);
	assign cs_sta_i2c_crc  = (addr_Pfpga == `IRQ_STA_PF_CRC_BYTE_ADDR);
	assign cs_mask_i2c_crc = (addr_Pfpga ==`IRQ_MASK_PF_CRC_BYTE_ADDR);  
	
	assign cs_gen_id  	   = ((addr_Pfpga >= `PF_GEN_ID_BYTE_ADDR 			&& addr_Pfpga <=`PF_GEN_ID_BYTE_END 	  	  ));
	assign cs_gen_sn  	   = ((addr_Pfpga >= `PF_GEN_SN_BYTE_ADDR 			&& addr_Pfpga <=`PF_GEN_SN_BYTE_END 	  	  ));
	assign cs_gen_svn 	   = ((addr_Pfpga >= `PF_GEN_FM_BYTE_ADDR 			&& addr_Pfpga <=`PF_GEN_FM_BYTE_END 	  	  ));
	assign cs_gen_dna 	   = ((addr_Pfpga >= `PF_GEN_DNA_BYTE_ADDR			&& addr_Pfpga <=`PF_GEN_DNA_BYTE_END	  	  ));
	assign cs_gen_pw  	   = ((addr_Pfpga >= `PF_GEN_PW_BYTE_ADDR 			&& addr_Pfpga <=`PF_GEN_PW_BYTE_END 	  	  ));
	assign cs_phs     	   = ((addr_Pfpga >= `PF_PHS_DIR_BYTE_ADDR			&& addr_Pfpga <=`PF_PHS_DIR_BYTE_END	  	  ));
	assign cs_heat_sta     = ((addr_Pfpga >= `PF_PHS_HEATING_BYTE_ADDR 		&& addr_Pfpga <=`PF_PHS_HEATING_BYTE_END	  ));
	
	wire [`CHN-1:0]cs_sw_chn;
    
	generate 
		for(j=0;j<`CHN;j=j+1)begin : u_cs_sw_chn
			assign cs_sw_chn[j] = ((addr_Pfpga==`PF_SW_CHN_BYTE_ADDR+j*4*`PF_SW_CHN_SIZE));
		end  
	endgenerate

	always@(*) begin
				if     (cs_gen_scr     )rdDa_Pfpga <= reg_gen_scr     ;
				else if(cs_gen_vf      )rdDa_Pfpga <= reg_gen_vf      ;
				else if(cs_sw_glb      )rdDa_Pfpga <= reg_sw_glb      ;
				else if(cs_sta_i2c_crc )rdDa_Pfpga <= reg_sta_i2c_crc ;
				else if(cs_mask_i2c_crc)rdDa_Pfpga <= reg_mask_i2c_crc;
				else if(cs_gen_id      )rdDa_Pfpga <= reg_gen_id 	[(addr_Pfpga-`PF_GEN_ID_BYTE_ADDR )*8+:8	];
				else if(cs_gen_sn      )rdDa_Pfpga <= reg_gen_sn 	[(addr_Pfpga-`PF_GEN_SN_BYTE_ADDR )*8+:8	];
				else if(cs_gen_svn     )rdDa_Pfpga <= reg_gen_svn	[(addr_Pfpga-`PF_GEN_FM_BYTE_ADDR )*8+:8	];
				else if(cs_gen_dna     )rdDa_Pfpga <= reg_gen_dna	[(addr_Pfpga-`PF_GEN_DNA_BYTE_ADDR)*8+:8	];
				else if(cs_gen_pw      )rdDa_Pfpga <= reg_gen_pw 	[(addr_Pfpga-`PF_GEN_PW_BYTE_ADDR )*8+:8	];
				else if(cs_phs         )rdDa_Pfpga <= reg_phs    	[(addr_Pfpga-`PF_PHS_DIR_BYTE_ADDR)*8+:8	];
				else if(|cs_sw_chn     )rdDa_Pfpga <= reg_sw_chn 	[addr32_Pfpga-`PF_SW_CHN_ADDR				];
				else if(cs_heat_sta	   )rdDa_Pfpga <= reg_heat_sta	[(addr_Pfpga-`PF_PHS_HEATING_BYTE_ADDR)*8+:8];
				else rdDa_Pfpga<=8'b0;
	end


//
	wire i2c_crc_err = 0;
	always @( posedge clk) begin
		if (rst) begin
			reg_gen_scr      <= 0;
			reg_gen_pw       <= 0;
			reg_sw_glb       <= 1;
			reg_sw_chn       <= {`CHN{1'b1}};  
			reg_phs          <= 0; 
			reg_sta_i2c_crc  <= 0;          
			reg_mask_i2c_crc <= 0;               
			IRQ_Pfpga        <= 0;
		end    
		else if(wrEn_Pfpga) begin            
			if     (cs_gen_scr     ) reg_gen_scr                                  				<= wrDa_Pfpga	;
			else if(cs_gen_pw      ) reg_gen_pw[(addr_Pfpga-`PF_GEN_PW_BYTE_ADDR)*8+:8] <= wrDa_Pfpga	; 
			else if(cs_gen_pw      ) reg_gen_pw[(addr_Pfpga-`PF_GEN_PW_BYTE_ADDR)*8+:8] <= wrDa_Pfpga	; 
			else if(cs_sw_glb      ) reg_sw_glb                                   				<= wrDa_Pfpga[0];
			else if(|cs_sw_chn     ) reg_sw_chn[addr32_Pfpga-`PF_SW_CHN_ADDR]           		<= wrDa_Pfpga[0];
			else if(cs_phs         ) reg_phs[(addr_Pfpga-`PF_PHS_DIR_BYTE_ADDR  )*8+:8] <= wrDa_Pfpga	;
			else if(cs_sta_i2c_crc ) reg_sta_i2c_crc                              				<= 1			;  //write any value set IRQ_Pfpga
			else if(cs_mask_i2c_crc) reg_mask_i2c_crc                             				<= wrDa_Pfpga[0];
		end
		else if(rdEn_Pfpga && cs_sta_i2c_crc)begin 
									reg_sta_i2c_crc <= 0;   //read clear IRQ_Pfpga
		end 
		else begin
			if(i2c_crc_err)			reg_sta_i2c_crc <= 1;
									IRQ_Pfpga 		<= (reg_sta_i2c_crc && reg_mask_i2c_crc && switch_in_sync[6]);
		end
	end

//
	wire trig_sync;
    sync #(.BIT(1),.LEVEL(3),.RST_V(0))
        u_sync_trig(.clk(clk),.rst(rst),.i(TRIGGER_IN),.o(trig_sync));
	
	always @( posedge clk)begin 
		if (rst) 
				reg_heat_sta	 <= {8'h45,8'h4c,8'h44,8'h49};    
			else if(rdEn_Pfpga && cs_heat_sta)
				reg_heat_sta	 <= {8'h45,8'h4c,8'h44,8'h49};//read clear heat sta
			else
				reg_heat_sta 	 <= trig_sync?{8'h54,8'h41,8'h45,8'h48}:{8'h45,8'h4c,8'h44,8'h49};
	end	
	


	dna  #(
			.DNA_PORT_START_CNT  (10 ),
			.DNA_PORT_BYTE_WIDTH (`PF_GEN_DNA_BIT_WID))
		u_dna(
			.clk      (clk         ),
			.rst      (rst         ),
			.dna_out  (reg_gen_dna ),
			.dna_valid(            )
    ); 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//wire sclSlaveIn_Cfpga	;
	//wire sdaSlaveIn_Cfpga	;
	//wire sdaSlaveOut_Cfpga	;
	//	
	//assign 	sclSlaveIn_Cfpga	=	s_sclSlaveIn_Cfpga		;
	//assign 	sdaSlaveIn_Cfpga	=	s_sdaSlaveIn_Cfpga   	;
	//assign 	s_sdaSlaveOut_Cfpga	=	sdaSlaveOut_Cfpga		;
	
	
	IOBUF iobuf_sclSlave(
		.O(sclSlaveIn_Cfpga ),.I(1'b0),.IO(SCL_Cfpga),.T(1'b1));
	IOBUF iobuf_sdaSlave(
		.O(sdaSlaveIn_Cfpga ),.I(1'b0),.IO(SDA_Cfpga),.T(sdaSlaveOut_Cfpga));
 
//    wire present_sync		;
//    sync  #(.BIT(1),.LEVEL(3),.RST_V(1))
//        u_sync_pres(.clk(clk),.rst(rst),.i(PRESENT),.o(present_deb));    
       
   
    //____________________________________________________I2C slave________
    wire [15:0] addr;
    wire 		wrEn;
    wire 		rdEn;
    wire [7:0]	wrDa;
    reg  [7:0]	rdDa;
    
    i2cSlave #(
		.I2C_ADDRESS		(`CTRL_FPGA_I2C_SLV_ADDR_7BIT),
		.I2C_ADDR_BYTE_WIDTH(`I2C_SLV_ADDR_BYTE_WID		 )
    )
    i2cSlaveInst(
        .clk     	(clk        	  ),
        .rst        (rst        	  ),
        .scl        (sclSlaveIn_Cfpga ),
        .sdaIn      (sdaSlaveIn_Cfpga ), 
        .sdaOut     (sdaSlaveOut_Cfpga),        
        .addr       (addr       	  ), //8 bite address
        .readEn     (rdEn       	  ),
        .writeEn    (wrEn       	  ), 
        .writeData  (wrDa       	  ),
        .readData   (rdDa       	  )
    );

    //_____________________________________________________________________
    wire [13:0]addr32 = addr[15:2];
    
	reg  [`CF_GEN_SCR_BIT_WID-1:0]reg_cf_gen_scr;
	wire [`CF_GEN_ID_BIT_WID -1:0]reg_cf_gen_id ;
	wire [`CF_GEN_SN_BIT_WID -1:0]reg_cf_gen_sn ;
	wire [`CF_GEN_FM_BIT_WID -1:0]reg_cf_gen_fm ;
	wire [`CF_GEN_DNA_BIT_WID-1:0]reg_cf_gen_dna;
	reg  [`CF_GEN_PW_BIT_WID -1:0]reg_cf_gen_pw ;
	wire [`CF_GEN_VF_BIT_WID -1:0]reg_cf_gen_vf ;
	reg  [`CF_GEN_RST_BIT_WID-1:0]reg_cf_gen_rst; 
	reg  [`FAN_RST_BIT_WID   -1:0]reg_fan_rst   ;
	reg  [`FAN_MODE_BIT_WID  -1:0]reg_fan_mode  ;
	reg  [2                    :0]reg_fan_speed ; 
	wire [`PROBE_PRES_BIT_WID-1:0]reg_prob_pres ; 
	reg  [`IN_AIR_TL_BIT_WID -1:0]reg_in_air_tl [`IN_AIR_NUM-1 :0];
	wire [`IN_AIR_TV_BIT_WID -1:0]reg_in_air_tv [`IN_AIR_NUM-1 :0]; 
	reg  [`OUT_AIR_TL_BIT_WID-1:0]reg_out_air_tl[`OUT_AIR_NUM-1:0];
	wire [`OUT_AIR_TV_BIT_WID-1:0]reg_out_air_tv[`OUT_AIR_NUM-1:0]; 
    reg  [`AMP_RES_BIT_WID   -1:0]reg_amp_res; //amp resistor to write
    wire [`AMP_RV_BIT_WID    -1:0]reg_amp_rv ; //amp resistor read back
    wire [`AMP_VV_BIT_WID    -1:0]reg_amp_vv ; //amp voltage read back
    wire [`AMP_AV_BIT_WID    -1:0]reg_amp_av ; //amp current read back
    reg  [`AMP_VL_BIT_WID    -1:0]reg_amp_vl ; //amp voltage limit
    reg  [`AMP_AL_BIT_WID    -1:0]reg_amp_al ; //amp current limit 
    reg  [`IN_AIR_NUM        -1:0]reg_irq_sta_in_tol      ;
    reg  [`OUT_AIR_NUM       -1:0]reg_irq_sta_out_tol     ;
    reg  [`IN_AIR_NUM        -1:0]reg_irq_mask_in_tol     ;
    reg  [`OUT_AIR_NUM       -1:0]reg_irq_mask_out_tol    ;
    reg  [`CHN               -1:0]reg_irq_sta_amp_vol     ;
    reg  [`CHN               -1:0]reg_irq_sta_amp_aol     ;
    reg  [`CHN               -1:0]reg_irq_sta_amp_i2c_err ;
    reg  [`CHN               -1:0]reg_irq_mask_amp_vol    ;
    reg  [`CHN               -1:0]reg_irq_mask_amp_aol    ;
    reg  [`CHN               -1:0]reg_irq_mask_amp_i2c_err;
  
    assign reg_cf_gen_vf = 1;
    assign reg_cf_gen_sn = 0;
    assign reg_cf_gen_id = `SHENDE_MEDICAL_ID;
    assign reg_cf_gen_fm = {`SVN_VERSION,`SVN_COMPILE_DATE};
    //assign reg_prob_pres = present_deb;
     
    
    //_____________________________________________________________________
    wire reg_cf_gen_scr_cs;
    wire reg_cf_gen_id_cs ;
    wire reg_cf_gen_sn_cs ;
    wire reg_cf_gen_fm_cs ;
    wire reg_cf_gen_dna_cs;
    wire reg_cf_gen_pw_cs ;
    wire reg_cf_gen_vf_cs ;
    wire reg_cf_gen_rst_cs; 
    wire reg_fan_rst_cs   ;
    wire reg_fan_mode_cs  ;
    wire reg_fan_speed_cs ;
    wire reg_prob_pres_cs ; 
    wire reg_amp_res_cs   ; //amp resistor to write
    wire reg_amp_rv_cs    ; //amp resistor to write
    wire reg_amp_vv_cs    ; //amp voltage read back
    wire reg_amp_vl_cs    ; //amp voltage limit
    wire reg_amp_av_cs    ; //amp current read back
    wire reg_amp_al_cs    ; //amp current limit
    wire [ `IN_AIR_NUM-1:0]reg_in_air_tl_cs           ;
    wire [ `IN_AIR_NUM-1:0]reg_in_air_tv_cs           ; 
    wire [ `IN_AIR_NUM-1:0]reg_irq_sta_in_tol_cs      ;
    wire [ `IN_AIR_NUM-1:0]reg_irq_mask_in_tol_cs     ; 
    wire [`OUT_AIR_NUM-1:0]reg_out_air_tl_cs          ;
    wire [`OUT_AIR_NUM-1:0]reg_out_air_tv_cs          ; 
    wire [`OUT_AIR_NUM-1:0]reg_irq_sta_out_tol_cs     ;
    wire [`OUT_AIR_NUM-1:0]reg_irq_mask_out_tol_cs    ;
    wire [ `CHN       -1:0]reg_irq_sta_amp_vol_cs     ;
    wire [ `CHN       -1:0]reg_irq_sta_amp_aol_cs     ;
    wire [ `CHN       -1:0]reg_irq_sta_amp_i2c_err_cs ;
    wire [ `CHN       -1:0]reg_irq_mask_amp_vol_cs    ;
    wire [ `CHN       -1:0]reg_irq_mask_amp_aol_cs    ;
    wire [ `CHN       -1:0]reg_irq_mask_amp_i2c_err_cs;
    
    
    //_____________________________________________________________________
    assign reg_cf_gen_scr_cs = ( addr== `CF_GEN_SCR_BYTE_ADDR);
    assign reg_cf_gen_vf_cs  = ( addr== `CF_GEN_VF_BYTE_ADDR );
    assign reg_cf_gen_rst_cs = ( addr== `CF_GEN_RST_BYTE_ADDR); 
    assign reg_fan_rst_cs    = ( addr== `FAN_RST_BYTE_ADDR   ); 
    assign reg_fan_mode_cs   = ( addr== `FAN_MODE_BYTE_ADDR  ); 
    assign reg_fan_speed_cs  = ( addr== `FAN_SPEED_BYTE_ADDR );
    assign reg_prob_pres_cs  = ( addr== `PROBE_PRES_BYTE_ADDR);
    assign reg_cf_gen_id_cs  = ((addr>= `CF_GEN_ID_BYTE_ADDR  && addr<= `CF_GEN_ID_BYTE_END ));
    assign reg_cf_gen_sn_cs  = ((addr>= `CF_GEN_SN_BYTE_ADDR  && addr<= `CF_GEN_SN_BYTE_END ));
    assign reg_cf_gen_fm_cs  = ((addr>= `CF_GEN_FM_BYTE_ADDR  && addr<= `CF_GEN_FM_BYTE_END ));
    assign reg_cf_gen_dna_cs = ((addr>= `CF_GEN_DNA_BYTE_ADDR && addr<= `CF_GEN_DNA_BYTE_END));
    assign reg_cf_gen_pw_cs  = ((addr>= `CF_GEN_PW_BYTE_ADDR  && addr<= `CF_GEN_PW_BYTE_END )); 
    assign reg_amp_res_cs    = ((addr>= `AMP_RES_BYTE_ADDR    && addr<= `AMP_RES_BYTE_END   )); 
    assign reg_amp_vv_cs     = ((addr>= `AMP_VV_BYTE_ADDR     && addr<= `AMP_VV_BYTE_END    ));
    assign reg_amp_vl_cs     = ((addr>= `AMP_VL_BYTE_ADDR     && addr<= `AMP_VL_BYTE_END    ));
    assign reg_amp_av_cs     = ((addr>= `AMP_AV_BYTE_ADDR     && addr<= `AMP_AV_BYTE_END    ));
    assign reg_amp_al_cs     = ((addr>= `AMP_AL_BYTE_ADDR     && addr<= `AMP_AL_BYTE_END    )); 
    assign reg_amp_rv_cs     = ((addr>= `AMP_RV_BYTE_ADDR     && addr<= `AMP_RV_BYTE_END    ));
    
    generate
        for(j=0;j<`CHN;j=j+1)begin :chs_cs
            assign reg_irq_sta_amp_vol_cs[j]      = (addr== `IRQ_STA_AMP_VOL_BYTE_ADDR     +j*4);
            assign reg_irq_sta_amp_aol_cs[j]      = (addr== `IRQ_STA_AMP_AOL_BYTE_ADDR     +j*4);
            assign reg_irq_sta_amp_i2c_err_cs[j]  = (addr== `IRQ_STA_AMP_I2C_ERR_BYTE_ADDR +j*4);
            assign reg_irq_mask_amp_vol_cs[j]     = (addr== `IRQ_MASK_AMP_VOL_BYTE_ADDR    +j*4);
            assign reg_irq_mask_amp_aol_cs[j]     = (addr== `IRQ_MASK_AMP_AOL_BYTE_ADDR    +j*4);
            assign reg_irq_mask_amp_i2c_err_cs[j] = (addr== `IRQ_MASK_AMP_I2C_ERR_BYTE_ADDR+j*4);
        end 
    endgenerate
   
    generate
        for(j=0;j<`IN_AIR_NUM;j=j+1)begin : in_cs
            assign reg_in_air_tl_cs[j]       = (addr<`IN_AIR_TL_BYTE_ADDR+j*4+`IN_AIR_TL_BYTE_WID&&addr>=`IN_AIR_TL_BYTE_ADDR+j*4);
            assign reg_in_air_tv_cs[j]       = (addr<`IN_AIR_TV_BYTE_ADDR+j*4+`IN_AIR_TV_BYTE_WID&&addr>=`IN_AIR_TV_BYTE_ADDR+j*4);
            assign reg_irq_sta_in_tol_cs[j]  = (addr== `IRQ_STA_IN_TOL_BYTE_ADDR +j*4);
            assign reg_irq_mask_in_tol_cs[j] = (addr== `IRQ_MASK_IN_TOL_BYTE_ADDR+j*4);
        end
    endgenerate
    
    generate
        for(j=0;j<`OUT_AIR_NUM;j=j+1)begin :out_cs
            assign reg_out_air_tl_cs[j]       = (addr<`OUT_AIR_TL_BYTE_ADDR+j*4+`OUT_AIR_TL_BYTE_WID&&addr>=`OUT_AIR_TL_BYTE_ADDR+j*4);
            assign reg_out_air_tv_cs[j]       = (addr<`OUT_AIR_TV_BYTE_ADDR+j*4+`OUT_AIR_TV_BYTE_WID&&addr>=`OUT_AIR_TV_BYTE_ADDR+j*4);
            assign reg_irq_sta_out_tol_cs[j]  = (addr==`IRQ_STA_OUT_TOL_BYTE_ADDR +j*4);
            assign reg_irq_mask_out_tol_cs[j] = (addr==`IRQ_MASK_OUT_TOL_BYTE_ADDR+j*4);
        end
    endgenerate
    
    //_____________________________________________________________________
    always@(*) begin 
         if( reg_cf_gen_scr_cs)rdDa<= reg_cf_gen_scr;
    else if( reg_cf_gen_vf_cs )rdDa<= reg_cf_gen_vf ;
    else if( reg_cf_gen_rst_cs)rdDa<= reg_cf_gen_rst;
    else if( reg_fan_rst_cs   )rdDa<= reg_fan_rst   ;
    else if( reg_fan_mode_cs  )rdDa<= reg_fan_mode  ;
    else if( reg_fan_speed_cs )rdDa<= reg_fan_speed ;
    else if( reg_prob_pres_cs )rdDa<= reg_prob_pres ; 
    else if( reg_cf_gen_id_cs )rdDa<= reg_cf_gen_id [(addr- `CF_GEN_ID_BYTE_ADDR)*8+:8];
    else if( reg_cf_gen_sn_cs )rdDa<= reg_cf_gen_sn [(addr- `CF_GEN_SN_BYTE_ADDR)*8+:8];
    else if( reg_cf_gen_fm_cs )rdDa<= reg_cf_gen_fm [(addr- `CF_GEN_FM_BYTE_ADDR)*8+:8];
    else if( reg_cf_gen_dna_cs)rdDa<= reg_cf_gen_dna[(addr-`CF_GEN_DNA_BYTE_ADDR)*8+:8];
    else if( reg_cf_gen_pw_cs )rdDa<= reg_cf_gen_pw [(addr- `CF_GEN_PW_BYTE_ADDR)*8+:8];
	else if( reg_amp_res_cs   )rdDa<= reg_amp_res   [(addr- `AMP_RES_BYTE_ADDR  )*8+:8];
    else if( reg_amp_vv_cs    )rdDa<= reg_amp_vv    [(addr- `AMP_VV_BYTE_ADDR   )*8+:8];
	else if( reg_amp_vl_cs    )rdDa<= reg_amp_vl    [(addr- `AMP_VL_BYTE_ADDR   )*8+:8];
	else if( reg_amp_av_cs    )rdDa<= reg_amp_av    [(addr- `AMP_AV_BYTE_ADDR   )*8+:8];
	else if( reg_amp_al_cs    )rdDa<= reg_amp_al    [(addr- `AMP_AL_BYTE_ADDR   )*8+:8];
	else if( reg_amp_rv_cs    )rdDa<= reg_amp_rv    [(addr- `AMP_RV_BYTE_ADDR   )*8+:8];
	else if(|reg_irq_sta_amp_vol_cs     )rdDa<= reg_irq_sta_amp_vol     [addr32-`IRQ_STA_AMP_VOL_ADDR     ];
	else if(|reg_irq_sta_amp_aol_cs     )rdDa<= reg_irq_sta_amp_aol     [addr32-`IRQ_STA_AMP_AOL_ADDR     ];
	else if(|reg_irq_sta_amp_i2c_err_cs )rdDa<= reg_irq_sta_amp_i2c_err [addr32-`IRQ_STA_AMP_I2C_ERR_ADDR ];
	else if(|reg_irq_mask_amp_vol_cs    )rdDa<= reg_irq_mask_amp_vol    [addr32-`IRQ_MASK_AMP_VOL_ADDR    ];
	else if(|reg_irq_mask_amp_aol_cs    )rdDa<= reg_irq_mask_amp_aol    [addr32-`IRQ_MASK_AMP_AOL_ADDR    ];
	else if(|reg_irq_mask_amp_i2c_err_cs)rdDa<= reg_irq_mask_amp_i2c_err[addr32-`IRQ_MASK_AMP_I2C_ERR_ADDR];
	else if(|reg_in_air_tl_cs           )rdDa<= reg_in_air_tl           [addr32-`IN_AIR_TL_ADDR           ];
	else if(|reg_in_air_tv_cs           )rdDa<= reg_in_air_tv           [addr32-`IN_AIR_TV_ADDR           ];
	else if(|reg_irq_sta_in_tol_cs      )rdDa<= reg_irq_sta_in_tol      [addr32-`IRQ_STA_IN_TOL_ADDR      ];
	else if(|reg_irq_mask_in_tol_cs     )rdDa<= reg_irq_mask_in_tol     [addr32-`IRQ_MASK_IN_TOL_ADDR     ];
	else if(|reg_out_air_tl_cs          )rdDa<= reg_out_air_tl          [addr32-`OUT_AIR_TL_ADDR          ];
	else if(|reg_out_air_tv_cs          )rdDa<= reg_out_air_tv          [addr32-`OUT_AIR_TV_ADDR          ];	
	else if(|reg_irq_sta_out_tol_cs     )rdDa<= reg_irq_sta_out_tol     [addr32-`IRQ_STA_OUT_TOL_ADDR     ];
	else if(|reg_irq_mask_out_tol_cs    )rdDa<= reg_irq_mask_out_tol    [addr32-`IRQ_MASK_OUT_TOL_ADDR    ];
    else rdDa <= 8'h00; 
    end
    
    //_____________________________________________________________________    
    always @( posedge clk) begin
        if (rst) begin
            reg_cf_gen_rst <= 1;
            reg_cf_gen_scr <= 0;
            reg_cf_gen_pw  <= 0;
        end 
        else if(wrEn) begin
                 if(reg_cf_gen_rst_cs)reg_cf_gen_rst <= wrDa[`CF_GEN_RST_BIT_WID-1:0];
            else if(reg_cf_gen_scr_cs)reg_cf_gen_scr <= wrDa[`CF_GEN_SCR_BIT_WID-1:0];
            else if(reg_cf_gen_pw_cs )reg_cf_gen_pw[(addr-`CF_GEN_PW_BYTE_ADDR)*8+:8]<= wrDa; 
        end
    end
    
    //_____________________________________________________________________
    always @( posedge clk) begin
        if(rst) begin
            reg_fan_rst  <=1;
            reg_fan_mode <=0;//0 auto
            reg_fan_speed<=0;
            IRQ_Cfpga    <=0; 
            reg_amp_res  <=0;//about 0.8V
            reg_amp_vl   <={64{8'hFE}};
            reg_amp_al   <={64{8'h80}};
        end
        else if(wrEn) begin 
                 if(reg_fan_rst_cs  )reg_fan_rst  <= wrDa[`FAN_RST_BIT_WID -1:0];
            else if(reg_fan_mode_cs )reg_fan_mode <= wrDa[`FAN_MODE_BIT_WID-1:0];
            else if(reg_fan_speed_cs)reg_fan_speed<= wrDa[2:0]; 
			else if(reg_amp_res_cs  )reg_amp_res[(addr-`AMP_RES_BYTE_ADDR)*8+:8]<= wrDa; 
            else if(reg_amp_vl_cs   )reg_amp_vl [(addr-`AMP_VL_BYTE_ADDR )*8+:8]<= wrDa;
            else if(reg_amp_al_cs   )reg_amp_al [(addr-`AMP_AL_BYTE_ADDR )*8+:8]<= wrDa; 
      end
        else begin 
            IRQ_Cfpga <= (|(reg_irq_sta_amp_i2c_err	& reg_irq_mask_amp_i2c_err	)	)||
						 (|(reg_irq_sta_amp_aol 	& reg_irq_mask_amp_aol 		)   )||
						 (|(reg_irq_sta_amp_vol 	& reg_irq_mask_amp_vol 		)   )||
						 (|(reg_irq_sta_out_tol 	& reg_irq_mask_out_tol 		)   )||
						 (|(reg_irq_sta_in_tol  	& reg_irq_mask_in_tol 		)   )||
							switch_in_sync[7]; 
        end
    end
    reg    IRQ_Pfpga;
	reg    IRQ_Cfpga;
    
    wire [`CHN-1:0] R_IC_ERR;
    wire [`CHN-1:0] E_IC_ERR;
    
    generate
        for(j=0;j<`CHN;j=j+1)begin : chs_write
            always @( posedge clk) begin
                //if(rst) begin
                //    reg_irq_mask_amp_vol[j]    =0;
                //    reg_irq_mask_amp_aol[j]    =0;
                //    reg_irq_mask_amp_i2c_err[j]=0;
                //    reg_irq_sta_amp_vol[j]     =0;
                //    reg_irq_sta_amp_aol[j]     =0;
                //    reg_irq_sta_amp_i2c_err[j] =0;
                //end
                if(wrEn) begin 
                         if(reg_irq_mask_amp_vol_cs[j]    ) reg_irq_mask_amp_vol[j]    <= wrDa[0]	 ;
                    else if(reg_irq_mask_amp_aol_cs[j]    ) reg_irq_mask_amp_aol[j]    <= wrDa[0]	 ;
                    else if(reg_irq_mask_amp_i2c_err_cs[j]) reg_irq_mask_amp_i2c_err[j]<= wrDa[0]	 ;
                    else if(reg_irq_sta_amp_vol_cs[j]     ) reg_irq_sta_amp_vol[j]     <= 1		 ;
                    else if(reg_irq_sta_amp_aol_cs[j]     ) reg_irq_sta_amp_aol[j]     <= 1		 ;
                    else if(reg_irq_sta_amp_i2c_err_cs[j] ) reg_irq_sta_amp_i2c_err[j] <= 1		 ; 
                end
                else if(rdEn)begin 
					 if( reg_irq_sta_amp_vol_cs[j]	  ) reg_irq_sta_amp_vol[j]		<=0		 ;
                    else if( reg_irq_sta_amp_aol_cs[j]	  ) reg_irq_sta_amp_aol[j]		<=0		 ;
                    else if( reg_irq_sta_amp_i2c_err_cs[j]) reg_irq_sta_amp_i2c_err[j]	<=0		 ; 	
                end
                else begin
					if((!reg_amp_av[(j+1)*8-1])&&(!reg_amp_al[(j+1)*8-1])&&(reg_amp_av[j*8+:7] > reg_amp_al[j*8+:7])) 	reg_irq_sta_amp_aol[j] 		<=1;
					if(reg_amp_vv[j*8+:8] > reg_amp_vl[j*8+:8]) 														reg_irq_sta_amp_vol[j] 		<=1;
					if(R_IC_ERR[j]||E_IC_ERR[j]) 																		reg_irq_sta_amp_i2c_err[j]	<=1; 
                end 
            end
        end
    endgenerate 
    
    wire [1:0] in_air_valid	;
    wire [3:0] out_air_valid;
    generate
        for(j=0;j<`IN_AIR_NUM;j=j+1)begin :in_write
            always @( posedge clk) begin
                if(rst) begin
                    reg_in_air_tl[j]		<=8'h78; 
                    reg_irq_mask_in_tol[j]	<=0;
                    reg_irq_sta_in_tol[j]	<=0;
                end
                else if(wrEn) begin 
                    if( reg_irq_mask_in_tol_cs[j])								reg_irq_mask_in_tol[j]	<= wrDa[`IRQ_MASK_IN_TOL_BIT_WID-1:0];
                    else if( reg_in_air_tl_cs[j]) 								reg_in_air_tl[j][(addr-`IN_AIR_TL_BYTE_ADDR-j*4)*8+:8]<= wrDa;
                    else if( reg_irq_sta_in_tol_cs[j]) 							reg_irq_sta_in_tol[j]	<= 1;
                end
                else if(rdEn) begin
                    if( reg_irq_sta_in_tol_cs[j])								reg_irq_sta_in_tol[j]	<= 0;
                end
                else begin 
                    if(in_air_valid[j] && (reg_in_air_tv[j]>reg_in_air_tl[j])) 	reg_irq_sta_in_tol[j]	<= 1;
                end
            end
        end
    endgenerate 
        
   generate
       for(j=0;j<`OUT_AIR_NUM;j=j+1)begin :out_write
           always @( posedge clk) begin
               if(rst) begin
                   reg_out_air_tl[j]		=8'h78; 
                   reg_irq_mask_out_tol[j]	=0;
                   reg_irq_sta_out_tol[j]	=0;
               end
               else if(wrEn) begin 
                   if( reg_irq_mask_out_tol_cs[j])								reg_irq_mask_out_tol[j]	<= wrDa[`IRQ_MASK_OUT_TOL_BIT_WID-1:0]	;
                   else if( reg_out_air_tl_cs[j]) 								reg_out_air_tl[j][(addr-`OUT_AIR_TL_BYTE_ADDR-j*4)*8+:8]<= wrDa	;
                   else if( reg_irq_sta_out_tol_cs[j]) 							reg_irq_sta_out_tol[j]	<= 1;
               end
               else if(rdEn) begin
                   if(reg_irq_sta_out_tol_cs[j])								reg_irq_sta_out_tol[j]	<= 0;
               end
               else begin
                   if(out_air_valid && (reg_out_air_tv[j]>reg_out_air_tl[j])) 	reg_irq_sta_out_tol[j]	<= 1;
               end
           end
       end
   endgenerate
    
    reg [`CHN*8-1:0] 	reg_amp_res_r	;
	reg [`CHN-1:0  ] 			reg_amp_res_wr_r;

    always @( posedge clk)begin
        //if(rst)
		//			reg_amp_res_r <= 0;
					reg_amp_res_r<= reg_amp_res;
	end
	

    generate
		for(j=0;j<`CHN;j=j+1)begin :reg_amp_wr_process
			always @( posedge clk) begin
			//if(rst) reg_amp_res_wr_r[j] <= 0;
				reg_amp_res_wr_r[j] <= wrEn&&(addr==(`AMP_RES_BYTE_ADDR+j));
			end
		end
	endgenerate
    
 
    //AMP CTRL
    wire [`CHN-1:0	] 	amp_scl_in 		;
	wire [`CHN-1:0	] 	amp_scl_out		;
    wire [`CHN-1:0	] 	amp_sda_in 		;
	wire [`CHN-1:0	] 	amp_sda_in_R_tmp 		;
 	wire [`CHN-1:0	] 	amp_sda_in_VI_tmp 		;
    wire [`CHN-1:0	] 	amp_sda_out		;
	wire [`CHN-1:0	] 	amp_sda_out_tmp		;
    wire [`CHN-1:0	] 	amp_scl_in_sync ;
    wire [`CHN-1:0	] 	amp_sda_in_sync ; 
	wire [`CHN-1:0	] 	SCL				;
	wire [`CHN-1:0	] 	SDA				;
    /**/
	
		

	wire [`CHN*8-1:0] 	addr_amp_R		;
	wire [`CHN-1:0	]			wrEn_amp_R		;
	wire [`CHN-1:0	]			rdEn_amp_R		;
	wire [`CHN*8-1:0]	wrDa_amp_R		;
	reg  [`CHN*8-1:0]	rdDa_amp_R		;
	wire [`CHN*8-1:0] 	addr_amp_VI		;
	wire [`CHN-1:0	]			wrEn_amp_VI		;
	wire [`CHN-1:0	]			rdEn_amp_VI		;
	wire [`CHN*8-1:0]	wrDa_amp_VI		;
	reg  [`CHN*8-1:0]	rdDa_amp_VI		;
	reg  [`CHN*8-1:0]	reg_amp_r		;
	wire [`CHN*8-1:0]	reg_amp_a  		;
	wire [`CHN*8-1:0]	reg_amp_v  		;
	wire [`CHN-1:0	]			reg_amp_r_cs	;
	wire [`CHN-1:0	]			reg_amp_a_cs	;
	wire [`CHN-1:0	]			reg_amp_v_cs	;	
	wire [`CHN-1:0	]  			reg_amp_r_cfg_cs;

    generate 
        for (j=0; j<`CHN; j=j+1) begin :amp_ctrl_inst
        
        //  IOBUF amp_scl(.O(amp_scl_in[j] ),.I(1'b0),.IO(SCL[j]),.T(amp_scl_out[j]));
		// IOBUF amp_sda(.O(amp_sda_in[j] ),.I(1'b0),.IO(SDA[j]),.T(amp_sda_out[j]));

       //     sync    #(.BIT(1),.LEVEL(3),.RST_V(1))
       //     u_sync_amp_scl(.clk(clk),.rst(rst),.i(amp_scl_in[j]),.o(amp_scl_in_sync[j]));
       //     sync     #(.BIT(1),.LEVEL(3),.RST_V(1))
       //     u_sync_amp_sda(.clk(clk),.rst(rst),.i(amp_sda_in[j]),.o(amp_sda_in_sync[j]));
	   assign amp_scl_in [j] =1'b1;

		amp_ctrl #(
				.SYS_FREQ(50000000),
				.I2C_FREQ(100000  )
			)
			u_amp_ctrl(
				.clk 	(clk                              	   ),
				.rst    (rst                                   ),
				.r_err  (R_IC_ERR[j]                           ),
				.vi_err (E_IC_ERR[j]                           ),
				.v      (reg_amp_vv[j*8+:8]                    ),
				.i      (reg_amp_av[j*8+:8]                    ),
				.r_rd   (reg_amp_rv[j*8+:8]                    ),
				.r_wr   (reg_amp_res_r[j*8+:8]                 ),                              
				.r_wren (reg_amp_res_wr_r[j]                   ),
				.scl_in (        amp_scl_in [j]          	   	),//
				.scl_out(amp_scl_out[j]                        ),
				.sda_in (amp_sda_in [j]                   		),
				.sda_out(amp_sda_out[j]                        )
			); 
		end	
   endgenerate	
   
	   

	   generate 
        for (j=0; j<`CHN; j=j+1) begin :dummy_inst
		
		assign amp_sda_in[j]=(amp_sda_in_R_tmp[j] && amp_sda_in_VI_tmp[j] ?1'b1:1'b0);
		
			i2cSlave #(
				.I2C_ADDRESS		(`R_ISL95811_ADDR),
				.I2C_ADDR_BYTE_WIDTH(`AMP_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			R_i2cSlaveInst(
				.clk     			(clk        								),
				.rst        		(rst        								),
				.scl        		(amp_scl_out[j]								),
				.sdaIn      		(amp_sda_out[j]								),  
				.sdaOut				(amp_sda_in_R_tmp[j]						),
				.addr       		(addr_amp_R[j*8+:8]							), 
				.readEn     		(rdEn_amp_R[j]								),
				.writeEn    		(wrEn_amp_R[j]								), 
				.writeData  		(wrDa_amp_R[j*8+:8]							),
				.readData   		(rdDa_amp_R[j*8+:8]							)
			);

			
			i2cSlave #(
				.I2C_ADDRESS		(`E_PAC1710_ADDR),
				.I2C_ADDR_BYTE_WIDTH(`AMP_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			VI_i2cSlaveInst(
				.clk     			(clk        							),
				.rst        		(rst        							),
				.scl        		(amp_scl_out[j]							),
				.sdaIn      		(amp_sda_out[j]							),  
				.sdaOut				(amp_sda_in_VI_tmp[j]					),
				.addr       		(addr_amp_VI[j*8+:8]					), 
				.readEn     		(rdEn_amp_VI[j]							),
				.writeEn    		(wrEn_amp_VI[j]							), 
				.writeData  		(wrDa_amp_VI[j*8+:8]					),
				.readData   		(rdDa_amp_VI[j*8+:8]					)
			);
	
			assign reg_amp_r_cs[j] 	 =(addr_amp_R [j*8+:8] ==`AMP_DUMMY_R_ADDR);
			assign reg_amp_a_cs[j] 	 =(addr_amp_VI[j*8+:8] ==`AMP_DUMMY_A_ADDR);
			assign reg_amp_v_cs[j] 	 =(addr_amp_VI[j*8+:8] ==`AMP_DUMMY_V_ADDR);
			
			always @( posedge clk) begin
					 if(reg_amp_r_cs[j])  					rdDa_amp_R[j*8+:8]	<= reg_amp_r[j*8+:8];
			end 
			
			always @( posedge clk) begin
					if(wrEn_amp_R[j]&&reg_amp_r_cs[j])		reg_amp_r[j*8+:8]	 <=wrDa_amp_R[j*8+:8];
			end
			
			
			always @( posedge clk) begin
					 if(reg_amp_a_cs[j]) rdDa_amp_VI[j*8+:8]<= reg_amp_a[j*8+:8];
				else if(reg_amp_v_cs[j]) rdDa_amp_VI[j*8+:8]<= reg_amp_v[j*8+:8];
			end
			
			assign	reg_amp_a[j*8+:8]	=j<<1;
			assign	reg_amp_v[j*8+:8]	=j;
		
		end	
   endgenerate
	
	
    wire inlet_scl_in_sync  ;
    wire inlet_sda_in_sync  ;
    wire outlet_scl_in_sync ;
    wire outlet_sda_in_sync ;

   
//  IOBUF inlet_scl (.O(inlet_scl_in ),.I(1'b0),.IO(SCL_FAN_IN ),.T(inlet_scl_out ));
//  IOBUF inlet_sda (.O(inlet_sda_in ),.I(1'b0),.IO(SDA_FAN_IN ),.T(inlet_sda_out ));
  
// 	IOBUF outlet_scl(.O(outlet_scl_in),.I(1'b0),.IO(SCL_FAN_OUT),.T(outlet_scl_out));
// 	IOBUF outlet_sda(.O(outlet_sda_in),.I(1'b0),.IO(SDA_FAN_OUT),.T(outlet_sda_out));

//  sync            #(.BIT(1),.LEVEL(3),.RST_V(1))     
//  u_sync_inlet_scl (.clk(clk),.rst(rst),.i(inlet_scl_in ),.o(inlet_scl_in_sync ));
//  sync            #(.BIT(1),.LEVEL(3),.RST_V(1))       
//  u_sync_inlet_sda (.clk(clk),.rst(rst),.i(inlet_sda_in ),.o(inlet_sda_in_sync ));
//  sync           #(.BIT(1),.LEVEL(3),.RST_V(1))        
//  u_sync_outlet_scl(.clk(clk),.rst(rst),.i(outlet_scl_in),.o(outlet_scl_in_sync));
//  sync            #(.BIT(1),.LEVEL(3),.RST_V(1))       
//  u_sync_outlet_sda(.clk(clk),.rst(rst),.i(outlet_sda_in),.o(outlet_sda_in_sync));
        
	wire inlet_scl_in       			;
	wire inlet_sda_in       			;
	wire inlet_sda_out      			;
	wire outlet_scl_in      			;
	wire outlet_sda_in      			;
	wire outlet_sda_out     			;
	wire rdEn_inlet0                    ;
	wire rdEn_inlet1	                ;
	wire wrEn_inlet0                    ;
	wire wrEn_inlet1                    ;
	wire rdEn_outlet0                   ;
	wire rdEn_outlet1                   ;
	wire rdEn_outlet2                   ;
	wire rdEn_outlet3	                ;
	wire wrEn_outlet0                   ;
	wire wrEn_outlet1                   ;
	wire wrEn_outlet2                   ;
	wire wrEn_outlet3                   ;
	wire cs_reg_in_air_tv0              ;
	wire cs_reg_in_air_tv1 	            ;
	wire cs_reg_out_air_tv0             ;
	wire cs_reg_out_air_tv1 	        ;
	wire cs_reg_out_air_tv2             ;
	wire cs_reg_out_air_tv3             ;
	wire [7:0]addr_inlet0               ;
   	wire [7:0]addr_inlet1               ;
	wire [7:0]wrDa_inlet0               ;
	wire [7:0]wrDa_inlet1	            ;
	reg  [7:0]rdDa_inlet0               ;
	reg  [7:0]rdDa_inlet1               ;
	wire [7:0]addr_outlet0	            ;
	wire [7:0]addr_outlet1	            ;
	wire [7:0]addr_outlet2	            ;
	wire [7:0]addr_outlet3	            ;
	wire [7:0]wrDa_outlet0              ;
	wire [7:0]wrDa_outlet1              ;
	wire [7:0]wrDa_outlet2              ;
	wire [7:0]wrDa_outlet3	            ;
	reg	 [7:0]rdDa_outlet0              ;
	reg	 [7:0]rdDa_outlet1	            ;
	reg	 [7:0]rdDa_outlet2              ;
	reg	 [7:0]rdDa_outlet3              ;
	wire [7:0]reg_in_air_tv_fixed0	    ;
	wire [7:0]reg_in_air_tv_fixed1	    ;
	wire [7:0]reg_out_air_tv_fixed0     ;
	wire [7:0]reg_out_air_tv_fixed1     ;
	wire [7:0]reg_out_air_tv_fixed2     ;
	wire [7:0]reg_out_air_tv_fixed3     ;
	
			i2cSlave #(
				.I2C_ADDRESS(`INLET0_DUMMY_I2C_SLV_ADDR_7BIT),
				.I2C_ADDR_BYTE_WIDTH(`INLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			inlet0_i2cSlaveInst(
				.clk     	(clk        			),
				.rst        (rst        			),
				.scl        (inlet_scl_out	 		),
				.sdaIn      (inlet_sda_out		), 
				.sdaOut     (inlet_sda_in_tmp0			),        
				.addr       (addr_inlet0), 
				.readEn     (rdEn_inlet0  	),
				.writeEn    (wrEn_inlet0  	), 
				.writeData  (wrDa_inlet0     ),
				.readData   (rdDa_inlet0     )
			);
			
			
			assign cs_reg_in_air_tv0  		=  (addr_inlet0  == `INLET_DUMMY_TEM_ADDR	 );	
			assign reg_in_air_tv_fixed0		=	{4'b0111,switch_in_sync[0],2'b11,switch_in_sync[1]};		
			
			always @( posedge clk) begin
				if(cs_reg_in_air_tv0) rdDa_inlet0  <= reg_in_air_tv_fixed0;			 	
			end

			i2cSlave #(
				.I2C_ADDRESS(`INLET1_DUMMY_I2C_SLV_ADDR_7BIT),
				.I2C_ADDR_BYTE_WIDTH(`INLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			inlet1_i2cSlaveInst(
				.clk     	(clk        			),
				.rst        (rst        			),
				.scl        (inlet_scl_out	 		),
				.sdaIn      (inlet_sda_out			), 
				.sdaOut     (inlet_sda_in_tmp1		),        
				.addr       (addr_inlet1			), 
				.readEn     (rdEn_inlet1  			),
				.writeEn    (wrEn_inlet1  			), 
				.writeData  (wrDa_inlet1    	    ),
				.readData   (rdDa_inlet1     		)
			);
			
			assign cs_reg_in_air_tv1 		=  (addr_inlet1  == `INLET_DUMMY_TEM_ADDR	 );	
			assign reg_in_air_tv_fixed1		=	{4'b0111,switch_in_sync[0],2'b11,switch_in_sync[1]};
			
			always @( posedge clk) begin
				if(cs_reg_in_air_tv1) rdDa_inlet1  <= reg_in_air_tv_fixed1;			 	
			end
			
			i2cSlave #(
				.I2C_ADDRESS		(`OUTLET0_DUMMY_I2C_SLV_ADDR_7BIT	),
				.I2C_ADDR_BYTE_WIDTH(`OUTLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			outlet0_i2cSlaveInst(
				.clk     	(clk       	 		  ),
				.rst        (rst       		 	  ),
				.scl        (outlet_scl_out		  ),
				.sdaIn      (outlet_sda_out	 	  ), 
				.sdaOut     (outlet_sda_in_tmp0	  ), 
				.addr       (addr_outlet0 ), 
				.readEn     (rdEn_outlet0 ),
				.writeEn    (wrEn_outlet0 ), 
				.writeData  (wrDa_outlet0 ),
				.readData   (rdDa_outlet0 )
			);
			
			assign cs_reg_out_air_tv0 		=  (addr_outlet0  	== `OUTLET_DUMMY_TEM_ADDR    );	
			assign reg_out_air_tv_fixed0	=	{4'b0111,switch_in_sync[2],2'b11,switch_in_sync[3]};	
			
			always @( posedge clk) begin
				if(cs_reg_out_air_tv0 )	rdDa_outlet0 <= reg_out_air_tv_fixed0;
			end

			i2cSlave #(
				.I2C_ADDRESS		(`OUTLET1_DUMMY_I2C_SLV_ADDR_7BIT	),
				.I2C_ADDR_BYTE_WIDTH(`OUTLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			outlet1_i2cSlaveInst(
				.clk     	(clk       	 		  ),
				.rst        (rst       		 	  ),
				.scl        (outlet_scl_out		  ),
				.sdaIn      (outlet_sda_out	  	  ), 
				.sdaOut     (outlet_sda_in_tmp1	  ), 
				.addr       (addr_outlet1 ), 
				.readEn     (rdEn_outlet1 ),
				.writeEn    (wrEn_outlet1 ), 
				.writeData  (wrDa_outlet1 ),
				.readData   (rdDa_outlet1 )
			);
			
			assign cs_reg_out_air_tv1 		=  (addr_outlet1  	== `OUTLET_DUMMY_TEM_ADDR    );	
			assign reg_out_air_tv_fixed1	=	{4'b0111,switch_in_sync[2],2'b11,switch_in_sync[3]};			
			
			always @( posedge clk) begin
				if(cs_reg_out_air_tv1 )	rdDa_outlet1 <= reg_out_air_tv_fixed1;
			end
			
			i2cSlave #(
				.I2C_ADDRESS		(`OUTLET2_DUMMY_I2C_SLV_ADDR_7BIT	),
				.I2C_ADDR_BYTE_WIDTH(`OUTLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			outlet2_i2cSlaveInst(
				.clk     	(clk       	 		  ),
				.rst        (rst       		 	  ),
				.scl        (outlet_scl_out		  ),
				.sdaIn      (outlet_sda_out		  ), 
				.sdaOut     (outlet_sda_in_tmp2   ), 
				.addr       (addr_outlet2 ), 
				.readEn     (rdEn_outlet2 ),
				.writeEn    (wrEn_outlet2 ), 
				.writeData  (wrDa_outlet2 ),
				.readData   (rdDa_outlet2 )
			);
			
			assign cs_reg_out_air_tv2 		=  (addr_outlet2  	== `OUTLET_DUMMY_TEM_ADDR    );	
			assign reg_out_air_tv_fixed2	=	{4'b0111,switch_in_sync[2],2'b11,switch_in_sync[3]};
			
			always @( posedge clk) begin
				if(cs_reg_out_air_tv2 )	rdDa_outlet2 <= reg_out_air_tv_fixed2;
			end
			
			i2cSlave #(
				.I2C_ADDRESS		(`OUTLET3_DUMMY_I2C_SLV_ADDR_7BIT	),
				.I2C_ADDR_BYTE_WIDTH(`OUTLET_DUMMY_I2C_SLV_ADDR_BYTE_WID)
			)
			outlet3_i2cSlaveInst(
				.clk     	(clk       	 		  ),
				.rst        (rst       		 	  ),
				.scl        (outlet_scl_out		  ),
				.sdaIn      (outlet_sda_out	  	  ), 
				.sdaOut     (outlet_sda_in_tmp3   ), 
				.addr       (addr_outlet3 ), 
				.readEn     (rdEn_outlet3 ),
				.writeEn    (wrEn_outlet3 ), 
				.writeData  (wrDa_outlet3 ),
				.readData   (rdDa_outlet3 )
			);
			
			assign cs_reg_out_air_tv3 		=  (addr_outlet3  	== `OUTLET_DUMMY_TEM_ADDR    );	
			assign reg_out_air_tv_fixed3	=	{4'b0111,switch_in_sync[2],2'b11,switch_in_sync[3]};	
			
			always @( posedge clk) begin
				if(cs_reg_out_air_tv3 )	rdDa_outlet3 <= reg_out_air_tv_fixed3;
			end
			
		wire [7:0]switch_in_sync;
		wire [7:0]switch_in_sync_tmp;
		assign switch_in_sync = ~switch_in_sync_tmp;
		sync #(.BIT(8),.LEVEL(3),.RST_V(0))  
			u_sync_switch (.clk(clk),.rst(rst),.i(switch ),.o(switch_in_sync_tmp ));
		
		assign inlet_sda_in	=(inlet_sda_in_tmp0 && inlet_sda_in_tmp1 ?1'b1:1'b0);	
		assign outlet_sda_in=(outlet_sda_in_tmp0 && outlet_sda_in_tmp1 && outlet_sda_in_tmp2 && outlet_sda_in_tmp3 )?1'b1:1'b0;	
	

	
    fan_temp #(
        .SYS_FREQ(SYS_FREQ),
        .I2C_FREQ(100_000)
    )
    u_fan_temp(
        .clk           (clk               	),
        .rst           (rst               	),
        .manual        (reg_fan_mode      	),
        .manual_speed  (reg_fan_speed[2:0]	),
        .in_value      ({reg_in_air_tv[1],reg_in_air_tv[0]}),
        .in_valid      (in_air_valid      	),
        .out_value     ({reg_out_air_tv[3],reg_out_air_tv[2],reg_out_air_tv[1],reg_out_air_tv[0]}),
        .out_valid     (out_air_valid      	),		
		.inlet_scl_in  (inlet_scl_in  	   ),
		.inlet_scl_out (inlet_scl_out      ),
		.inlet_sda_in  (inlet_sda_in  	   ),
		.inlet_sda_out (inlet_sda_out      ),
		.outlet_scl_in (outlet_scl_in      ),
		.outlet_scl_out(outlet_scl_out     ),
		.outlet_sda_in (outlet_sda_in      ),
		.outlet_sda_out(outlet_sda_out     ),
        .pwm           (PWM                ),
		.speed(speed)
    ); 
	assign outlet_scl_in=1'b1;
	assign inlet_scl_in	=1'b1;	

 
// dna #(
//     .DNA_PORT_START_CNT (10 ),
//     .DNA_PORT_BYTE_WIDTH (`CF_GEN_DNA_BIT_WID))
// u_dna_master(
//     .clk(clk),
//     .rst(rst),
//     .dna_out(reg_cf_gen_dna),
//     .dna_valid()
// );
	
endmodule

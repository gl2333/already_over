`include "hardwarefpgadefine.vh"
//this file will not auto update, when changed in outside notepad editor
`timescale 1 ns / 1 ps
 
	module AXI4_DEV_v1_0 #  
	( 
		// Users to add parameters here 

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32, //32 bit width
		parameter integer C_S00_AXI_ADDR_WIDTH	= 13  //8K deepth
	)
	(
		// Users to add ports here
        output       IRQ               ,                                                    
        input  [4:0] PL_SWITCH         , //0 left, 1 right; up 0, down 1;
        output [3:0] PL_LED            , //0 left, 1 light on, 0 light off;
        input  [3:0] PL_UNUSED         ,   
        input  [1:0] EMERMEA           , //0 left, 1 right on pcb 
        output       TRIGGER           ,             
        output       USM_PWR_SW        ,
        inout        CLOCK_SCL         ,                                          
        inout        CLOCK_SDA         ,
        inout        RTC_SCL           ,
        inout        RTC_SDA           ,  
        input        XDCR_PRESENT      ,        
        input        XDCR_SCL          ,
        input        XDCR_SDA          ,
        inout  [`CHS-1:0] PHA_SCL      ,   
        inout  [`CHS-1:0] PHA_SDA      ,
        inout  [`CHS-1:0] CTRL_SCL     ,                               
        inout  [`CHS-1:0] CTRL_SDA     ,         
        input  [`CHS-1:0] PRESENT      ,                                      
        input  [`CHS-1:0] CTRL_IRQ     ,
        output [`CHS-1:0] CTRL_PROG_B  , 
        input  [`CHS-1:0] PHA_IRQ      ,
        output [`CHS-1:0] PHA_PROG_B   ,       
        inout  [`PWR-1:0] PWR_SCL      ,
        inout  [`PWR-1:0] PWR_SDA      ,         
        input  [`PWR-1:0] PWR_AC_OK    ,
        input  [`PWR-1:0] PWR_DC_OK    ,
        input  [`PWR-1:0] PWR_FAULT    ,
        output [`PWR-1:0] PWR_INHIBIT  ,
        output [`USM-1:0] USM_POWERCTRL,
        output [`USM-1:0] USM_DRIVE_A_N,
        output [`USM-1:0] USM_DRIVE_A_P,
        output [`USM-1:0] USM_DRIVE_B_N,
        output [`USM-1:0] USM_DRIVE_B_P,
        input  [`USM-1:0] USM_OUT_A    ,
        input  [`USM-1:0] USM_OUT_B    ,
        input  [`USM-1:0] USM_OUT_Z    ,
        input  [`USM-1:0] USM_ALARM_A  ,
        input  [`USM-1:0] USM_ALARM_B  ,
        input  [`USM-1:0] USM_ALARM_Z  ,
        input  [`USM-1:0] USM_ALARM_D  ,        
        input  [`USM-1:0] USM_LIMIT    ,  
        
		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface S00_AXI
		input  wire                                  s00_axi_aclk,
		input  wire                                  s00_axi_aresetn,
		input  wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_awaddr,
		input  wire [2 : 0]                          s00_axi_awprot,
		input  wire                                  s00_axi_awvalid,
		output wire                                  s00_axi_awready,
		input  wire [C_S00_AXI_DATA_WIDTH-1 : 0]     s00_axi_wdata,
		input  wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input  wire                                  s00_axi_wvalid,
		output wire                                  s00_axi_wready,
		output wire [1 : 0]                          s00_axi_bresp,
		output wire                                  s00_axi_bvalid,
		input  wire                                  s00_axi_bready,
		input  wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_araddr,
		input  wire [2 : 0]                          s00_axi_arprot,
		input  wire                                  s00_axi_arvalid,
		output wire                                  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0]     s00_axi_rdata,
		output wire [1 : 0]                          s00_axi_rresp,
		output wire                                  s00_axi_rvalid,
		input  wire                                  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
wire clk_scl_in ;
wire clk_sda_in ;
wire clk_scl_out;
wire clk_sda_out;
wire rtc_scl_in ;
wire rtc_sda_in ;        
wire rtc_scl_out;
wire rtc_sda_out;     
    
IOBUF inst0 (.IO(CLOCK_SCL),.O(clk_scl_in),.I(1'b0),.T(clk_scl_out));
IOBUF inst1 (.IO(CLOCK_SDA),.O(clk_sda_in),.I(1'b0),.T(clk_sda_out));
IOBUF inst2 (.IO(  RTC_SCL),.O(rtc_scl_in),.I(1'b0),.T(rtc_scl_out));
IOBUF inst3 (.IO(  RTC_SDA),.O(rtc_sda_in),.I(1'b0),.T(rtc_sda_out));

wire [`CHS-1:0] pha_scl_in   ;
wire [`CHS-1:0] pha_sda_in   ;
wire [`CHS-1:0] pha_scl_out  ;
wire [`CHS-1:0] pha_sda_out  ;
wire [`CHS-1:0] ctrl_scl_in  ;
wire [`CHS-1:0] ctrl_sda_in  ;
wire [`CHS-1:0] ctrl_scl_out ;
wire [`CHS-1:0] ctrl_sda_out ;     
wire [`PWR-1:0] pwr_scl_in   ;
wire [`PWR-1:0] pwr_sda_in   ;     
wire [`PWR-1:0] pwr_scl_out  ;
wire [`PWR-1:0] pwr_sda_out  ;   

genvar j;
generate
for(j=0;j<`PWR;j=j+1)begin: pwr_inst
    IOBUF inst0 (.IO(PWR_SCL[j]),.O(pwr_scl_in[j]),.I(1'b0),.T(pwr_scl_out[j]));
    IOBUF inst1 (.IO(PWR_SDA[j]),.O(pwr_sda_in[j]),.I(1'b0),.T(pwr_sda_out[j]));
    end
endgenerate
generate
for(j=0;j<`CHS;j=j+1)begin: chs_inst
    IOBUF inst0 (.IO( PHA_SCL[j]),.O( pha_scl_in[j]),.I(1'b0),.T( pha_scl_out[j]));
    IOBUF inst1 (.IO( PHA_SDA[j]),.O( pha_sda_in[j]),.I(1'b0),.T( pha_sda_out[j]));
    IOBUF inst2 (.IO(CTRL_SCL[j]),.O(ctrl_scl_in[j]),.I(1'b0),.T(ctrl_scl_out[j]));
    IOBUF inst3 (.IO(CTRL_SDA[j]),.O(ctrl_sda_in[j]),.I(1'b0),.T(ctrl_sda_out[j]));
    end
endgenerate


	AXI4_DEV_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AXI4_DEV_v1_0_S00_AXI_inst (
        .S_AXI_ACLK   (s00_axi_aclk   ),
        .S_AXI_ARESETN(s00_axi_aresetn),
        .S_AXI_AWADDR (s00_axi_awaddr ),
        .S_AXI_AWPROT (s00_axi_awprot ),
        .S_AXI_AWVALID(s00_axi_awvalid),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WDATA  (s00_axi_wdata  ),
        .S_AXI_WSTRB  (s00_axi_wstrb  ),
        .S_AXI_WVALID (s00_axi_wvalid ),
        .S_AXI_WREADY (s00_axi_wready ),
        .S_AXI_BRESP  (s00_axi_bresp  ),
        .S_AXI_BVALID (s00_axi_bvalid ),
        .S_AXI_BREADY (s00_axi_bready ),
        .S_AXI_ARADDR (s00_axi_araddr ),
        .S_AXI_ARPROT (s00_axi_arprot ),
        .S_AXI_ARVALID(s00_axi_arvalid),
        .S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_RDATA  (s00_axi_rdata  ),
        .S_AXI_RRESP  (s00_axi_rresp  ),
        .S_AXI_RVALID (s00_axi_rvalid ),
        .S_AXI_RREADY (s00_axi_rready ),     
        .IRQ          (IRQ            ),
        .PL_SWITCH    (PL_SWITCH      ),
        .PL_LED       (PL_LED         ),
        .PL_UNUSED    (PL_UNUSED      ),
        .EMERMEA      (EMERMEA        ),
        .TRIGGER      (TRIGGER        ),
        .USM_PWR_SW   (USM_PWR_SW     ),
        .clk_scl_in   (clk_scl_in     ),
        .clk_sda_in   (clk_sda_in     ),
        .clk_scl_out  (clk_scl_out    ),
        .clk_sda_out  (clk_sda_out    ),
        .rtc_scl_in   (rtc_scl_in     ),
        .rtc_sda_in   (rtc_sda_in     ),
        .rtc_scl_out  (rtc_scl_out    ),
        .rtc_sda_out  (rtc_sda_out    ),
        .pha_scl_in   (pha_scl_in     ),
        .pha_sda_in   (pha_sda_in     ),
        .pha_scl_out  (pha_scl_out    ),
        .pha_sda_out  (pha_sda_out    ),
        .ctrl_scl_in  (ctrl_scl_in    ),
        .ctrl_sda_in  (ctrl_sda_in    ),
        .ctrl_scl_out (ctrl_scl_out   ),
        .ctrl_sda_out (ctrl_sda_out   ),
        .pwr_scl_in   (pwr_scl_in     ),
        .pwr_sda_in   (pwr_sda_in     ),
        .pwr_scl_out  (pwr_scl_out    ),
        .pwr_sda_out  (pwr_sda_out    ),
        .XDCR_PRESENT (XDCR_PRESENT   ),
        .XDCR_SCL     (XDCR_SCL       ),
        .XDCR_SDA     (XDCR_SDA       ),  
        .PRESENT      (PRESENT        ),
        .CTRL_IRQ     (CTRL_IRQ       ),
        .CTRL_PROG_B  (CTRL_PROG_B    ),
        .PHA_IRQ      (PHA_IRQ        ),
        .PHA_PROG_B   (PHA_PROG_B     ),
        .PWR_AC_OK    (PWR_AC_OK      ),
        .PWR_DC_OK    (PWR_DC_OK      ),
        .PWR_FAULT    (PWR_FAULT      ),
        .PWR_INHIBIT  (PWR_INHIBIT    ),
        .USM_POWERCTRL(USM_POWERCTRL  ),
        .USM_DRIVE_A_N(USM_DRIVE_A_N  ),
        .USM_DRIVE_A_P(USM_DRIVE_A_P  ),
        .USM_DRIVE_B_N(USM_DRIVE_B_N  ),
        .USM_DRIVE_B_P(USM_DRIVE_B_P  ),
        .USM_OUT_A    (USM_OUT_A      ),
        .USM_OUT_B    (USM_OUT_B      ),
        .USM_OUT_Z    (USM_OUT_Z      ),
        .USM_ALARM_A  (USM_ALARM_A    ),
        .USM_ALARM_B  (USM_ALARM_B    ),
        .USM_ALARM_Z  (USM_ALARM_Z    ),
        .USM_ALARM_D  (USM_ALARM_D    ),
        .USM_LIMIT    (USM_LIMIT      ) 
	);

	// Add user logic here

	// User logic ends

	endmodule

`include "hardwarefpgadefine.vh"
`timescale 1 ns / 1 ps

	module AXI4_DEV_v1_0_S00_AXI # 
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	   = 32, //32 bit width
        parameter integer C_S_AXI_ADDR_WIDTH       = 13  //8K deepth
	)
	(
		// Users to add ports here
        output            IRQ          ,                                                    
        input  [4:0]      PL_SWITCH    , //0 left, 1 right; up 0, down 1;
        output [3:0]      PL_LED       , //0 left, 1 light on, 0 light off;
        input  [3:0]      PL_UNUSED    ,   
        input  [1:0]      EMERMEA      , //0 left, 1 right on pcb 
        output            TRIGGER      ,             
        output            USM_PWR_SW   ,          
        input             clk_scl_in ,
        input             clk_sda_in ,
        output            clk_scl_out,
        output            clk_sda_out,
        input             rtc_scl_in   ,
        input             rtc_sda_in   ,         
        output            rtc_scl_out  ,
        output            rtc_sda_out  ,   
        input             XDCR_PRESENT ,        
        input             XDCR_SCL     ,
        input             XDCR_SDA     ,     
        input  [`CHS-1:0] pha_scl_in   ,
        input  [`CHS-1:0] pha_sda_in   ,
        output [`CHS-1:0] pha_scl_out  ,
        output [`CHS-1:0] pha_sda_out  ,
        input  [`CHS-1:0] ctrl_scl_in  ,
        input  [`CHS-1:0] ctrl_sda_in  ,
        output [`CHS-1:0] ctrl_scl_out ,
        output [`CHS-1:0] ctrl_sda_out ,          
        input  [`PWR-1:0] pwr_scl_in   ,
        input  [`PWR-1:0] pwr_sda_in   ,         
        output [`PWR-1:0] pwr_scl_out  ,
        output [`PWR-1:0] pwr_sda_out  ,   
        input  [`CHS-1:0] PRESENT      ,                                      
        input  [`CHS-1:0] CTRL_IRQ     ,
        output [`CHS-1:0] CTRL_PROG_B  , 
        input  [`CHS-1:0] PHA_IRQ      ,
        output [`CHS-1:0] PHA_PROG_B   ,        
               
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

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_addr;
	reg axi_awready;
	reg axi_wready;
	reg [1 : 0] axi_bresp;
	reg axi_bvalid;
	reg axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] axi_rdata;
	reg [1 : 0] axi_rresp;
	reg axi_rvalid;
    reg data_prepare;    
    reg data_prepare_r;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------

	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	wire [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       


	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

    // Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

    // Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
    assign slv_reg_rden = data_prepare_r & ~axi_rvalid;
    
	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 

	
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_addr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_addr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	          if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	                axi_addr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	
	
	always @( posedge S_AXI_ACLK )begin
      if ( S_AXI_ARESETN == 1'b0 ) begin
        data_prepare <= 0;
        data_prepare_r <= 0;
      end
      else  begin 
	    data_prepare <= axi_arready && S_AXI_ARVALID;
	    data_prepare_r <= data_prepare;
	  end
	end
	
    always @( posedge S_AXI_ACLK )
    begin
        if ( S_AXI_ARESETN == 1'b0 )
        begin
            axi_rresp  <= 0;
            axi_rvalid <= 0;
        end 
        else
        begin    
            if (data_prepare_r && ~axi_rvalid)
            begin
                // Valid read data is available at the read data bus
                axi_rresp  <= 2'b0; // 'OKAY' response
                axi_rvalid <= 1'b1;
            end   
            else if (axi_rvalid && S_AXI_RREADY)
            begin
                // Read data is accepted by the master
                axi_rvalid <= 1'b0;
            end                
        end
    end    
                   

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	    if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	    else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	            axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

     
        
	// Add user logic here
    AXI4_REG # ( 
            .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
            .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
        ) AXI4_REG_inst (
            .S_CLK         (S_AXI_ACLK   ),
            .S_RST         (!S_AXI_ARESETN),
            .S_WREN        (slv_reg_wren ),
            .S_ADDR        (axi_addr     ),
            .S_WD          (S_AXI_WDATA  ),
            .S_RDEN        (slv_reg_rden ),
            .S_RD          (reg_data_out ),     
            .IRQ           (IRQ          ),
            .PL_SWITCH     (PL_SWITCH    ),
            .PL_LED        (PL_LED       ),
            .PL_UNUSED     (PL_UNUSED    ),
            .EMERMEA       (EMERMEA      ),
            .TRIGGER       (TRIGGER      ),
            .USM_PWR_SW    (USM_PWR_SW   ),
            .clk_scl_in    (clk_scl_in   ),
            .clk_sda_in    (clk_sda_in   ),
            .clk_scl_out   (clk_scl_out  ),
            .clk_sda_out   (clk_sda_out  ),
            .rtc_scl_in    (rtc_scl_in   ),
            .rtc_sda_in    (rtc_sda_in   ),
            .rtc_scl_out   (rtc_scl_out  ),
            .rtc_sda_out   (rtc_sda_out  ),
            .pha_scl_in    (pha_scl_in   ),
            .pha_sda_in    (pha_sda_in   ),
            .pha_scl_out   (pha_scl_out  ),
            .pha_sda_out   (pha_sda_out  ),
            .ctrl_scl_in   (ctrl_scl_in  ),
            .ctrl_sda_in   (ctrl_sda_in  ),
            .ctrl_scl_out  (ctrl_scl_out ),
            .ctrl_sda_out  (ctrl_sda_out ),
            .pwr_scl_in    (pwr_scl_in   ),
            .pwr_sda_in    (pwr_sda_in   ),
            .pwr_scl_out   (pwr_scl_out  ),
            .pwr_sda_out   (pwr_sda_out  ),
            .XDCR_PRESENT  (XDCR_PRESENT ),
            .XDCR_SCL      (XDCR_SCL     ),
            .XDCR_SDA      (XDCR_SDA     ),                              
            .PRESENT       (PRESENT      ),
            .CTRL_IRQ      (CTRL_IRQ     ),
            .CTRL_PROG_B   (CTRL_PROG_B  ),
            .PHA_IRQ       (PHA_IRQ      ),
            .PHA_PROG_B    (PHA_PROG_B   ),
            .PWR_AC_OK     (PWR_AC_OK    ),
            .PWR_DC_OK     (PWR_DC_OK    ),
            .PWR_FAULT     (PWR_FAULT    ),
            .PWR_INHIBIT   (PWR_INHIBIT  ),
            .USM_POWERCTRL (USM_POWERCTRL),
            .USM_DRIVE_A_N (USM_DRIVE_A_N),
            .USM_DRIVE_A_P (USM_DRIVE_A_P),
            .USM_DRIVE_B_N (USM_DRIVE_B_N),
            .USM_DRIVE_B_P (USM_DRIVE_B_P),
            .USM_OUT_A     (USM_OUT_A    ),
            .USM_OUT_B     (USM_OUT_B    ),
            .USM_OUT_Z     (USM_OUT_Z    ),
            .USM_ALARM_A   (USM_ALARM_A  ),
            .USM_ALARM_B   (USM_ALARM_B  ),
            .USM_ALARM_Z   (USM_ALARM_Z  ),
            .USM_ALARM_D   (USM_ALARM_D  ),
            .USM_LIMIT     (USM_LIMIT    ) 
            );     
             
	// User logic ends

	endmodule

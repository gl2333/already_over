`include "hardwarefpgadefine.vh"
`include "controlfpgaregdef.vh"

`define SVN_VERSION 32'd20 
`define SVN_COMPILE_DATE 32'h20190425

module CTRL_FPGA(  
    input      CLK_IN         ,
    output reg IRQ            , 
    
    output [1:0]  LED         , // left 0, right 1 
    inout  [63:0] SCL         ,
    inout  [63:0] SDA         ,    
    inout         SCL_SLAVE   ,
    inout         SDA_SLAVE   , 
    inout         SCL_FAN_IN  , 
    inout         SCL_FAN_OUT , 
    inout         SDA_FAN_IN  ,
    inout         SDA_FAN_OUT , 
    output        PWM         ,
    output        LED_COM     ,
    output        LED_PWR_OUT ,
    input         PRESENT     ,
    
    //unused in CTRL_FPGA
    input  [7:0]  SWITCH      , // up 0, down 1, left 7, right 0
    output [3:0]  EXT_IO      , // unconected IO
    output        SPI_CLK     , // todo add card information
    output        SPI_SI      ,
    output        SPI_SS      ,
    input         SPI_SO      ,
    input         SCL_PROB    ,
    input         SDA_PROB    ,
    input         TRIGGER_IN 
 );
    localparam SYS_FREQ = 25_000_000;
 
    assign EXT_IO[3:0] = 0   ;
    assign LED_COM     = 0   ;
    assign LED_PWR_OUT = 0   ;
    assign SPI_CLK     = 0   ;
    assign SPI_SS      = 0   ;
    assign SPI_SI      = 1'bz;
    
    wire clk = CLK_IN; 
 
    /////////////////////////////////////////////////////////////////////
    localparam RSTN_SHIFT_WID=32;
    reg [31:0] rstn_shift = {RSTN_SHIFT_WID{1'b0}};
    wire rst;
    always@(posedge clk) rstn_shift <= {rstn_shift[RSTN_SHIFT_WID-2:0],1'b1};
    assign rst = !rstn_shift[RSTN_SHIFT_WID-1];//release reset after power up 
    
    wire sclSlaveIn;
    wire sdaSlaveIn;
    wire sdaSlaveOut;
    IOBUF iobuf_sclSlave(
        .O(sclSlaveIn ),.I(1'b0),.IO(SCL_SLAVE),.T(1'b1));
    IOBUF iobuf_sdaSlave(
        .O(sdaSlaveIn ),.I(1'b0),.IO(SDA_SLAVE),.T(sdaSlaveOut));
        
    
    //___________________________________________________chip active led___
    reg [31:0]chip_active_cnt ;
    wire chip_active_pulse  = (chip_active_cnt == SYS_FREQ);    
    wire chip_active_valid = (chip_active_cnt < SYS_FREQ/2);
    always@(posedge clk)
        if(rst || chip_active_pulse)  
             chip_active_cnt <= 0;
        else chip_active_cnt <= chip_active_cnt + 1;

    assign LED[0]= chip_active_valid; //led blink 1 HZ
    
    //___________________________________________________i2c active led____
    reg [31:0]i2c_active_cnt;
    wire i2c_active_pulse = (!sdaSlaveIn || !sclSlaveIn);
    wire i2c_active_valid = (i2c_active_cnt < SYS_FREQ/2);
    always@(posedge clk)begin
        if(rst || i2c_active_pulse)i2c_active_cnt <= 0;
        else if(i2c_active_valid) i2c_active_cnt <= i2c_active_cnt + 1;
    end
    
    assign LED[1] = i2c_active_valid;//half seconds ligth on
    
    //____________________________________________________present debounce_
    //wire present_sync;
    //sync          #(.LEVEL(3),.RST_V(1)) 
    //    u_sync_pres(.clk(clk),.rst(rst),.i(PRESENT),.o(present_sync));

    //wire present_deb;
    //deb_ns     #(.RST_V(1'b1),.FREQ(SYS_FREQ),.T_NS(100)) 
    //    u_deb_ns(.clk(clk),.rst(rst),.in(present_sync),.out( present_deb));
    
    wire present_sync;
    sync          #(.LEVEL(3),.RST_V(1)) 
        u_sync_pres(.clk(clk),.rst(rst),.i(PRESENT),.o(present_deb));    
        
    
    //____________________________________________________I2C slave________
    wire [15:0] addr;
    wire wrEn;
    wire rdEn;
    wire [7:0]wrDa;
    reg [7:0]rdDa;
    
    i2cSlave #(
    .I2C_ADDRESS(`CTRL_FPGA_I2C_SLV_ADDR_7BIT),
    .I2C_ADDR_BYTE_WIDTH(`I2C_SLV_ADDR_BYTE_WID)
    )
    i2cSlaveInst(
        .clk        (clk        ),
        .rst        (rst        ),
        .scl        (sclSlaveIn ),
        .sdaIn      (sdaSlaveIn ), 
        .sdaOut     (sdaSlaveOut),        
        .addr       (addr       ), //8 bite address
        .readEn     (rdEn       ),
        .writeEn    (wrEn       ), 
        .writeData  (wrDa       ),
        .readData   (rdDa       )
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
    reg  [`IN_AIR_TL_BIT_WID -1:0]reg_in_air_tl  [`IN_AIR_NUM-1 :0];
    wire [`IN_AIR_TV_BIT_WID -1:0]reg_in_air_tv  [`IN_AIR_NUM-1 :0];
	wire [`IN_AIR_TV_BIT_WID -1:0]reg_in_air_tv1 [`IN_AIR_NUM-1 :0];
    reg  [`OUT_AIR_TL_BIT_WID-1:0]reg_out_air_tl [`OUT_AIR_NUM-1:0];
    wire [`OUT_AIR_TV_BIT_WID-1:0]reg_out_air_tv [`OUT_AIR_NUM-1:0];
	wire [`OUT_AIR_TV_BIT_WID-1:0]reg_out_air_tv1[`OUT_AIR_NUM-1:0];
    reg  [`AMP_RES_BIT_WID   -1:0]reg_amp_res; //amp resistor to write
    wire [`AMP_RV_BIT_WID    -1:0]reg_amp_rv ; //amp resistor read back
    
	wire [`AMP_VV_BIT_WID    -1:0]reg_amp_vv ; //amp voltage read back
	wire [`AMP_AV_BIT_WID    -1:0]reg_amp_av ; //amp current read back
	wire [`AMP_VV_BIT_WID    -1:0]reg_amp_vv1 ; //amp voltage read back
	wire [`AMP_AV_BIT_WID    -1:0]reg_amp_av1 ; //amp current read back
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
    assign reg_prob_pres = present_deb;
    
    genvar j ;
    
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
    else rdDa <= 8'h0; 
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
            reg_fan_rst  	<=1;
            reg_fan_mode 	<=0;//0 auto
            reg_fan_speed	<=0;
            IRQ          	<=0; 
            reg_amp_res  	<=0;//about 0.8V
            reg_amp_vl   	<={64{8'hFE}};
            reg_amp_al   	<={64{8'h80}};
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
            IRQ <= (|(reg_irq_sta_amp_i2c_err& reg_irq_mask_amp_i2c_err))||
                   (|(reg_irq_sta_amp_aol & reg_irq_mask_amp_aol )      )||
                   (|(reg_irq_sta_amp_vol & reg_irq_mask_amp_vol )      )||
                   (|(reg_irq_sta_out_tol & reg_irq_mask_out_tol )      )||
                   (|(reg_irq_sta_in_tol  & reg_irq_mask_in_tol )        )    ; 
        end
    end
    
    
    wire [`CHN-1:0] R_IC_ERR;
    wire [`CHN-1:0] E_IC_ERR;
	reg  [`CHN-1:0]	reg_aol_irq_valid;
	reg  [`CHN-1:0] reg_vol_irq_valid;
	
    generate
		for(j=0;j<`CHN;j=j+1)begin : chs_write			
            always @( posedge clk) begin
                if(rst) begin
                    reg_irq_mask_amp_vol[j]    <=0;
                    reg_irq_mask_amp_aol[j]    <=0;
                    reg_irq_mask_amp_i2c_err[j]<=0;
                    reg_irq_sta_amp_vol[j]     <=0;
                    reg_irq_sta_amp_aol[j]     <=0;
                    reg_irq_sta_amp_i2c_err[j] <=0;
                end
                else if(wrEn) begin 
                         if(reg_irq_mask_amp_vol_cs[j]    ) reg_irq_mask_amp_vol[j]    <= wrDa[0];
                    else if(reg_irq_mask_amp_aol_cs[j]    ) reg_irq_mask_amp_aol[j]    <= wrDa[0];
                    else if(reg_irq_mask_amp_i2c_err_cs[j]) reg_irq_mask_amp_i2c_err[j]<= wrDa[0];
                    else if(reg_irq_sta_amp_vol_cs[j]     ) reg_irq_sta_amp_vol[j]     <= 1;
                    else if(reg_irq_sta_amp_aol_cs[j]     ) reg_irq_sta_amp_aol[j]     <= 1;
                    else if(reg_irq_sta_amp_i2c_err_cs[j] ) reg_irq_sta_amp_i2c_err[j] <= 1; 
                end
                else if(rdEn)begin 
                         if( reg_irq_sta_amp_vol_cs[j]) reg_irq_sta_amp_vol[j]<=0;
                    else if( reg_irq_sta_amp_aol_cs[j]) reg_irq_sta_amp_aol[j]<=0;
                    else if( reg_irq_sta_amp_i2c_err_cs[j]) reg_irq_sta_amp_i2c_err[j]<=0; 
                end
                else begin
                    if(reg_aol_irq_valid[j]) reg_irq_sta_amp_aol[j] <= 1;
                    if(reg_vol_irq_valid[j]) reg_irq_sta_amp_vol[j] <= 1;
                    if(R_IC_ERR[j]||E_IC_ERR[j]) reg_irq_sta_amp_i2c_err[j]<=1; 
                end 
            end
	   end
    endgenerate
	   
			
    wire [`IN_AIR_NUM -1:0]   in_air_value_update;
    wire [`OUT_AIR_NUM-1:0]   out_air_value_update;
	reg  [`IN_AIR_NUM -1:0]   reg_in_air_tol_irq_valid;
	reg  [`OUT_AIR_NUM-1:0]   reg_out_air_tol_irq_valid;
    wire [`IN_AIR_NUM -1:0]   reg_in_air_tol_irq_valid_f;
	wire [`OUT_AIR_NUM-1:0]   reg_out_air_tol_irq_valid_f;
	
	
	generate
        for(j=0;j<`IN_AIR_NUM;j=j+1)begin :in_write
            always @( posedge clk) begin
                if(rst) begin
                    reg_in_air_tl[j]<=8'h78; 
                    reg_irq_mask_in_tol[j]<=0;
                    reg_irq_sta_in_tol[j]<=0;
                end
                else if(wrEn) begin 
                    if( reg_irq_mask_in_tol_cs[j])reg_irq_mask_in_tol[j]<= wrDa[`IRQ_MASK_IN_TOL_BIT_WID-1:0];
                    else if( reg_in_air_tl_cs[j]) reg_in_air_tl[j][(addr-`IN_AIR_TL_BYTE_ADDR-j*4)*8+:8]<= wrDa;
                    else if( reg_irq_sta_in_tol_cs[j]) reg_irq_sta_in_tol[j]<= 1;
                end
                else if(rdEn) begin
                    if( reg_irq_sta_in_tol_cs[j])reg_irq_sta_in_tol[j]<= 0;
                end
                else begin 
                    if(reg_in_air_tol_irq_valid[j]) reg_irq_sta_in_tol[j]<= 1;
                end
            end
		value_delay #(.LEVEL(3),.RST_V(0),.BIT_WID(8))sdip_reg_in_air_tv_delay (.clk(clk),.rst(rst),.value_update(in_air_value_update_r[j]), .i(reg_in_air_tv_r[j]),.o(),.reg_value_limit(reg_in_air_tl_r[j]), .irq_valid(reg_in_air_tol_irq_valid_f[j]));  
		
		always @( posedge clk) 
                if(rst) reg_in_air_tol_irq_valid[j] <=0;
				else    reg_in_air_tol_irq_valid[j] <= reg_in_air_tol_irq_valid_f[j];
		end
    endgenerate 
        
    generate
        for(j=0;j<`OUT_AIR_NUM;j=j+1)begin :out_write
            always @( posedge clk) begin
                if(rst) begin
                    reg_out_air_tl[j]<=8'h78; 
                    reg_irq_mask_out_tol[j]<=0;
                    reg_irq_sta_out_tol[j]<=0;
                end
                else if(wrEn) begin 
                    if( reg_irq_mask_out_tol_cs[j])reg_irq_mask_out_tol[j]<= wrDa[`IRQ_MASK_OUT_TOL_BIT_WID-1:0];
                    else if( reg_out_air_tl_cs[j]) reg_out_air_tl[j][(addr-`OUT_AIR_TL_BYTE_ADDR-j*4)*8+:8]<= wrDa;
                    else if( reg_irq_sta_out_tol_cs[j]) reg_irq_sta_out_tol[j]<= 1;
                end
                else if(rdEn) begin
                    if(reg_irq_sta_out_tol_cs[j])reg_irq_sta_out_tol[j]<= 0;
                end
                else begin
                    if(reg_out_air_tol_irq_valid[j]) reg_irq_sta_out_tol[j]<= 1;
                end
            end
		value_delay #(.LEVEL(3),.RST_V(0),.BIT_WID(8))sdip_reg_out_air_tv_delay(.clk(clk),.rst(rst),.value_update(out_air_value_update_r[j]),.i(reg_out_air_tv_r[j]),.o(),.reg_value_limit(reg_out_air_tl_r[j]),.irq_valid(reg_out_air_tol_irq_valid_f[j]));	
        
		always @( posedge clk) 
                if(rst) reg_out_air_tol_irq_valid[j] <=0;
				else    reg_out_air_tol_irq_valid[j] <= reg_out_air_tol_irq_valid_f[j];
		end
    endgenerate
    	
    reg [`CHN*8-1:0] reg_amp_res_r;
	reg [`CHN-1:0]   reg_amp_res_wr_r;

    always @( posedge clk)
        if(rst)
                   reg_amp_res_r <= 0;
        else 
		   reg_amp_res_r <= reg_amp_res;
    generate
    for(j=0;j<`CHN;j=j+1)begin :reg_amp_wr_process
        always @( posedge clk) 
		if(rst) reg_amp_res_wr_r[j] <= 0;
		else  reg_amp_res_wr_r[j] <= wrEn&&(addr==(`AMP_RES_BYTE_ADDR+j));
	end
	endgenerate
    
 
    //AMP CTRL
    wire [`CHN-1:0] amp_scl_in ;
    wire [`CHN-1:0] amp_scl_out;
    wire [`CHN-1:0] amp_sda_in ; 
    wire [`CHN-1:0] amp_sda_out;
    wire [`CHN-1:0] amp_scl_in_sync ;
    wire [`CHN-1:0] amp_sda_in_sync ; 
	wire [`CHN-1:0] i_update;      //pulse
    wire [`CHN-1:0] v_update;	   //pulse
	
	reg [7:0]reg_amp_vv_r[63:0];
	reg [7:0]reg_amp_vl_r[63:0];
	reg [7:0]reg_amp_av_r[63:0];
	reg [7:0]reg_amp_al_r[63:0];
	reg [`CHN-1:0] v_update_r;
	reg [`CHN-1:0] i_update_r;
	wire [`CHN-1:0] reg_vol_irq_valid_f;
	wire [`CHN-1:0] reg_aol_irq_valid_f;
    /**/
    generate 
        for (j=0; j<`CHN; j=j+1) begin :amp_ctrl_inst
        
            IOBUF amp_scl(.O(amp_scl_in[j] ),.I(1'b0),.IO(SCL[j]),.T(amp_scl_out[j]));
            IOBUF amp_sda(.O(amp_sda_in[j] ),.I(1'b0),.IO(SDA[j]),.T(amp_sda_out[j]));

            sync     #(.LEVEL(3),.RST_V(1)) 
            u_sync_amp_scl(.clk(clk),.rst(rst),.i(amp_scl_in[j]),.o(amp_scl_in_sync[j]));
            sync     #(.LEVEL(3),.RST_V(1)) 
            u_sync_amp_sda(.clk(clk),.rst(rst),.i(amp_sda_in[j]),.o(amp_sda_in_sync[j]));
						            
            amp_ctrl #(
                .SYS_FREQ(SYS_FREQ),
                .I2C_FREQ(10_000  )
            )
            u_amp_ctrl(
                .clk     (clk                    ),
                .rst     (rst                    ),
                .r_err   (R_IC_ERR[j]            ),
                .vi_err  (E_IC_ERR[j]            ),
                .v       (reg_amp_vv[j*8+:8]     ),
                .i       (reg_amp_av[j*8+:8]     ),
				.v_update(v_update[j]			 ), //pulse
				.i_update(i_update[j]			 ), //pulse
                .r_rd    (reg_amp_rv[j*8+:8]     ),
                .r_wr    (reg_amp_res_r[j*8+:8]  ),                                
                .r_wren  (reg_amp_res_wr_r[j]    ),
                .scl_in  (amp_scl_in_sync [j]    ),
                .scl_out (amp_scl_out[j]         ),
                .sda_in  (amp_sda_in_sync [j]    ),
                .sda_out (amp_sda_out[j]         )
            );  
		always @( posedge clk)begin
			if(rst)begin  
							reg_amp_vv_r[j] <= 0;
							reg_amp_vl_r[j] <= 0;
							reg_amp_av_r[j] <= 0;
							reg_amp_al_r[j] <= 0;
							v_update_r[j]   <= 0;
							i_update_r[j]   <= 0;
					 reg_vol_irq_valid[j]   <= 0;
					 reg_aol_irq_valid[j]   <= 0;
			end
			else begin
							reg_amp_vv_r[j] <= reg_amp_vv[j*8+:8];
							reg_amp_vl_r[j] <= reg_amp_vl[j*8+:8];
							reg_amp_av_r[j] <= reg_amp_av[j*8+:8];
							reg_amp_al_r[j] <= reg_amp_al[j*8+:8];
							v_update_r[j]   <= v_update[j];
							i_update_r[j]   <= i_update[j];
				     reg_vol_irq_valid[j]   <= reg_vol_irq_valid_f[j];
				     reg_aol_irq_valid[j]   <= reg_aol_irq_valid_f[j];
			end
		end
				
		value_delay #(.LEVEL(4),.RST_V(0),.BIT_WID(8))sdip_reg_amp_vv_delay(.clk(clk),.rst(rst),.value_update(v_update_r[j]),.i(reg_amp_vv_r[j]),.o(),.reg_value_limit(reg_amp_vl_r[j]),.irq_valid(reg_vol_irq_valid_f[j]));	
current_value_delay #(.LEVEL(4),.RST_V(0),.BIT_WID(8))sdip_reg_amp_av_delay(.clk(clk),.rst(rst),.value_update(i_update_r[j]),.i(reg_amp_av_r[j]),.o(),.reg_value_limit(reg_amp_al_r[j]),.irq_valid(reg_aol_irq_valid_f[j]));	
        end
    endgenerate
    
    wire inlet_scl_in       ;
    wire inlet_scl_out      ;
    wire inlet_sda_in       ;
    wire inlet_sda_out      ;
    wire outlet_scl_in      ;
    wire outlet_scl_out     ;
    wire outlet_sda_in      ;
    wire outlet_sda_out     ;
    wire inlet_scl_in_sync  ;
    wire inlet_sda_in_sync  ;
    wire outlet_scl_in_sync ;
    wire outlet_sda_in_sync ;
	
	
	reg [7:0]reg_in_air_tv_r[1:0];
	reg [7:0]reg_out_air_tv_r[3:0];
	reg [7:0] reg_in_air_tl_r[1:0];
	reg [7:0] reg_out_air_tl_r[3:0];
	reg in_air_value_update_r[1:0];
	reg out_air_value_update_r[3:0];
	
	generate
	 for (j=0; j<2; j=j+1)
			always@( posedge clk)begin
			if(rst)begin  
							reg_in_air_tv_r[j] <= 0;
					  in_air_value_update_r[j] <= 0;
					        reg_in_air_tl_r[j] <=0;
 			end
			else begin
								reg_in_air_tv_r[j] <=		 reg_in_air_tv[j];
						  in_air_value_update_r[j] <=  in_air_value_update[j];
						  reg_in_air_tl_r[j]       <=   reg_in_air_tl[j];
			end
		end
	endgenerate
	
	generate
	 for (j=0; j<4; j=j+1) 
			always @( posedge clk)begin
			if(rst)begin  
							reg_out_air_tv_r[j] <= 0;
					  out_air_value_update_r[j] <= 0;
					  reg_out_air_tl_r[j]       <= 0;
			end
			else begin
								reg_out_air_tv_r[j] <=		  reg_out_air_tv[j];
						 out_air_value_update_r[j]  <=  out_air_value_update[j];
						 reg_out_air_tl_r[j]        <=  reg_out_air_tl[j];
			end
		end
	endgenerate
	
	

    /**/
    IOBUF inlet_scl (.O(inlet_scl_in ),.I(1'b0),.IO(SCL_FAN_IN ),.T(inlet_scl_out ));
    IOBUF inlet_sda (.O(inlet_sda_in ),.I(1'b0),.IO(SDA_FAN_IN ),.T(inlet_sda_out ));
    
    IOBUF outlet_scl(.O(outlet_scl_in),.I(1'b0),.IO(SCL_FAN_OUT),.T(outlet_scl_out));
    IOBUF outlet_sda(.O(outlet_sda_in),.I(1'b0),.IO(SDA_FAN_OUT),.T(outlet_sda_out));

    sync            #(.LEVEL(3),.RST_V(1))         
    u_sync_inlet_scl (.clk(clk),.rst(rst),.i(inlet_scl_in ),.o(inlet_scl_in_sync ));
    sync            #(.LEVEL(3),.RST_V(1))         
    u_sync_inlet_sda (.clk(clk),.rst(rst),.i(inlet_sda_in ),.o(inlet_sda_in_sync ));
    sync            #(.LEVEL(3),.RST_V(1))         
    u_sync_outlet_scl(.clk(clk),.rst(rst),.i(outlet_scl_in),.o(outlet_scl_in_sync));
    sync            #(.LEVEL(3),.RST_V(1))         
    u_sync_outlet_sda(.clk(clk),.rst(rst),.i(outlet_sda_in),.o(outlet_sda_in_sync));
        
    
    fan_temp  #(
        .SYS_FREQ(SYS_FREQ),
        .I2C_FREQ(100_000 )
    )
    u_fan_temp(
        .clk           		(clk               ),
        .rst           		(rst               ),
        .manual        		(reg_fan_mode      ),
        .manual_speed  		(reg_fan_speed[2:0]),
        .in_value      		({reg_in_air_tv[1],reg_in_air_tv[0]}),
        .in_value_update    (in_air_value_update      ),
        .out_value     		({reg_out_air_tv[3],reg_out_air_tv[2],reg_out_air_tv[1],reg_out_air_tv[0]}),
        .out_value_update   (out_air_value_update     ),
        .inlet_scl_in  		(inlet_scl_in_sync  ),
        .inlet_scl_out 		(inlet_scl_out      ),
        .inlet_sda_in  		(inlet_sda_in_sync  ),
        .inlet_sda_out 		(inlet_sda_out      ),
        .outlet_scl_in 		(outlet_scl_in_sync ),
        .outlet_scl_out		(outlet_scl_out     ),
        .outlet_sda_in 		(outlet_sda_in_sync ),
        .outlet_sda_out		(outlet_sda_out     ),
        .pwm           		(PWM                )
    ); 
    
    
    dna #(
        .DNA_PORT_START_CNT (10 ),
        .DNA_PORT_BYTE_WIDTH (`CF_GEN_DNA_BIT_WID))
    u_dna_master(
        .clk(clk),
        .rst(rst),
        .dna_out(reg_cf_gen_dna),
        .dna_valid()
    ); 
endmodule

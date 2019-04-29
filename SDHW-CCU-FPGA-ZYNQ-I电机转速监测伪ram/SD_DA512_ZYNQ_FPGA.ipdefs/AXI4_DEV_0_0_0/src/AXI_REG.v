`include "timescale.vh"
`include "zynqfpgaregdef.vh"
`include "hardwarefpgadefine.vh"   
`define SVN_VERSION 32'd17
`define FIRMWARE_COMPILE_DATE 32'h20190423
//1电机转速记录和移动异常的中断监控
//2i2cm添加nack约束
//3timeout和s_wait时间修改
//////////////////////////////////////////////////////////////////////////////////
// Company: Shende 2017
// Engineer: 
// 
// Create Date: 2017/01/23 20:29:43 
// Design Name: 
// Module Name: AXI_REG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module AXI4_REG #(
    parameter integer C_S_AXI_DATA_WIDTH       = 32, //32 bit width
    parameter integer C_S_AXI_ADDR_WIDTH       = 13  //8K deepth 
)
(
    input wire  S_CLK                                ,
    input wire  S_RST                               ,
    // AXI4LITE signals                        
    input  wire [C_S_AXI_DATA_WIDTH-1 : 0]     S_WD  ,     
    input  wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_ADDR,
    output reg  [C_S_AXI_DATA_WIDTH-1 : 0]     S_RD  ,
    input  wire                                S_WREN,
    input  wire                                S_RDEN,
    // User define signals  
    // User define signals  
    output reg   IRQ               ,                                                    
    input  [4:0] PL_SWITCH         , //0 left, 1 right; up 0, down 1;
    output [3:0] PL_LED            , //0 left, 1 light on, 0 light off;
    input  [3:0] PL_UNUSED         ,   
    input  [1:0] EMERMEA           , //0 left, 1 right on pcb 
    output       TRIGGER           ,             
    output       USM_PWR_SW        , 
    input        clk_scl_in        ,
    input        clk_sda_in        ,
    output       clk_scl_out       ,
    output       clk_sda_out       ,
    input        rtc_scl_in        ,
    input        rtc_sda_in        ,        
    output       rtc_scl_out       ,
    output       rtc_sda_out       ,  
    input        XDCR_PRESENT      ,        
    input        XDCR_SCL          ,
    input        XDCR_SDA          ,      
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
    input  [`USM-1:0] USM_LIMIT    
); 

//8 bit to 32 bit address
localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
wire [C_S_AXI_ADDR_WIDTH-ADDR_LSB-1:0] addr = S_ADDR[C_S_AXI_ADDR_WIDTH-1:ADDR_LSB];

integer i;
genvar j;
genvar k;
                                           
//wire p1us_loop  ;
//wire p1ms_loop  ;
//wire p10ms_loop ;
//wire p100ms_loop;
//wire p1s_once   ;

//timer_pulse
//#(
//    .CLK_FREQ(`FPGA_SYS_CLK_FREQ)
//)
//tp_inst
//(
//    .clk        (S_CLK      ),
//    .rstn       (S_RSTN     ),
//    .p1us_loop  (p1us_loop  ),
//    .p1ms_loop  (p1ms_loop  ),
//    .p10ms_loop (p10ms_loop ),
//    .p100ms_loop(p100ms_loop),
//    .p1s_once   (p1s_once   )
//);

wire [     4:0] pl_switch_deb   ;
wire [     3:0] pl_unused_deb   ;
wire [     1:0] emermea_deb     ;
wire [`CHS-1:0] present_deb     ;
wire [`CHS-1:0] ctrl_irq_deb    ;
wire [`CHS-1:0] pha_irq_deb     ;
wire [`USM-1:0] usm_out_a_deb   ;
wire [`USM-1:0] usm_out_b_deb   ;
wire [`USM-1:0] usm_alarm_a_deb ;
wire [`USM-1:0] usm_alarm_b_deb ;
wire [`USM-1:0] usm_limit_deb   ;
wire [`PWR-1:0] pwr_ac_ok_deb   ;
wire [`PWR-1:0] pwr_dc_ok_deb   ;
wire [`PWR-1:0] pwr_fault_deb   ;                                   
wire [`PWR-1:0] ac_aol_deb      ;
wire [`PWR-1:0] ac_aol          ;
wire [`PWR-1:0] ac_pwr_cur_valid;
  
input_debounce
#(
    .CHS(`CHS),
    .USM(`USM),
    .PWR(`PWR)
)
indeb_inst
(
    .clk            (S_CLK          ), 
    .rst            (S_RST          ),
    .PL_SWITCH      (PL_SWITCH      ),
    .PL_UNUSED      (PL_UNUSED      ),
    .EMERMEA        (EMERMEA        ),
    .PRESENT        (PRESENT        ),
    .CTRL_IRQ       (CTRL_IRQ       ),
    .PHA_IRQ        (PHA_IRQ        ),
    .USM_OUT_A      (USM_OUT_A      ),
    .USM_OUT_B      (USM_OUT_B      ),
    .USM_OUT_Z      (USM_OUT_Z      ),
    .USM_ALARM_A    (USM_ALARM_A    ),
    .USM_ALARM_B    (USM_ALARM_B    ),
    .USM_ALARM_Z    (USM_ALARM_Z    ),
    .USM_ALARM_D    (USM_ALARM_D    ),
    .USM_LIMIT      (USM_LIMIT      ),
    .PWR_AC_OK      (PWR_AC_OK      ),
    .PWR_DC_OK      (PWR_DC_OK      ),
    .PWR_FAULT      (PWR_FAULT      ),
    .ac_aol         (ac_aol         ),
    .pl_switch_deb  (pl_switch_deb  ),
    .pl_unused_deb  (pl_unused_deb  ),
    .emermea_deb    (emermea_deb    ),
    .present_deb    (present_deb    ),
    .ctrl_irq_deb   (ctrl_irq_deb   ),
    .pha_irq_deb    (pha_irq_deb    ),
    .usm_out_a_deb  (usm_out_a_deb  ),
    .usm_out_b_deb  (usm_out_b_deb  ),
    .usm_alarm_a_deb(usm_alarm_a_deb),
    .usm_alarm_b_deb(usm_alarm_b_deb),
    .usm_limit_hold (usm_limit_deb  ),
    .pwr_ac_ok_deb  (pwr_ac_ok_deb  ),
    .pwr_dc_ok_deb  (pwr_dc_ok_deb  ),
    .pwr_fault_deb  (pwr_fault_deb  ),                                       
    .ac_aol_deb     (ac_aol_deb     )
);
               
wire [   `ZYNQ_GEN_ID_BIT_WID-1:0] reg_zynq_gen_id   ;
wire [   `ZYNQ_GEN_SN_BIT_WID-1:0] reg_zynq_gen_sn   ;
wire [   `ZYNQ_GEN_FM_BIT_WID-1:0] reg_zynq_gen_fm   ;
wire [  `ZYNQ_GEN_DNA_BIT_WID-1:0] reg_zynq_gen_dna  ;
wire [`CLK_I2C_RD_BUF_BIT_WID-1:0] reg_clk_i2c_rd_buf;
wire [`RTC_I2C_RD_BUF_BIT_WID-1:0] reg_rtc_i2c_rd_buf;
reg  [   `ZYNQ_GEN_PW_BIT_WID-1:0] reg_zynq_gen_pw   ;
reg  [  `PHS_OUT_TRIG_BIT_WID-1:0] reg_phs_out_trig  ;
reg  [  `PHS_OUT_TIME_BIT_WID-1:0] reg_phs_out_time  ;
reg  [`CLK_I2C_WR_BUF_BIT_WID-1:0] reg_clk_i2c_wr_buf;
reg  [`RTC_I2C_WR_BUF_BIT_WID-1:0] reg_rtc_i2c_wr_buf;
reg  [  `ZYNQ_GEN_SCR_BIT_WID-1:0] reg_zynq_gen_scr  ;
reg  [`CLK_I2C_WR_LEN_BIT_WID-1:0] reg_clk_i2c_wr_len;
reg  [`CLK_I2C_RD_LEN_BIT_WID-1:0] reg_clk_i2c_rd_len;
reg  [`RTC_I2C_WR_LEN_BIT_WID-1:0] reg_rtc_i2c_wr_len;
reg  [`RTC_I2C_RD_LEN_BIT_WID-1:0] reg_rtc_i2c_rd_len;

wire reg_zynq_gen_vf         ;
wire reg_prob_pres           ;
wire reg_clk_i2c_mutex       ;
wire reg_clk_i2c_busy        ;
wire reg_rtc_i2c_mutex       ;
wire reg_rtc_i2c_busy        ;
reg  reg_zynq_gen_rst        ;
reg  reg_doc_ems_sta         ;
reg  reg_pat_ems_sta         ;
reg  reg_clk_i2c_rst         ;
reg  reg_clk_i2c_start       ;
reg  reg_clk_i2c_line_err    ;
reg  reg_clk_i2c_nack_err    ;
reg  reg_rtc_i2c_rst         ;
reg  reg_rtc_i2c_start       ;
reg  reg_rtc_i2c_line_err    ;
reg  reg_rtc_i2c_nack_err    ;
reg  reg_usm_pwr_sw          ;
reg  reg_irq_sta_ems_doc_rls ;
reg  reg_irq_sta_ems_doc_prs ;
reg  reg_irq_sta_ems_pat_rls ;
reg  reg_irq_sta_ems_pat_prs ;
reg  reg_irq_sta_heat_done   ;
reg  reg_irq_mask_ems_doc_rls;
reg  reg_irq_mask_ems_doc_prs;
reg  reg_irq_mask_ems_pat_rls;
reg  reg_irq_mask_ems_pat_prs; 
reg  reg_irq_mask_heat_done  ;                    
              
reg  [   `PWR-1:0]               reg_ac_pwr_rst;
wire [   `PWR-1:0]            reg_ac_pwr_sta_ac;
wire [   `PWR-1:0]            reg_ac_pwr_sta_dc;
wire [   `PWR-1:0]            reg_ac_pwr_sta_ft;
reg  [   `PWR-1:0]                reg_ac_pwr_sw;
reg  [   `PWR-1:0]        reg_irq_sta_ac_ac_err; 
reg  [   `PWR-1:0]        reg_irq_sta_ac_dc_err;
reg  [   `PWR-1:0]         reg_irq_sta_ac_fault;
reg  [   `PWR-1:0]           reg_irq_sta_ac_aol;
reg  [   `PWR-1:0]       reg_irq_mask_ac_ac_err;
reg  [   `PWR-1:0]       reg_irq_mask_ac_dc_err;
reg  [   `PWR-1:0]        reg_irq_mask_ac_fault;
reg  [   `PWR-1:0]          reg_irq_mask_ac_aol;
wire [`PWR*32-1:0]                reg_ac_pwr_av;
reg  [`PWR*32-1:0]                reg_ac_pwr_al;
reg  [   `USM-1:0]                  reg_usm_rst;
reg  [   `USM-1:0]                  reg_usm_run;
reg  [   `USM-1:0]            reg_usm_limit_sta;
reg  [   `USM-1:0]          reg_usm_limit_watch;
reg  [   `USM-1:0]         reg_irq_sta_usm_done;
reg  [   `USM-1:0]        reg_irq_sta_usm_limit;
reg  [   `USM-1:0]     reg_irq_sta_usm_time_out;
reg	 [   `USM-1:0] reg_irq_sta_usm_sample_small;
reg  [   `USM-1:0]        reg_irq_mask_usm_done;
reg  [   `USM-1:0]       reg_irq_mask_usm_limit;
reg  [   `USM-1:0]    reg_irq_mask_usm_time_out;
reg  [   `USM-1:0]reg_irq_mask_usm_sample_small;
reg  [   `USM-1:0]           reg_usm_cfg_dir;
reg  [`USM*32-1:0]          reg_usm_cfg_freq;
reg  [`USM*32-1:0]         reg_usm_cfg_pulse;
wire [`USM*32-1:0]        reg_usm_move_pulse;
reg  [`USM*32-1:0]       reg_usm_sample_intv; 
wire [`USM*16-1:0]reg_usm_sample_depth_count;
reg  [`USM*16-1:0] reg_usm_sample_index_addr;    
reg  [	 `USM-1:0]       reg_usm_sample_read;      
wire [`USM*32-1:0]       reg_usm_sample_data;			
wire [	 `USM-1:0]       reg_usm_sample_vald; 
reg  [	 `USM-1:0]   reg_usm_sample_limit_en; 
reg  [`USM*32-1:0]  reg_usm_sample_limit_val;
wire [   `CHS-1:0]           reg_amp_cf_done;
wire [   `CHS-1:0]           reg_amp_pf_done;
wire [   `CHS-1:0]              reg_amp_pres;
reg  [   `CHS-1:0]            reg_amp_cf_rst;
reg  [   `CHS-1:0]            reg_amp_pf_rst;
wire [   `CHS-1:0]          reg_pf_i2c_mutex;
wire [   `CHS-1:0]          reg_cf_i2c_mutex;
reg  [   `CHS-1:0]            reg_pf_i2c_rst;
reg  [   `CHS-1:0]            reg_cf_i2c_rst;
reg  [   `CHS-1:0]          reg_pf_i2c_start;
wire [   `CHS-1:0]           reg_pf_i2c_busy;
reg  [   `CHS-1:0]       reg_pf_i2c_line_err;
reg  [   `CHS-1:0]       reg_pf_i2c_nack_err;
reg  [   `CHS-1:0]          reg_cf_i2c_start;
wire [   `CHS-1:0]           reg_cf_i2c_busy;
reg  [   `CHS-1:0]       reg_cf_i2c_line_err;
reg  [   `CHS-1:0]       reg_cf_i2c_nack_err;
reg  [   `CHS-1:0]  reg_irq_sta_chs_phs_fpga;
reg  [   `CHS-1:0] reg_irq_sta_chs_ctrl_fpga;
reg  [   `CHS-1:0] reg_irq_mask_chs_phs_fpga;
reg  [   `CHS-1:0]reg_irq_mask_chs_ctrl_fpga;
reg  [`CHS*32-1:0]         reg_pf_i2c_wr_len;
reg  [`CHS*32-1:0]         reg_pf_i2c_rd_len;
reg  [`CHS*32-1:0]         reg_cf_i2c_wr_len;
reg  [`CHS*32-1:0]         reg_cf_i2c_rd_len;
reg  [`PF_I2C_WR_BUF_SIZE*`CHS*32-1:0] reg_pf_i2c_wr_buf;
wire [`PF_I2C_RD_BUF_SIZE*`CHS*32-1:0] reg_pf_i2c_rd_buf;
reg  [`CF_I2C_WR_BUF_SIZE*`CHS*32-1:0] reg_cf_i2c_wr_buf;
wire [`CF_I2C_RD_BUF_SIZE*`CHS*32-1:0] reg_cf_i2c_rd_buf;

wire          reg_zynq_gen_id_cs; 
wire          reg_zynq_gen_sn_cs;
wire          reg_zynq_gen_fm_cs;
wire         reg_zynq_gen_dna_cs;
wire          reg_zynq_gen_pw_cs;
wire       reg_clk_i2c_wr_buf_cs;
wire       reg_clk_i2c_rd_buf_cs;
wire       reg_rtc_i2c_wr_buf_cs;
wire       reg_rtc_i2c_rd_buf_cs;  
wire         reg_zynq_gen_scr_cs;
wire       reg_clk_i2c_wr_len_cs; 
wire       reg_clk_i2c_rd_len_cs;
wire       reg_rtc_i2c_wr_len_cs;
wire       reg_rtc_i2c_rd_len_cs;
wire          reg_zynq_gen_vf_cs;
wire         reg_zynq_gen_rst_cs;
wire          reg_doc_ems_sta_cs;
wire          reg_pat_ems_sta_cs;
wire            reg_prob_pres_cs;
wire        reg_clk_i2c_mutex_cs;
wire          reg_clk_i2c_rst_cs;
wire        reg_clk_i2c_start_cs;
wire         reg_clk_i2c_busy_cs;
wire           reg_usm_pwr_sw_cs;
wire     reg_clk_i2c_line_err_cs;
wire     reg_clk_i2c_nack_err_cs;
wire        reg_rtc_i2c_mutex_cs;
wire          reg_rtc_i2c_rst_cs;
wire        reg_rtc_i2c_start_cs;
wire         reg_rtc_i2c_busy_cs;
wire     reg_rtc_i2c_line_err_cs;
wire     reg_rtc_i2c_nack_err_cs;
wire  reg_irq_sta_ems_doc_rls_cs;
wire  reg_irq_sta_ems_doc_prs_cs;
wire  reg_irq_sta_ems_pat_rls_cs;
wire  reg_irq_sta_ems_pat_prs_cs;
wire    reg_irq_sta_heat_done_cs;
wire reg_irq_mask_ems_doc_rls_cs;
wire reg_irq_mask_ems_doc_prs_cs;
wire reg_irq_mask_ems_pat_rls_cs;
wire reg_irq_mask_ems_pat_prs_cs;
wire   reg_irq_mask_heat_done_cs;  
wire         reg_phs_out_trig_cs;
wire         reg_phs_out_time_cs;
wire         reg_usm_cfg_freq_cs;
wire        reg_usm_cfg_pulse_cs;
wire       reg_usm_move_pulse_cs;       
wire        reg_pf_i2c_wr_len_cs;
wire        reg_pf_i2c_rd_len_cs;
wire        reg_cf_i2c_wr_len_cs;
wire        reg_cf_i2c_rd_len_cs;
wire        reg_pf_i2c_wr_buf_cs;
wire        reg_pf_i2c_rd_buf_cs;
wire        reg_cf_i2c_wr_buf_cs;
wire        reg_cf_i2c_rd_buf_cs;

wire [`PWR-1:0]               reg_ac_pwr_rst_cs;
wire [`PWR-1:0]            reg_ac_pwr_sta_ac_cs;
wire [`PWR-1:0]            reg_ac_pwr_sta_dc_cs;
wire [`PWR-1:0]            reg_ac_pwr_sta_ft_cs;
wire [`PWR-1:0]                reg_ac_pwr_sw_cs;
wire [`PWR-1:0]        reg_irq_sta_ac_ac_err_cs;
wire [`PWR-1:0]        reg_irq_sta_ac_dc_err_cs;
wire [`PWR-1:0]         reg_irq_sta_ac_fault_cs;
wire [`PWR-1:0]           reg_irq_sta_ac_aol_cs;
wire [`PWR-1:0]       reg_irq_mask_ac_ac_err_cs;
wire [`PWR-1:0]       reg_irq_mask_ac_dc_err_cs;
wire [`PWR-1:0]        reg_irq_mask_ac_fault_cs;
wire [`PWR-1:0]          reg_irq_mask_ac_aol_cs;
wire [`PWR-1:0]                reg_ac_pwr_av_cs;
wire [`PWR-1:0]                reg_ac_pwr_al_cs;
wire [`USM-1:0]                  reg_usm_rst_cs;
wire [`USM-1:0]                  reg_usm_run_cs;
wire [`USM-1:0]            reg_usm_limit_sta_cs;
wire [`USM-1:0]          reg_usm_limit_watch_cs;
wire [`USM-1:0]         reg_irq_sta_usm_done_cs;
wire [`USM-1:0]        reg_irq_sta_usm_limit_cs;
wire [`USM-1:0]     reg_irq_sta_usm_time_out_cs;
wire [`USM-1:0] reg_irq_sta_usm_sample_small_cs;
wire [`USM-1:0]        reg_irq_mask_usm_done_cs;
wire [`USM-1:0]       reg_irq_mask_usm_limit_cs;
wire [`USM-1:0]    reg_irq_mask_usm_time_out_cs;
wire [`USM-1:0]reg_irq_mask_usm_sample_small_cs;
wire [`USM-1:0]        reg_usm_sample_intv_cs;       
wire [`USM-1:0]  reg_usm_sample_index_addr_cs; 
wire [`USM-1:0] reg_usm_sample_depth_count_cs;
wire [`USM-1:0]        reg_usm_sample_read_cs;       
wire [`USM-1:0]        reg_usm_sample_data_cs;		
wire [`USM-1:0]        reg_usm_sample_vald_cs;
wire [`USM-1:0]    reg_usm_sample_limit_en_cs;
wire [`USM-1:0]   reg_usm_sample_limit_val_cs;
wire [`USM-1:0]            reg_usm_cfg_dir_cs;
wire [`CHS-1:0]            reg_amp_cf_done_cs;
wire [`CHS-1:0]            reg_amp_pf_done_cs;
wire [`CHS-1:0]               reg_amp_pres_cs;
wire [`CHS-1:0]             reg_amp_cf_rst_cs;
wire [`CHS-1:0]             reg_amp_pf_rst_cs;
wire [`CHS-1:0]           reg_pf_i2c_mutex_cs;
wire [`CHS-1:0]           reg_cf_i2c_mutex_cs;
wire [`CHS-1:0]             reg_pf_i2c_rst_cs;
wire [`CHS-1:0]             reg_cf_i2c_rst_cs;
wire [`CHS-1:0]           reg_pf_i2c_start_cs;
wire [`CHS-1:0]            reg_pf_i2c_busy_cs;
wire [`CHS-1:0]        reg_pf_i2c_line_err_cs;
wire [`CHS-1:0]        reg_pf_i2c_nack_err_cs;
wire [`CHS-1:0]           reg_cf_i2c_start_cs;
wire [`CHS-1:0]            reg_cf_i2c_busy_cs;
wire [`CHS-1:0]        reg_cf_i2c_line_err_cs;
wire [`CHS-1:0]        reg_cf_i2c_nack_err_cs;
wire [`CHS-1:0]   reg_irq_sta_chs_phs_fpga_cs;
wire [`CHS-1:0]  reg_irq_sta_chs_ctrl_fpga_cs;
wire [`CHS-1:0]  reg_irq_mask_chs_phs_fpga_cs;
wire [`CHS-1:0] reg_irq_mask_chs_ctrl_fpga_cs;
        
assign          reg_zynq_gen_id_cs = ((addr>=         `ZYNQ_GEN_ID_ADDR)&&(addr<=         `ZYNQ_GEN_ID_END));
assign          reg_zynq_gen_sn_cs = ((addr>=         `ZYNQ_GEN_SN_ADDR)&&(addr<=         `ZYNQ_GEN_SN_END));
assign          reg_zynq_gen_fm_cs = ((addr>=         `ZYNQ_GEN_FM_ADDR)&&(addr<=         `ZYNQ_GEN_FM_END));
assign         reg_zynq_gen_dna_cs = ((addr>=        `ZYNQ_GEN_DNA_ADDR)&&(addr<=        `ZYNQ_GEN_DNA_END));
assign          reg_zynq_gen_pw_cs = ((addr>=         `ZYNQ_GEN_PW_ADDR)&&(addr<=         `ZYNQ_GEN_PW_END));
assign         reg_phs_out_time_cs = ((addr>=        `PHS_OUT_TIME_ADDR)&&(addr<=        `PHS_OUT_TIME_END));  
assign         reg_phs_out_trig_cs = ((addr>=        `PHS_OUT_TRIG_ADDR)&&(addr<=        `PHS_OUT_TRIG_END));  
assign       reg_clk_i2c_wr_buf_cs = ((addr>=      `CLK_I2C_WR_BUF_ADDR)&&(addr<=      `CLK_I2C_WR_BUF_END));
assign       reg_clk_i2c_rd_buf_cs = ((addr>=      `CLK_I2C_RD_BUF_ADDR)&&(addr<=      `CLK_I2C_RD_BUF_END)); 
assign       reg_rtc_i2c_wr_buf_cs = ((addr>=      `RTC_I2C_WR_BUF_ADDR)&&(addr<=      `RTC_I2C_WR_BUF_END));
assign       reg_rtc_i2c_rd_buf_cs = ((addr>=      `RTC_I2C_RD_BUF_ADDR)&&(addr<=      `RTC_I2C_RD_BUF_END));  
assign        reg_pf_i2c_wr_buf_cs = ((addr>=       `PF_I2C_WR_BUF_ADDR)&&(addr<=       `PF_I2C_WR_BUF_END));
assign        reg_pf_i2c_rd_buf_cs = ((addr>=       `PF_I2C_RD_BUF_ADDR)&&(addr<=       `PF_I2C_RD_BUF_END));
assign        reg_cf_i2c_wr_buf_cs = ((addr>=       `CF_I2C_WR_BUF_ADDR)&&(addr<=       `CF_I2C_WR_BUF_END));
assign        reg_cf_i2c_rd_buf_cs = ((addr>=       `CF_I2C_RD_BUF_ADDR)&&(addr<=       `CF_I2C_RD_BUF_END));
assign        reg_pf_i2c_wr_len_cs = ((addr>=       `PF_I2C_WR_LEN_ADDR)&&(addr<=       `PF_I2C_WR_LEN_END));
assign        reg_pf_i2c_rd_len_cs = ((addr>=       `PF_I2C_RD_LEN_ADDR)&&(addr<=       `PF_I2C_RD_LEN_END));
assign        reg_cf_i2c_wr_len_cs = ((addr>=       `CF_I2C_WR_LEN_ADDR)&&(addr<=       `CF_I2C_WR_LEN_END));
assign        reg_cf_i2c_rd_len_cs = ((addr>=       `CF_I2C_RD_LEN_ADDR)&&(addr<=       `CF_I2C_RD_LEN_END));
assign         reg_zynq_gen_scr_cs = ((addr>=        `ZYNQ_GEN_SCR_ADDR)&&(addr<=        `ZYNQ_GEN_SCR_END));
assign       reg_clk_i2c_wr_len_cs = ((addr>=      `CLK_I2C_WR_LEN_ADDR)&&(addr<=      `CLK_I2C_WR_LEN_END));
assign       reg_clk_i2c_rd_len_cs = ((addr>=      `CLK_I2C_RD_LEN_ADDR)&&(addr<=      `CLK_I2C_RD_LEN_END));
assign       reg_rtc_i2c_wr_len_cs = ((addr>=      `RTC_I2C_WR_LEN_ADDR)&&(addr<=      `RTC_I2C_WR_LEN_END));
assign       reg_rtc_i2c_rd_len_cs = ((addr>=      `RTC_I2C_RD_LEN_ADDR)&&(addr<=      `RTC_I2C_RD_LEN_END));
assign          reg_zynq_gen_vf_cs = ((addr>=         `ZYNQ_GEN_VF_ADDR)&&(addr<=         `ZYNQ_GEN_VF_END));
assign         reg_zynq_gen_rst_cs = ((addr>=        `ZYNQ_GEN_RST_ADDR)&&(addr<=        `ZYNQ_GEN_RST_END));
assign          reg_doc_ems_sta_cs = ((addr>=         `EMS_DOC_STA_ADDR)&&(addr<=         `EMS_DOC_STA_END));
assign          reg_pat_ems_sta_cs = ((addr>=         `EMS_PAT_STA_ADDR)&&(addr<=         `EMS_PAT_STA_END));
assign            reg_prob_pres_cs = ((addr>=           `PROB_PRES_ADDR)&&(addr<=           `PROB_PRES_END));
assign        reg_clk_i2c_mutex_cs = ((addr>=       `CLK_I2C_MUTEX_ADDR)&&(addr<=       `CLK_I2C_MUTEX_END));
assign          reg_clk_i2c_rst_cs = ((addr>=         `CLK_I2C_RST_ADDR)&&(addr<=         `CLK_I2C_RST_END));
assign        reg_clk_i2c_start_cs = ((addr>=       `CLK_I2C_START_ADDR)&&(addr<=       `CLK_I2C_START_END));
assign         reg_clk_i2c_busy_cs = ((addr>=        `CLK_I2C_BUSY_ADDR)&&(addr<=        `CLK_I2C_BUSY_END));
assign     reg_clk_i2c_line_err_cs = ((addr>=        `CLK_I2C_LERR_ADDR)&&(addr<=        `CLK_I2C_LERR_END));
assign     reg_clk_i2c_nack_err_cs = ((addr>=        `CLK_I2C_NERR_ADDR)&&(addr<=        `CLK_I2C_NERR_END));
assign        reg_rtc_i2c_mutex_cs = ((addr>=       `RTC_I2C_MUTEX_ADDR)&&(addr<=       `RTC_I2C_MUTEX_END));
assign          reg_rtc_i2c_rst_cs = ((addr>=         `RTC_I2C_RST_ADDR)&&(addr<=         `RTC_I2C_RST_END));
assign        reg_rtc_i2c_start_cs = ((addr>=       `RTC_I2C_START_ADDR)&&(addr<=       `RTC_I2C_START_END));
assign         reg_rtc_i2c_busy_cs = ((addr>=        `RTC_I2C_BUSY_ADDR)&&(addr<=        `RTC_I2C_BUSY_END));
assign     reg_rtc_i2c_line_err_cs = ((addr>=        `RTC_I2C_LERR_ADDR)&&(addr<=        `RTC_I2C_LERR_END));
assign     reg_rtc_i2c_nack_err_cs = ((addr>=        `RTC_I2C_NERR_ADDR)&&(addr<=        `RTC_I2C_NERR_END));
assign           reg_usm_pwr_sw_cs = ((addr>=          `USM_PWR_SW_ADDR)&&(addr<=          `USM_PWR_SW_END));
assign  reg_irq_sta_ems_doc_rls_cs = ((addr>= `IRQ_STA_EMS_DOC_RLS_ADDR)&&(addr<= `IRQ_STA_EMS_DOC_RLS_END));
assign  reg_irq_sta_ems_doc_prs_cs = ((addr>= `IRQ_STA_EMS_DOC_PRS_ADDR)&&(addr<= `IRQ_STA_EMS_DOC_PRS_END));
assign  reg_irq_sta_ems_pat_rls_cs = ((addr>= `IRQ_STA_EMS_PAT_RLS_ADDR)&&(addr<= `IRQ_STA_EMS_PAT_RLS_END));
assign  reg_irq_sta_ems_pat_prs_cs = ((addr>= `IRQ_STA_EMS_PAT_PRS_ADDR)&&(addr<= `IRQ_STA_EMS_PAT_PRS_END));
assign    reg_irq_sta_heat_done_cs = ((addr>=   `IRQ_STA_HEAT_DONE_ADDR)&&(addr<=   `IRQ_STA_HEAT_DONE_END));
assign reg_irq_mask_ems_doc_rls_cs = ((addr>=`IRQ_MASK_EMS_DOC_RLS_ADDR)&&(addr<=`IRQ_MASK_EMS_DOC_RLS_END));
assign reg_irq_mask_ems_doc_prs_cs = ((addr>=`IRQ_MASK_EMS_DOC_PRS_ADDR)&&(addr<=`IRQ_MASK_EMS_DOC_PRS_END));
assign reg_irq_mask_ems_pat_rls_cs = ((addr>=`IRQ_MASK_EMS_PAT_RLS_ADDR)&&(addr<=`IRQ_MASK_EMS_PAT_RLS_END));
assign reg_irq_mask_ems_pat_prs_cs = ((addr>=`IRQ_MASK_EMS_PAT_PRS_ADDR)&&(addr<=`IRQ_MASK_EMS_PAT_PRS_END));
assign   reg_irq_mask_heat_done_cs = ((addr>=  `IRQ_MASK_HEAT_DONE_ADDR)&&(addr<=  `IRQ_MASK_HEAT_DONE_END));
assign         reg_usm_cfg_freq_cs = ((addr>=        `USM_CFG_FREQ_ADDR)&&(addr<=        `USM_CFG_FREQ_END));
assign        reg_usm_cfg_pulse_cs = ((addr>=       `USM_CFG_PULSE_ADDR)&&(addr<=       `USM_CFG_PULSE_END));
assign       reg_usm_move_pulse_cs = ((addr>=      `USM_MOVE_PULSE_ADDR)&&(addr<=      `USM_MOVE_PULSE_END));


generate
for(j=0;j<`PWR;j=j+1)begin:ac_cs   
    assign         reg_ac_pwr_rst_cs[j] = (addr==      `AC_POWER_RST_ADDR+j);
    assign      reg_ac_pwr_sta_ac_cs[j] = (addr==   `AC_POWER_STA_AC_ADDR+j);
    assign      reg_ac_pwr_sta_dc_cs[j] = (addr==   `AC_POWER_STA_DC_ADDR+j);
    assign      reg_ac_pwr_sta_ft_cs[j] = (addr==   `AC_POWER_STA_FT_ADDR+j);
    assign          reg_ac_pwr_sw_cs[j] = (addr==       `AC_POWER_SW_ADDR+j);
    assign          reg_ac_pwr_av_cs[j] = (addr==       `AC_POWER_AV_ADDR+j);
    assign          reg_ac_pwr_al_cs[j] = (addr==       `AC_POWER_AL_ADDR+j);
    assign  reg_irq_sta_ac_ac_err_cs[j] = (addr== `IRQ_STA_AC_AC_ERR_ADDR+j);
    assign  reg_irq_sta_ac_dc_err_cs[j] = (addr== `IRQ_STA_AC_DC_ERR_ADDR+j);
    assign   reg_irq_sta_ac_fault_cs[j] = (addr==  `IRQ_STA_AC_FAULT_ADDR+j);
    assign     reg_irq_sta_ac_aol_cs[j] = (addr==    `IRQ_STA_AC_AOL_ADDR+j);
    assign reg_irq_mask_ac_ac_err_cs[j] = (addr==`IRQ_MASK_AC_AC_ERR_ADDR+j);
    assign reg_irq_mask_ac_dc_err_cs[j] = (addr==`IRQ_MASK_AC_DC_ERR_ADDR+j);
    assign  reg_irq_mask_ac_fault_cs[j] = (addr== `IRQ_MASK_AC_FAULT_ADDR+j);
    assign    reg_irq_mask_ac_aol_cs[j] = (addr==   `IRQ_MASK_AC_AOL_ADDR+j);
end
endgenerate

generate
for(j=0;j<`USM;j=j+1)begin :usm_cs
    assign                   reg_usm_rst_cs[j]    = (addr==               `USM_RST_ADDR+j);
    assign                   reg_usm_run_cs[j]    = (addr==               `USM_RUN_ADDR+j);
    assign               reg_usm_cfg_dir_cs[j]    = (addr==           `USM_CFG_DIR_ADDR+j);
    assign             reg_usm_limit_sta_cs[j]    = (addr==         `USM_LIMIT_STA_ADDR+j);
    assign           reg_usm_limit_watch_cs[j]    = (addr==       `USM_LIMIT_WATCH_ADDR+j);
    assign         reg_irq_mask_usm_done_cs[j]    = (addr==     `IRQ_MASK_USM_DONE_ADDR+j);
    assign        reg_irq_mask_usm_limit_cs[j]    = (addr==    `IRQ_MASK_USM_LIMIT_ADDR+j);
    assign     reg_irq_mask_usm_time_out_cs[j]    = (addr== `IRQ_MASK_USM_TIME_OUT_ADDR+j);
	assign reg_irq_mask_usm_sample_small_cs[j]    = (addr==   `IRQ_MASK_USM_SAMPLE_ADDR+j);
    assign          reg_irq_sta_usm_done_cs[j]    = (addr==      `IRQ_STA_USM_DONE_ADDR+j);
    assign         reg_irq_sta_usm_limit_cs[j]    = (addr==     `IRQ_STA_USM_LIMIT_ADDR+j);
    assign      reg_irq_sta_usm_time_out_cs[j]    = (addr==  `IRQ_STA_USM_TIME_OUT_ADDR+j);
	assign  reg_irq_sta_usm_sample_small_cs[j]    = (addr==    `IRQ_STA_USM_SAMPLE_ADDR+j);
	
	assign        reg_usm_sample_intv_cs[j] = (addr==       `USM_SAMPLE_INTV_ADDR+j);      
	assign  reg_usm_sample_index_addr_cs[j] = (addr==      `USM_SAMPLE_INDEX_ADDR+j);
	assign        reg_usm_sample_read_cs[j] = (addr==       `USM_SAMPLE_READ_ADDR+j);       
	assign        reg_usm_sample_data_cs[j] = (addr==       `USM_SAMPLE_DATA_ADDR+j);		
	assign        reg_usm_sample_vald_cs[j] = (addr==       `USM_SAMPLE_VALD_ADDR+j);
	assign    reg_usm_sample_limit_en_cs[j] = (addr==   `USM_SAMPLE_LIMIT_EN_ADDR+j);
	assign   reg_usm_sample_limit_val_cs[j] = (addr==  `USM_SAMPLE_LIMIT_VAL_ADDR+j);
	assign reg_usm_sample_depth_count_cs[j] = (addr==      `USM_SAMPLE_DEPTH_ADDR+j);	
end
endgenerate


generate
for(j=0;j<`CHS;j=j+1)begin: chassis_cs
    assign               reg_amp_pres_cs[j] = (addr==              `AMP_PRES_ADDR+j);
    assign             reg_amp_cf_rst_cs[j] = (addr==            `AMP_CF_RST_ADDR+j);
    assign            reg_amp_cf_done_cs[j] = (addr==           `AMP_CF_DONE_ADDR+j);
    assign             reg_amp_pf_rst_cs[j] = (addr==            `AMP_PF_RST_ADDR+j);
    assign            reg_amp_pf_done_cs[j] = (addr==           `AMP_PF_DONE_ADDR+j);
    assign           reg_pf_i2c_mutex_cs[j] = (addr==          `PF_I2C_MUTEX_ADDR+j);
    assign             reg_pf_i2c_rst_cs[j] = (addr==            `PF_I2C_RST_ADDR+j);
    assign           reg_pf_i2c_start_cs[j] = (addr==          `PF_I2C_START_ADDR+j);
    assign            reg_pf_i2c_busy_cs[j] = (addr==           `PF_I2C_BUSY_ADDR+j);
    assign        reg_pf_i2c_line_err_cs[j] = (addr==           `PF_I2C_LERR_ADDR+j);
    assign        reg_pf_i2c_nack_err_cs[j] = (addr==           `PF_I2C_NERR_ADDR+j);
    assign           reg_cf_i2c_mutex_cs[j] = (addr==          `CF_I2C_MUTEX_ADDR+j);
    assign             reg_cf_i2c_rst_cs[j] = (addr==            `CF_I2C_RST_ADDR+j);
    assign           reg_cf_i2c_start_cs[j] = (addr==          `CF_I2C_START_ADDR+j);
    assign            reg_cf_i2c_busy_cs[j] = (addr==           `CF_I2C_BUSY_ADDR+j);
    assign        reg_cf_i2c_line_err_cs[j] = (addr==           `CF_I2C_LERR_ADDR+j);
    assign        reg_cf_i2c_nack_err_cs[j] = (addr==           `CF_I2C_NERR_ADDR+j);
    assign   reg_irq_sta_chs_phs_fpga_cs[j] = (addr==  `IRQ_STA_CHS_PHS_FPGA_ADDR+j);
    assign  reg_irq_sta_chs_ctrl_fpga_cs[j] = (addr== `IRQ_STA_CHS_CTRL_FPGA_ADDR+j);
    assign  reg_irq_mask_chs_phs_fpga_cs[j] = (addr== `IRQ_MASK_CHS_PHS_FPGA_ADDR+j);
    assign reg_irq_mask_chs_ctrl_fpga_cs[j] = (addr==`IRQ_MASK_CHS_CTRL_FPGA_ADDR+j);
end
endgenerate

assign reg_zynq_gen_vf = 0;
assign reg_zynq_gen_id = `SHENDE_MEDICAL_ID;
assign reg_zynq_gen_fm = {`SVN_VERSION,`FIRMWARE_COMPILE_DATE};


always@(*) begin
 if     (                reg_zynq_gen_id_cs)   S_RD<=           reg_zynq_gen_id[(addr-   `ZYNQ_GEN_ID_ADDR)*32+:32];
 else if(                reg_zynq_gen_sn_cs)   S_RD<=           reg_zynq_gen_sn[(addr-   `ZYNQ_GEN_SN_ADDR)*32+:32];
 else if(                reg_zynq_gen_fm_cs)   S_RD<=           reg_zynq_gen_fm[(addr-   `ZYNQ_GEN_FM_ADDR)*32+:32];
 else if(               reg_zynq_gen_dna_cs)   S_RD<=          reg_zynq_gen_dna[(addr-  `ZYNQ_GEN_DNA_ADDR)*32+:32];
 else if(                reg_zynq_gen_pw_cs)   S_RD<=           reg_zynq_gen_pw[(addr-   `ZYNQ_GEN_PW_ADDR)*32+:32];
 else if(             reg_clk_i2c_wr_buf_cs)   S_RD<=        reg_clk_i2c_wr_buf[(addr-`CLK_I2C_WR_BUF_ADDR)*32+:32];
 else if(             reg_clk_i2c_rd_buf_cs)   S_RD<=        reg_clk_i2c_rd_buf[(addr-`CLK_I2C_RD_BUF_ADDR)*32+:32];
 else if(               reg_phs_out_time_cs)   S_RD<=          reg_phs_out_time[(addr-  `PHS_OUT_TIME_ADDR)*32+:32]; 
 else if(               reg_phs_out_trig_cs)   S_RD<=          reg_phs_out_trig[(addr-  `PHS_OUT_TRIG_ADDR)*32+:32]; 
 else if(             reg_rtc_i2c_wr_buf_cs)   S_RD<=        reg_rtc_i2c_wr_buf[(addr-`RTC_I2C_WR_BUF_ADDR)*32+:32];
 else if(             reg_rtc_i2c_rd_buf_cs)   S_RD<=        reg_rtc_i2c_rd_buf[(addr-`RTC_I2C_RD_BUF_ADDR)*32+:32]; 
 else if(                  reg_prob_pres_cs)   S_RD<=             reg_prob_pres;
 else if(              reg_rtc_i2c_mutex_cs)   S_RD<=         reg_rtc_i2c_mutex;
 else if(                reg_rtc_i2c_rst_cs)   S_RD<=           reg_rtc_i2c_rst;
 else if(             reg_rtc_i2c_wr_len_cs)   S_RD<=        reg_rtc_i2c_wr_len;
 else if(             reg_rtc_i2c_rd_len_cs)   S_RD<=        reg_rtc_i2c_rd_len;
 else if(              reg_rtc_i2c_start_cs)   S_RD<=         reg_rtc_i2c_start;
 else if(               reg_rtc_i2c_busy_cs)   S_RD<=          reg_rtc_i2c_busy;
 else if(           reg_rtc_i2c_line_err_cs)   S_RD<=      reg_rtc_i2c_line_err;
 else if(           reg_rtc_i2c_nack_err_cs)   S_RD<=      reg_rtc_i2c_nack_err;
 else if(               reg_zynq_gen_scr_cs)   S_RD<=          reg_zynq_gen_scr;
 else if(                reg_zynq_gen_vf_cs)   S_RD<=           reg_zynq_gen_vf;
 else if(               reg_zynq_gen_rst_cs)   S_RD<=          reg_zynq_gen_rst;
 else if(                reg_doc_ems_sta_cs)   S_RD<=           reg_doc_ems_sta;
 else if(                reg_pat_ems_sta_cs)   S_RD<=           reg_pat_ems_sta;
 else if(              reg_clk_i2c_mutex_cs)   S_RD<=         reg_clk_i2c_mutex;
 else if(                reg_clk_i2c_rst_cs)   S_RD<=           reg_clk_i2c_rst;
 else if(             reg_clk_i2c_wr_len_cs)   S_RD<=        reg_clk_i2c_wr_len;
 else if(             reg_clk_i2c_rd_len_cs)   S_RD<=        reg_clk_i2c_rd_len;
 else if(              reg_clk_i2c_start_cs)   S_RD<=         reg_clk_i2c_start;
 else if(               reg_clk_i2c_busy_cs)   S_RD<=          reg_clk_i2c_busy;
 else if(           reg_clk_i2c_line_err_cs)   S_RD<=      reg_clk_i2c_line_err;
 else if(           reg_clk_i2c_nack_err_cs)   S_RD<=      reg_clk_i2c_nack_err;
 else if(        reg_irq_sta_ems_doc_rls_cs)   S_RD<=   reg_irq_sta_ems_doc_rls;
 else if(          reg_irq_sta_heat_done_cs)   S_RD<=     reg_irq_sta_heat_done;
 else if(        reg_irq_sta_ems_doc_prs_cs)   S_RD<=   reg_irq_sta_ems_doc_prs;
 else if(        reg_irq_sta_ems_pat_rls_cs)   S_RD<=   reg_irq_sta_ems_pat_rls;
 else if(        reg_irq_sta_ems_pat_prs_cs)   S_RD<=   reg_irq_sta_ems_pat_prs;
 else if(       reg_irq_mask_ems_doc_rls_cs)   S_RD<=  reg_irq_mask_ems_doc_rls;
 else if(       reg_irq_mask_ems_doc_prs_cs)   S_RD<=  reg_irq_mask_ems_doc_prs;
 else if(       reg_irq_mask_ems_pat_rls_cs)   S_RD<=  reg_irq_mask_ems_pat_rls;
 else if(       reg_irq_mask_ems_pat_prs_cs)   S_RD<=  reg_irq_mask_ems_pat_prs;
 else if(         reg_irq_mask_heat_done_cs)   S_RD<=    reg_irq_mask_heat_done; 
 else if(                 reg_usm_pwr_sw_cs)   S_RD<=            reg_usm_pwr_sw;  
 else if(|                reg_ac_pwr_rst_cs)   S_RD<=               reg_ac_pwr_rst[addr-          `AC_POWER_RST_ADDR];
 else if(|             reg_ac_pwr_sta_ac_cs)   S_RD<=            reg_ac_pwr_sta_ac[addr-       `AC_POWER_STA_AC_ADDR];
 else if(|             reg_ac_pwr_sta_dc_cs)   S_RD<=            reg_ac_pwr_sta_dc[addr-       `AC_POWER_STA_DC_ADDR];
 else if(|             reg_ac_pwr_sta_ft_cs)   S_RD<=            reg_ac_pwr_sta_ft[addr-       `AC_POWER_STA_FT_ADDR];
 else if(|                 reg_ac_pwr_sw_cs)   S_RD<=                reg_ac_pwr_sw[addr-           `AC_POWER_SW_ADDR];
 else if(|         reg_irq_sta_ac_ac_err_cs)   S_RD<=        reg_irq_sta_ac_ac_err[addr-     `IRQ_STA_AC_AC_ERR_ADDR];
 else if(|         reg_irq_sta_ac_dc_err_cs)   S_RD<=        reg_irq_sta_ac_dc_err[addr-     `IRQ_STA_AC_DC_ERR_ADDR];
 else if(|          reg_irq_sta_ac_fault_cs)   S_RD<=         reg_irq_sta_ac_fault[addr-      `IRQ_STA_AC_FAULT_ADDR];
 else if(|            reg_irq_sta_ac_aol_cs)   S_RD<=           reg_irq_sta_ac_aol[addr-        `IRQ_STA_AC_AOL_ADDR];
 else if(|        reg_irq_mask_ac_ac_err_cs)   S_RD<=       reg_irq_mask_ac_ac_err[addr-    `IRQ_MASK_AC_AC_ERR_ADDR];
 else if(|        reg_irq_mask_ac_dc_err_cs)   S_RD<=       reg_irq_mask_ac_dc_err[addr-    `IRQ_MASK_AC_DC_ERR_ADDR];
 else if(|         reg_irq_mask_ac_fault_cs)   S_RD<=        reg_irq_mask_ac_fault[addr-     `IRQ_MASK_AC_FAULT_ADDR];
 else if(|           reg_irq_mask_ac_aol_cs)   S_RD<=          reg_irq_mask_ac_aol[addr-       `IRQ_MASK_AC_AOL_ADDR];
 else if(|                   reg_usm_rst_cs)   S_RD<=                  reg_usm_rst[addr-               `USM_RST_ADDR];
 else if(|                   reg_usm_run_cs)   S_RD<=                  reg_usm_run[addr-               `USM_RUN_ADDR];
 else if(|               reg_usm_cfg_dir_cs)   S_RD<=              reg_usm_cfg_dir[addr-           `USM_CFG_DIR_ADDR];
 else if(|             reg_usm_limit_sta_cs)   S_RD<=            reg_usm_limit_sta[addr-         `USM_LIMIT_STA_ADDR];
 else if(|           reg_usm_limit_watch_cs)   S_RD<=          reg_usm_limit_watch[addr-       `USM_LIMIT_WATCH_ADDR];
 else if(|         reg_irq_mask_usm_done_cs)   S_RD<=        reg_irq_mask_usm_done[addr-     `IRQ_MASK_USM_DONE_ADDR];
 else if(|        reg_irq_mask_usm_limit_cs)   S_RD<=       reg_irq_mask_usm_limit[addr-    `IRQ_MASK_USM_LIMIT_ADDR];
 else if(|     reg_irq_mask_usm_time_out_cs)   S_RD<=    reg_irq_mask_usm_time_out[addr- `IRQ_MASK_USM_TIME_OUT_ADDR];
 else if(| reg_irq_mask_usm_sample_small_cs)   S_RD<=reg_irq_mask_usm_sample_small[addr-   `IRQ_MASK_USM_SAMPLE_ADDR];
 else if(|          reg_irq_sta_usm_done_cs)   S_RD<=         reg_irq_sta_usm_done[addr-      `IRQ_STA_USM_DONE_ADDR];
 else if(|         reg_irq_sta_usm_limit_cs)   S_RD<=        reg_irq_sta_usm_limit[addr-     `IRQ_STA_USM_LIMIT_ADDR];
 else if(|      reg_irq_sta_usm_time_out_cs)   S_RD<=     reg_irq_sta_usm_time_out[addr-  `IRQ_STA_USM_TIME_OUT_ADDR];
 else if(|  reg_irq_sta_usm_sample_small_cs)   S_RD<= reg_irq_sta_usm_sample_small[addr-    `IRQ_STA_USM_SAMPLE_ADDR];
 else if(|                  reg_amp_pres_cs)   S_RD<=              reg_amp_pres[addr-              `AMP_PRES_ADDR];
 else if(|                reg_amp_cf_rst_cs)   S_RD<=            reg_amp_cf_rst[addr-            `AMP_CF_RST_ADDR];
 else if(|               reg_amp_cf_done_cs)   S_RD<=           reg_amp_cf_done[addr-           `AMP_CF_DONE_ADDR];
 else if(|                reg_amp_pf_rst_cs)   S_RD<=            reg_amp_pf_rst[addr-            `AMP_PF_RST_ADDR];
 else if(|               reg_amp_pf_done_cs)   S_RD<=           reg_amp_pf_done[addr-           `AMP_PF_DONE_ADDR];
 else if(|              reg_pf_i2c_mutex_cs)   S_RD<=          reg_pf_i2c_mutex[addr-          `PF_I2C_MUTEX_ADDR];
 else if(|                reg_pf_i2c_rst_cs)   S_RD<=            reg_pf_i2c_rst[addr-            `PF_I2C_RST_ADDR];
 else if(|              reg_pf_i2c_start_cs)   S_RD<=          reg_pf_i2c_start[addr-          `PF_I2C_START_ADDR];
 else if(|               reg_pf_i2c_busy_cs)   S_RD<=           reg_pf_i2c_busy[addr-           `PF_I2C_BUSY_ADDR];
 else if(|           reg_pf_i2c_line_err_cs)   S_RD<=       reg_pf_i2c_line_err[addr-           `PF_I2C_LERR_ADDR];
 else if(|           reg_pf_i2c_nack_err_cs)   S_RD<=       reg_pf_i2c_nack_err[addr-           `PF_I2C_NERR_ADDR];
 else if(|              reg_cf_i2c_mutex_cs)   S_RD<=          reg_cf_i2c_mutex[addr-          `CF_I2C_MUTEX_ADDR];
 else if(|                reg_cf_i2c_rst_cs)   S_RD<=            reg_cf_i2c_rst[addr-            `CF_I2C_RST_ADDR];
 else if(|              reg_cf_i2c_start_cs)   S_RD<=          reg_cf_i2c_start[addr-          `CF_I2C_START_ADDR];
 else if(|               reg_cf_i2c_busy_cs)   S_RD<=           reg_cf_i2c_busy[addr-           `CF_I2C_BUSY_ADDR];
 else if(|           reg_cf_i2c_line_err_cs)   S_RD<=       reg_cf_i2c_line_err[addr-           `CF_I2C_LERR_ADDR];
 else if(|           reg_cf_i2c_nack_err_cs)   S_RD<=       reg_cf_i2c_nack_err[addr-           `CF_I2C_NERR_ADDR];
 else if(|      reg_irq_sta_chs_phs_fpga_cs)   S_RD<=  reg_irq_sta_chs_phs_fpga[addr-  `IRQ_STA_CHS_PHS_FPGA_ADDR];
 else if(|     reg_irq_sta_chs_ctrl_fpga_cs)   S_RD<= reg_irq_sta_chs_ctrl_fpga[addr- `IRQ_STA_CHS_CTRL_FPGA_ADDR];
 else if(|     reg_irq_mask_chs_phs_fpga_cs)   S_RD<= reg_irq_mask_chs_phs_fpga[addr- `IRQ_MASK_CHS_PHS_FPGA_ADDR];
 else if(|    reg_irq_mask_chs_ctrl_fpga_cs)   S_RD<=reg_irq_mask_chs_ctrl_fpga[addr-`IRQ_MASK_CHS_CTRL_FPGA_ADDR];    
 else if(|                 reg_ac_pwr_av_cs)   S_RD<=             reg_ac_pwr_av[(addr-   `AC_POWER_AV_ADDR  )*32+:32];
 else if(|                 reg_ac_pwr_al_cs)   S_RD<=             reg_ac_pwr_al[(addr-   `AC_POWER_AL_ADDR  )*32+:32];
 else if(               reg_usm_cfg_freq_cs)   S_RD<=          reg_usm_cfg_freq[(addr-  `USM_CFG_FREQ_ADDR  )*32+:32];
 else if(              reg_usm_cfg_pulse_cs)   S_RD<=         reg_usm_cfg_pulse[(addr- `USM_CFG_PULSE_ADDR  )*32+:32];
 else if(             reg_usm_move_pulse_cs)   S_RD<=        reg_usm_move_pulse[(addr-`USM_MOVE_PULSE_ADDR  )*32+:32];
 else if(|           reg_usm_sample_intv_cs)   S_RD<=       reg_usm_sample_intv[(addr-`USM_SAMPLE_INTV_ADDR )*32+:32]; 
 else if(|     reg_usm_sample_index_addr_cs)   S_RD<= reg_usm_sample_index_addr[(addr-`USM_SAMPLE_INDEX_ADDR)*16+:16];
 else if(|           reg_usm_sample_data_cs)   S_RD<=       reg_usm_sample_data[(addr-`USM_SAMPLE_DATA_ADDR	)*32+:32];
 else if(|    reg_usm_sample_depth_count_cs)   S_RD<=reg_usm_sample_depth_count[(addr-`USM_SAMPLE_DEPTH_ADDR)*16+:16];
 else if(|           reg_usm_sample_vald_cs)   S_RD<=       reg_usm_sample_vald[(addr-`USM_SAMPLE_VALD_ADDR)];
 else if(|       reg_usm_sample_limit_en_cs)   S_RD<=   reg_usm_sample_limit_en[(addr-`USM_SAMPLE_LIMIT_EN_ADDR)];
 else if(|      reg_usm_sample_limit_val_cs)   S_RD<=  reg_usm_sample_limit_val[(addr-`USM_SAMPLE_LIMIT_VAL_ADDR)*32+:32];
 else if(|           reg_usm_sample_read_cs)   S_RD<=       reg_usm_sample_read[(addr-`USM_SAMPLE_READ_ADDR)];
 else if(              reg_pf_i2c_wr_len_cs)   S_RD<=         reg_pf_i2c_wr_len[(addr- `PF_I2C_WR_LEN_ADDR)*32+: `PF_I2C_WR_LEN_BIT_WID];
 else if(              reg_pf_i2c_rd_len_cs)   S_RD<=         reg_pf_i2c_rd_len[(addr- `PF_I2C_RD_LEN_ADDR)*32+: `PF_I2C_RD_LEN_BIT_WID];
 else if(              reg_cf_i2c_wr_len_cs)   S_RD<=         reg_cf_i2c_wr_len[(addr- `CF_I2C_WR_LEN_ADDR)*32+: `CF_I2C_WR_LEN_BIT_WID];
 else if(              reg_cf_i2c_rd_len_cs)   S_RD<=         reg_cf_i2c_rd_len[(addr- `CF_I2C_RD_LEN_ADDR)*32+: `CF_I2C_RD_LEN_BIT_WID];
 else if(              reg_pf_i2c_wr_buf_cs)   S_RD<=         reg_pf_i2c_wr_buf[(addr- `PF_I2C_WR_BUF_ADDR)*32+:32];
 else if(              reg_pf_i2c_rd_buf_cs)   S_RD<=         reg_pf_i2c_rd_buf[(addr- `PF_I2C_RD_BUF_ADDR)*32+:32];
 else if(              reg_cf_i2c_wr_buf_cs)   S_RD<=         reg_cf_i2c_wr_buf[(addr- `CF_I2C_WR_BUF_ADDR)*32+:32];
 else if(              reg_cf_i2c_rd_buf_cs)   S_RD<=         reg_cf_i2c_rd_buf[(addr- `CF_I2C_RD_BUF_ADDR)*32+:32];
 else                                          S_RD<= 32'h0000_0000;                             
end

wire clk_i2c_line_err;
wire clk_i2c_nack_err;
wire rtc_i2c_line_err;
wire rtc_i2c_nack_err;
//write 1st level register
always @( posedge S_CLK ) begin
    if (S_RST) begin
        reg_zynq_gen_pw      <=0;
        reg_zynq_gen_scr     <=0;
        reg_zynq_gen_rst     <=1;
        reg_rtc_i2c_rst      <=0;
        reg_rtc_i2c_wr_buf   <=0;
        reg_rtc_i2c_wr_len   <=0;
        reg_rtc_i2c_rd_len   <=0;
        reg_rtc_i2c_start    <=0;   
        reg_rtc_i2c_line_err <=0;
        reg_rtc_i2c_nack_err <=0;        
        reg_clk_i2c_rst      <=0; //0__________________91__________________92__________________93__________________94__________________90_1_
        reg_clk_i2c_wr_buf   <=800'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C00010000000000000000002C1100F60A005E1A0000808080808080804F0000000000000000000000000018000000C0;
        reg_clk_i2c_wr_len   <=100; 
        reg_clk_i2c_rd_len   <=0;
        reg_clk_i2c_start    <=0;
        reg_clk_i2c_line_err <=0;
        reg_clk_i2c_nack_err <=0;
    end 
    else if (S_WREN) begin
        if     (   reg_zynq_gen_pw_cs)    reg_zynq_gen_pw[(addr-   `ZYNQ_GEN_PW_ADDR)*32+:32]<=S_WD; 
        else if(reg_rtc_i2c_wr_buf_cs) reg_rtc_i2c_wr_buf[(addr-`RTC_I2C_WR_BUF_ADDR)*32+:32]<=S_WD;     
        else if(reg_clk_i2c_wr_buf_cs) reg_clk_i2c_wr_buf[(addr-`CLK_I2C_WR_BUF_ADDR)*32+:32]<=S_WD;
        else if(  reg_zynq_gen_scr_cs)   reg_zynq_gen_scr <=S_WD[  `ZYNQ_GEN_SCR_BIT_WID-1:0];
        else if(reg_rtc_i2c_wr_len_cs) reg_rtc_i2c_wr_len <=S_WD[`RTC_I2C_WR_LEN_BIT_WID-1:0];
        else if(reg_rtc_i2c_rd_len_cs) reg_rtc_i2c_rd_len <=S_WD[`RTC_I2C_RD_LEN_BIT_WID-1:0];   
        else if(reg_clk_i2c_wr_len_cs) reg_clk_i2c_wr_len <=S_WD[`CLK_I2C_WR_LEN_BIT_WID-1:0];  
        else if(reg_clk_i2c_rd_len_cs) reg_clk_i2c_rd_len <=S_WD[`CLK_I2C_RD_LEN_BIT_WID-1:0];    
        else if(  reg_zynq_gen_rst_cs)   reg_zynq_gen_rst <=S_WD[0];
        else if(   reg_rtc_i2c_rst_cs)    reg_rtc_i2c_rst <=S_WD[0]; 
        else if(   reg_clk_i2c_rst_cs)    reg_clk_i2c_rst <=S_WD[0];      
        else if( reg_rtc_i2c_start_cs)  reg_rtc_i2c_start <=1;
        else if( reg_clk_i2c_start_cs)  reg_clk_i2c_start <=1;    
    end
    else if (S_RDEN) begin
         if     (reg_clk_i2c_line_err_cs) reg_clk_i2c_line_err<= 0;
         else if(reg_clk_i2c_nack_err_cs) reg_clk_i2c_nack_err<= 0;
         else if(reg_rtc_i2c_line_err_cs) reg_rtc_i2c_line_err<= 0;
         else if(reg_rtc_i2c_nack_err_cs) reg_rtc_i2c_nack_err<= 0;
    end
    else begin
        if(clk_i2c_line_err) reg_clk_i2c_line_err<= 1;
        if(clk_i2c_nack_err) reg_clk_i2c_nack_err<= 1;
        if(rtc_i2c_line_err) reg_rtc_i2c_line_err<= 1;
        if(rtc_i2c_nack_err) reg_rtc_i2c_nack_err<= 1;
        reg_rtc_i2c_start<=0;  
        reg_clk_i2c_start<=0;
    end
end

localparam CNT_10K_IN_100M = (`FPGA_SYS_CLK_FREQ/10_000)/2;
localparam CNT_100K_IN_100M = (`FPGA_SYS_CLK_FREQ/100_000)/2;
/*
    __010203040506070809
 01 000000000018000000C0
 02 804F0000000000000000
 03 5E1A0000808080808080
 04 000000002C1100F60A00
 05 00000C00010000000000
 06 00000000000000000000
 07 00000000000000000000
 08 00000000000000000000
 09 00000000000000000000
 10 00000000000000000000
 11 00000000000000000000
 12 00000000000000000000
 13 00000000000000000000
 14 00000000000000000000
 15 00000000000000000000
 16 00000000000000000000
 17 00000000000000000000
 18 00000000000000000000
 19 C0006060D20030000000
 20 00000000000000000000
 21 00000000000000000000
 22 00000000000000000000
 23 0000000000000D000000
 24         000000000000
*/
reg [1:0] emermea_deb_r;
//write 2nd leves register
always @( posedge S_CLK ) begin
    if (reg_zynq_gen_rst) begin
        reg_phs_out_time        <=0;  
        reg_phs_out_trig        <=0;
	    reg_usm_pwr_sw          <=0;
        reg_pat_ems_sta         <=0; 
        reg_doc_ems_sta         <=0;
        reg_irq_mask_heat_done  <=0;
        reg_irq_mask_ems_doc_rls<=0;
        reg_irq_mask_ems_doc_prs<=0;
        reg_irq_mask_ems_pat_rls<=0;
        reg_irq_mask_ems_pat_prs<=0;
        reg_irq_sta_heat_done   <=0;
        reg_irq_sta_ems_doc_rls <=0;
        reg_irq_sta_ems_doc_prs <=0;
        reg_irq_sta_ems_pat_rls <=0;
        reg_irq_sta_ems_pat_prs <=0;
        IRQ                     <=0; 
        emermea_deb_r           <=2'b11;
    end 
    else if (S_WREN) begin                
             if( reg_irq_sta_ems_doc_rls_cs) reg_irq_sta_ems_doc_rls<=1;
        else if( reg_irq_sta_ems_doc_prs_cs) reg_irq_sta_ems_doc_prs<=1;
        else if( reg_irq_sta_ems_pat_rls_cs) reg_irq_sta_ems_pat_rls<=1;
        else if( reg_irq_sta_ems_pat_prs_cs) reg_irq_sta_ems_pat_prs<=1;
        else if(   reg_irq_sta_heat_done_cs)   reg_irq_sta_heat_done<=1;    
		else if(          reg_usm_pwr_sw_cs)          reg_usm_pwr_sw<=S_WD[0];   
        else if(reg_irq_mask_ems_doc_rls_cs)reg_irq_mask_ems_doc_rls<=S_WD[0];
        else if(reg_irq_mask_ems_doc_prs_cs)reg_irq_mask_ems_doc_prs<=S_WD[0];
        else if(reg_irq_mask_ems_pat_rls_cs)reg_irq_mask_ems_pat_rls<=S_WD[0];
        else if(reg_irq_mask_ems_pat_prs_cs)reg_irq_mask_ems_pat_prs<=S_WD[0];
        else if(  reg_irq_mask_heat_done_cs)  reg_irq_mask_heat_done<=S_WD[0];    
        else if(        reg_phs_out_trig_cs) begin
            reg_phs_out_trig <=S_WD[   `PHS_OUT_TRIG_BIT_WID-1:0];
            if(S_WD[`PHS_OUT_TRIG_BIT_WID-1:0] == 0)begin
                reg_irq_sta_heat_done <= 1; //manual stop generate done irq
                //reg_phs_out_time <= 0; //clear timer no need
            end
        end 
        else if(reg_phs_out_time_cs && (reg_phs_out_trig==0))    reg_phs_out_time[(addr-   `PHS_OUT_TIME_ADDR)*32+:32]<=S_WD;    
    end
    else if (S_RDEN) begin 
        if     (  reg_irq_sta_ems_doc_rls_cs)reg_irq_sta_ems_doc_rls<=0;
        else if(  reg_irq_sta_ems_doc_prs_cs)reg_irq_sta_ems_doc_prs<=0;
        else if(  reg_irq_sta_ems_pat_rls_cs)reg_irq_sta_ems_pat_rls<=0;
        else if(  reg_irq_sta_ems_pat_prs_cs)reg_irq_sta_ems_pat_prs<=0;
        else if(    reg_irq_sta_heat_done_cs)  reg_irq_sta_heat_done<=0;
    end

    else begin

        emermea_deb_r <= emermea_deb;

        reg_pat_ems_sta = !emermea_deb[1];
        reg_doc_ems_sta = !emermea_deb[0];

        if(emermea_deb_r[1]== 1 && emermea_deb[1]==0 )     reg_irq_sta_ems_pat_prs<= 1;
        else if(emermea_deb_r[1]== 0 && emermea_deb[1]==1) reg_irq_sta_ems_pat_rls<= 1;

        if(emermea_deb_r[0]== 1 && emermea_deb[0]==0)     reg_irq_sta_ems_doc_prs<= 1;
        else if(emermea_deb_r[0]== 0 && emermea_deb[0]==1)reg_irq_sta_ems_doc_rls<= 1;

    if(reg_usm_pwr_sw==1)begin
		if (c_state==STATE_48V_OFF)begin
			reg_usm_pwr_sw<=0; 
		end 
	end

	`define HEAT_ASCII_STRING 32'h48454154 
    if(reg_phs_out_trig==`HEAT_ASCII_STRING)begin
        if(reg_doc_ems_sta || reg_pat_ems_sta)begin 
    	    reg_phs_out_trig <= 0;
	        reg_phs_out_time <= 0;
	    end
        else begin 
            if(reg_phs_out_time>0)  begin
                reg_phs_out_time<= reg_phs_out_time-1;
                if(reg_phs_out_time==1) begin 
                    reg_phs_out_trig <= 0;
                    reg_irq_sta_heat_done <= 1;
                end
            end
        end
    end

        IRQ <=( reg_irq_sta_ems_doc_rls &&     reg_irq_mask_ems_doc_rls)||
        ( reg_irq_sta_ems_doc_prs       &&     reg_irq_mask_ems_doc_prs)||
        ( reg_irq_sta_ems_pat_rls       &&     reg_irq_mask_ems_pat_rls)||
        ( reg_irq_sta_ems_pat_prs       &&     reg_irq_mask_ems_pat_prs)||
        (   reg_irq_sta_heat_done       &&       reg_irq_mask_heat_done)||
        |(    reg_irq_sta_ac_ac_err     &        reg_irq_mask_ac_ac_err)||
        |(    reg_irq_sta_ac_dc_err     &        reg_irq_mask_ac_dc_err)||
        |(     reg_irq_sta_ac_fault     &         reg_irq_mask_ac_fault)||
        |(       reg_irq_sta_ac_aol     &           reg_irq_mask_ac_aol)||
        |(     reg_irq_sta_usm_done     &         reg_irq_mask_usm_done)||    
        |(    reg_irq_sta_usm_limit     &        reg_irq_mask_usm_limit)|| 
        |( reg_irq_sta_usm_time_out     &     reg_irq_mask_usm_time_out)|| 
		|( reg_irq_sta_usm_sample_small & reg_irq_mask_usm_sample_small)|| 
        |( reg_irq_sta_chs_phs_fpga     &     reg_irq_mask_chs_phs_fpga)||        
        |(reg_irq_sta_chs_ctrl_fpga     &    reg_irq_mask_chs_ctrl_fpga);
        end
        end

 
        wire [`PWR-1:0]                 ac_ac_err;
        wire [`PWR-1:0]                 ac_dc_err;
        wire [`PWR-1:0]                  ac_fault;


generate
for(j=0;j<`PWR;j=j+1)begin: AC_PWR_reg_write
assign ac_aol[j] =  reg_ac_pwr_av[j*32+:`AC_POWER_AV_BIT_WID]>reg_ac_pwr_al[j*32+:`AC_POWER_AL_BIT_WID];
assign ac_ac_err[j] = 0;
assign ac_dc_err[j] = 0;
assign ac_fault[j] = 0;


    always @( posedge S_CLK ) begin
        if (reg_zynq_gen_rst) begin 
            reg_ac_pwr_rst[j]           <=1;
            reg_ac_pwr_sw[j]            <=1;
            reg_irq_mask_ac_ac_err[j]   <=0;
            reg_irq_mask_ac_dc_err[j]   <=0;
            reg_irq_mask_ac_fault[j]    <=0;
            reg_irq_mask_ac_aol[j]      <=0;
            reg_irq_sta_ac_ac_err[j]    <=0;
            reg_irq_sta_ac_dc_err[j]    <=0;
            reg_irq_sta_ac_fault[j]     <=0;
            reg_irq_sta_ac_aol[j]       <=0;
            reg_ac_pwr_al[j*32+:`AC_POWER_AL_BIT_WID]            <=26'hE5EF;//40A
        end 
        else if (S_WREN) begin   
            if     (        reg_ac_pwr_rst_cs[j])        reg_ac_pwr_rst[j]<=S_WD[      `AC_POWER_RST_BIT_WID-1:0];
            else if(         reg_ac_pwr_sw_cs[j])         reg_ac_pwr_sw[j]<=S_WD[       `AC_POWER_SW_BIT_WID-1:0];
            else if(reg_irq_mask_ac_ac_err_cs[j])reg_irq_mask_ac_ac_err[j]<=S_WD[`IRQ_MASK_AC_AC_ERR_BIT_WID-1:0];
            else if(reg_irq_mask_ac_dc_err_cs[j])reg_irq_mask_ac_dc_err[j]<=S_WD[`IRQ_MASK_AC_DC_ERR_BIT_WID-1:0];
            else if( reg_irq_mask_ac_fault_cs[j]) reg_irq_mask_ac_fault[j]<=S_WD[ `IRQ_MASK_AC_FAULT_BIT_WID-1:0];
            else if(   reg_irq_mask_ac_aol_cs[j])   reg_irq_mask_ac_aol[j]<=S_WD[   `IRQ_MASK_AC_AOL_BIT_WID-1:0];  
            else if( reg_irq_sta_ac_ac_err_cs[j]) reg_irq_sta_ac_ac_err[j]<=1;
            else if( reg_irq_sta_ac_dc_err_cs[j]) reg_irq_sta_ac_dc_err[j]<=1;
            else if(  reg_irq_sta_ac_fault_cs[j])  reg_irq_sta_ac_fault[j]<=1;
            else if(    reg_irq_sta_ac_aol_cs[j])    reg_irq_sta_ac_aol[j]<=1;        
            else if(         reg_ac_pwr_al_cs[j])         reg_ac_pwr_al[j*32+:`AC_POWER_AL_BIT_WID]<=S_WD[`AC_POWER_AL_BIT_WID-1:0];
        end
        else if(S_RDEN) begin 
            if     ( reg_irq_sta_ac_ac_err_cs[j])reg_irq_sta_ac_ac_err[j]<=0;
            else if( reg_irq_sta_ac_dc_err_cs[j])reg_irq_sta_ac_dc_err[j]<=0;
            else if(  reg_irq_sta_ac_fault_cs[j]) reg_irq_sta_ac_fault[j]<=0;
            else if(    reg_irq_sta_ac_aol_cs[j])   reg_irq_sta_ac_aol[j]<=0; 
        end
        else begin
            if(ac_ac_err[j])reg_irq_sta_ac_ac_err[j]<=1;
            if(ac_dc_err[j])reg_irq_sta_ac_dc_err[j]<=1;
            if( ac_fault[j]) reg_irq_sta_ac_fault[j]<=1;
            //if(ac_pwr_cur_valid[j] && (reg_ac_pwr_av[j*32+:`AC_POWER_AV_BIT_WID]>reg_ac_pwr_al[j*32+:`AC_POWER_AL_BIT_WID]))reg_irq_sta_ac_aol[j]<=1; 
            if(ac_pwr_cur_valid[j] && ac_aol_deb[j])reg_irq_sta_ac_aol[j]<=1; 
        end // end of ~reg_zynq_gen_rst
    end // end of always S_CLK
end // end of for loop

endgenerate

wire [`USM-1:0] usm_done_pulse;
wire [`USM-1:0] usm_limit_pulse;
wire [`USM-1:0] usm_timeout_pulse;
wire [`USM-1:0] usm_run_clear_pulse;
wire [`USM-1:0] usm_sample_small_pulse;
wire [`USM-1:0] usm_move_err_pulse;
reg  [`USM-1:0] usm_start;
reg  [`USM-1:0] usm_stop;

	   
generate
for(j=0;j<`USM;j=j+1)begin: usm_reg_write
    always @( posedge S_CLK ) begin
        if (reg_zynq_gen_rst) begin 
        reg_usm_rst[j]<=0;
        reg_usm_run[j]<=0;
		reg_usm_limit_watch[j] <= 1;
        reg_usm_cfg_dir[j]<=0;       
		reg_usm_sample_intv[j*32+:32] <= 500_000;//default interval:10ms 
		reg_usm_sample_limit_val[j*32+:32] <= 1;//min pulse at interval
		reg_usm_sample_index_addr[j*16+:16] <= 1;
		reg_usm_sample_limit_en[j]<=0;
//		reg_usm_sample_read[j] <= 0;
        reg_irq_mask_usm_done[j]<=0;      
        reg_irq_mask_usm_limit[j]<=0;
        reg_irq_mask_usm_time_out[j]<=0;
		reg_irq_mask_usm_sample_small[j]<=0;
        reg_irq_sta_usm_done[j]<=0;
        reg_irq_sta_usm_limit[j]<=0;
        reg_irq_sta_usm_time_out[j]<=0;
		reg_irq_sta_usm_sample_small[j]<=0;
        end  
        else if (S_WREN) begin              
            if(                   reg_usm_rst_cs[j])              reg_usm_rst[j]<=S_WD[0];
            else if(              reg_usm_run_cs[j])begin
                 reg_usm_run[j]<=S_WD[0];
                 if(S_WD[0])usm_start[j] <= 1;
                 else              usm_stop[j] <= 1;    
            end      
        else if(              reg_usm_cfg_dir_cs[j])                 reg_usm_cfg_dir[j]<=S_WD[0];
        else if(        reg_irq_mask_usm_done_cs[j])           reg_irq_mask_usm_done[j]<=S_WD[0];      
        else if(       reg_irq_mask_usm_limit_cs[j])          reg_irq_mask_usm_limit[j]<=S_WD[0];
        else if(    reg_irq_mask_usm_time_out_cs[j])       reg_irq_mask_usm_time_out[j]<=S_WD[0];
		else if(reg_irq_mask_usm_sample_small_cs[j])   reg_irq_mask_usm_sample_small[j]<=S_WD[0];
		else if(          reg_usm_limit_watch_cs[j])             reg_usm_limit_watch[j]<=S_WD[0];
        else if(         reg_irq_sta_usm_done_cs[j])            reg_irq_sta_usm_done[j]<=1;
        else if(        reg_irq_sta_usm_limit_cs[j])           reg_irq_sta_usm_limit[j]<=1;
        else if(     reg_irq_sta_usm_time_out_cs[j])        reg_irq_sta_usm_time_out[j]<=1;
		else if( reg_irq_sta_usm_sample_small_cs[j])    reg_irq_sta_usm_sample_small[j]<=1;
		else if(          reg_usm_sample_intv_cs[j])      reg_usm_sample_intv[j*32+:32]<=S_WD;
		else if(     reg_usm_sample_limit_val_cs[j]) reg_usm_sample_limit_val[j*32+:32]<=S_WD;
		else if(    reg_usm_sample_index_addr_cs[j])reg_usm_sample_index_addr[j*16+:16]<=S_WD[15:0];
//		else if(    	  reg_usm_sample_read_cs[j])             reg_usm_sample_read[j]<= S_WD[0];
		else if(      reg_usm_sample_limit_en_cs[j])         reg_usm_sample_limit_en[j]<=S_WD[0];
        end
        else if(S_RDEN) begin
            if     (    reg_irq_sta_usm_done_cs[j])             reg_irq_sta_usm_done[j]<=0;
            else if(   reg_irq_sta_usm_limit_cs[j])            reg_irq_sta_usm_limit[j]<=0;
            else if(reg_irq_sta_usm_time_out_cs[j])         reg_irq_sta_usm_time_out[j]<=0;
			else if(reg_irq_sta_usm_sample_small_cs[j]) reg_irq_sta_usm_sample_small[j]<=0;
        end
        else begin
		    usm_start[j] <= 0;
			if ((emermea_deb_r[1]== 1 && emermea_deb[1]==0)||(emermea_deb_r[0]== 1 && emermea_deb[0]==0))
					usm_stop[j] <= 1;
			else 
					usm_stop[j] <= 0;
            if(usm_run_clear_pulse[j])                     reg_usm_run[j]<=0;
            if(     usm_done_pulse[j])            reg_irq_sta_usm_done[j]<=1;
            if(    usm_limit_pulse[j])           reg_irq_sta_usm_limit[j]<=1;
            if(  usm_timeout_pulse[j])        reg_irq_sta_usm_time_out[j]<=1;
			if( usm_move_err_pulse[j])    reg_irq_sta_usm_sample_small[j]<=1;
        end // end of ~reg_zynq_gen_rst
    end // end of always S_CLK		
end// end of for loop
endgenerate


reg  [`CHS-1:0] present_deb_r;
wire [`CHS-1:0] pf_i2c_line_err;
wire [`CHS-1:0] pf_i2c_nack_err;
wire [`CHS-1:0] cf_i2c_line_err;
wire [`CHS-1:0] cf_i2c_nack_err;
generate
for(j=0;j<`CHS;j=j+1)begin: chassis_reg_write
assign reg_amp_pf_done[j] = 0;
assign reg_amp_cf_done[j] = 0;  
    always @( posedge S_CLK ) begin
        if (reg_zynq_gen_rst) begin 
                        reg_amp_cf_rst[j]<=1;
                        reg_amp_pf_rst[j]<=1;
                        reg_pf_i2c_rst[j]<=1;
                      reg_pf_i2c_start[j]<=0;                    
                        reg_cf_i2c_rst[j]<=1;
                      reg_cf_i2c_start[j]<=0;  
             reg_irq_mask_chs_phs_fpga[j]<=0;
            reg_irq_mask_chs_ctrl_fpga[j]<=0;
        //    reg_irq_sta_chs_phs_fpga[j]<=0;
       //    reg_irq_sta_chs_ctrl_fpga[j]<=0;
                         present_deb_r[j]<=1;
        end 
        else if(S_WREN) begin
            if     (          reg_pf_i2c_start_cs[j])          reg_pf_i2c_start[j]<=1;            
            else if(          reg_cf_i2c_start_cs[j])          reg_cf_i2c_start[j]<=1;    
            else if(            reg_pf_i2c_rst_cs[j])            reg_pf_i2c_rst[j]<=S_WD[0];
            else if(            reg_cf_i2c_rst_cs[j])            reg_cf_i2c_rst[j]<=S_WD[0];    
            else if(            reg_amp_cf_rst_cs[j])            reg_amp_cf_rst[j]<=S_WD[0];          
            else if(            reg_amp_pf_rst_cs[j])            reg_amp_pf_rst[j]<=S_WD[0];                  
            else if( reg_irq_mask_chs_phs_fpga_cs[j]) reg_irq_mask_chs_phs_fpga[j]<=S_WD[0];                   
            else if(reg_irq_mask_chs_ctrl_fpga_cs[j])reg_irq_mask_chs_ctrl_fpga[j]<=S_WD[0];   
         //   else if(  reg_irq_sta_chs_phs_fpga_cs[j])  reg_irq_sta_chs_phs_fpga[j]<=1;
         //   else if( reg_irq_sta_chs_ctrl_fpga_cs[j]) reg_irq_sta_chs_ctrl_fpga[j]<=1;       
        end
        else if(S_RDEN) begin 
		//	if     ( reg_irq_sta_chs_phs_fpga_cs[j]) reg_irq_sta_chs_phs_fpga[j]<=0;
        //  else if(reg_irq_sta_chs_ctrl_fpga_cs[j])reg_irq_sta_chs_ctrl_fpga[j]<=0; 
				if(reg_pf_i2c_line_err_cs[j])reg_pf_i2c_line_err[j]<=0; 
            else if(reg_cf_i2c_line_err_cs[j])reg_cf_i2c_line_err[j]<=0; 
            else if(reg_pf_i2c_nack_err_cs[j])reg_pf_i2c_nack_err[j]<=0; 
            else if(reg_cf_i2c_nack_err_cs[j])reg_cf_i2c_nack_err[j]<=0; 
        end
        else begin      
            reg_pf_i2c_start[j] <=0;   
            reg_cf_i2c_start[j] <=0;
            present_deb_r[j] <=present_deb[j];            
            if(pf_i2c_line_err[j]) reg_pf_i2c_line_err[j] <= 1;
            if(pf_i2c_nack_err[j]) reg_pf_i2c_nack_err[j] <= 1; 
            if(cf_i2c_line_err[j]) reg_cf_i2c_line_err[j] <= 1;
            if(cf_i2c_nack_err[j]) reg_cf_i2c_nack_err[j] <= 1;               
         //   if( pha_irq_deb[j] && (c_state!=STATE_48V_ON))reg_irq_sta_chs_phs_fpga[j]	<=1;
        //    if(ctrl_irq_deb[j] && (c_state!=STATE_48V_ON))reg_irq_sta_chs_ctrl_fpga[j]	<=1;
        end // end of ~reg_zynq_gen_rst
    end // end of always S_CLK
end // end of for loop
endgenerate


reg	[31:0]	s_cnt          ;
reg [1:0]	c_state        ;
reg [1:0]	n_state        ;
wire 		s_48V_off      ; //48V PRESS
wire 		s_48V_on  	   ; //48V RELEASE

localparam STATE_STEADY     = 2'd0;
localparam STATE_48V_OFF    = 2'd1;  
localparam STATE_48V_ON     = 2'd2;

always@(posedge S_CLK)begin
        if(reg_zynq_gen_rst)   	  c_state <= STATE_STEADY; 
			else      			  c_state <= n_state;
end

always@(*)begin
	if(reg_zynq_gen_rst)					n_state <= STATE_STEADY;
     else begin
		case (c_state)
			STATE_STEADY:
						if(s_48V_off) 		n_state <= STATE_48V_OFF;
						else 				n_state <= STATE_STEADY;
			STATE_48V_OFF:
						if(s_48V_on)		n_state <= STATE_48V_ON;
						else                n_state <= STATE_48V_OFF;
			STATE_48V_ON:
						if(s_configdone)	n_state <= STATE_STEADY;
						else				n_state <= STATE_48V_ON;
			default:    					n_state <= STATE_STEADY;
		endcase
	 end
end

	assign s_48V_off	=((!reg_ac_pwr_sw[0])||  reg_ac_pwr_sta_ac[0] ||  reg_ac_pwr_sta_dc[0] || !reg_ac_pwr_sta_ft[0] ||  reg_irq_sta_ac_aol  ||   reg_irq_sta_ems_doc_prs ||  reg_irq_sta_ems_pat_prs);
	assign s_48V_on		=(( reg_ac_pwr_sw[0])&& !reg_ac_pwr_sta_ac[0] && !reg_ac_pwr_sta_dc[0] &&  reg_ac_pwr_sta_ft[0] && !reg_irq_sta_ac_aol) && (!reg_irq_sta_ems_doc_rls || !reg_irq_sta_ems_pat_rls);	
	assign s_configdone =(s_cnt==(`FPGA_SYS_CLK_FREQ<<1) -1);


always@(posedge S_CLK)begin
	if(reg_zynq_gen_rst) s_cnt <=0;
		else if(c_state==STATE_48V_ON && s_48V_on)begin
				if(s_cnt==(`FPGA_SYS_CLK_FREQ<<1)-1)
					s_cnt <=0;
				else 
					s_cnt <=s_cnt+1;
		end
		else begin
					s_cnt <=0;
		end
end	

//ctrl_fpga_irq	
generate
for(j=0;j<`CHS;j=j+1)begin:	chs_ctrl_fpga_irq
	always @( posedge S_CLK ) begin
		if (reg_zynq_gen_rst)							   		reg_irq_sta_chs_ctrl_fpga[j]<=0;
		else if(c_state==STATE_48V_ON ||c_state==STATE_48V_OFF )reg_irq_sta_chs_ctrl_fpga[j]<=0;
		else if(S_WREN && reg_irq_sta_chs_ctrl_fpga_cs[j]) 		reg_irq_sta_chs_ctrl_fpga[j]<=1; 
		else if(S_RDEN && reg_irq_sta_chs_ctrl_fpga_cs[j]) 		reg_irq_sta_chs_ctrl_fpga[j]<=0;  
		else if(ctrl_irq_deb[j])						   		reg_irq_sta_chs_ctrl_fpga[j]<=1;
		else											   		reg_irq_sta_chs_ctrl_fpga[j]<=reg_irq_sta_chs_ctrl_fpga[j];
	end
end
endgenerate

//phs_fpga_irq
generate
for(j=0;j<`CHS;j=j+1)begin:	chs_phs_fpga_irq
	always @( posedge S_CLK ) begin
		if (reg_zynq_gen_rst)							   		reg_irq_sta_chs_phs_fpga[j]<=0;
		else if(c_state==STATE_48V_ON ||c_state==STATE_48V_OFF)	reg_irq_sta_chs_phs_fpga[j]<=0;
		else if(S_WREN && reg_irq_sta_chs_phs_fpga_cs[j])  		reg_irq_sta_chs_phs_fpga[j]<=1; 
		else if(S_RDEN && reg_irq_sta_chs_phs_fpga_cs[j])  		reg_irq_sta_chs_phs_fpga[j]<=0;  
		else if(pha_irq_deb[j])						  	   		reg_irq_sta_chs_phs_fpga[j]<=1;
		else											   		reg_irq_sta_chs_phs_fpga[j]<=reg_irq_sta_chs_phs_fpga[j];
	end
end
endgenerate

    always @( posedge S_CLK ) begin
        if (reg_zynq_gen_rst) begin 
            reg_pf_i2c_wr_len<=0;
            reg_pf_i2c_rd_len<=0;
            reg_cf_i2c_wr_len<=0;
            reg_cf_i2c_rd_len<=0;
            reg_pf_i2c_wr_buf<=0;           
            reg_cf_i2c_wr_buf<=0;
             reg_usm_cfg_freq<=0;
            reg_usm_cfg_pulse<=0;
        end 
        else if(S_WREN) begin
                 if(reg_pf_i2c_wr_len_cs)reg_pf_i2c_wr_len[(addr-`PF_I2C_WR_LEN_ADDR)*32+:`PF_I2C_WR_LEN_BIT_WID]<=S_WD;
            else if(reg_pf_i2c_rd_len_cs)reg_pf_i2c_rd_len[(addr-`PF_I2C_RD_LEN_ADDR)*32+:`PF_I2C_RD_LEN_BIT_WID]<=S_WD;
            else if(reg_cf_i2c_wr_len_cs)reg_cf_i2c_wr_len[(addr-`CF_I2C_WR_LEN_ADDR)*32+:`CF_I2C_WR_LEN_BIT_WID]<=S_WD;
            else if(reg_cf_i2c_rd_len_cs)reg_cf_i2c_rd_len[(addr-`CF_I2C_RD_LEN_ADDR)*32+:`CF_I2C_RD_LEN_BIT_WID]<=S_WD; 
            else if( reg_usm_cfg_freq_cs) reg_usm_cfg_freq[(addr- `USM_CFG_FREQ_ADDR)*32+: `USM_CFG_FREQ_BIT_WID]<=S_WD;
            else if(reg_usm_cfg_pulse_cs)reg_usm_cfg_pulse[(addr-`USM_CFG_PULSE_ADDR)*32+:`USM_CFG_PULSE_BIT_WID]<=S_WD;
            else if(reg_pf_i2c_wr_buf_cs)reg_pf_i2c_wr_buf[(addr-`PF_I2C_WR_BUF_ADDR)*32+:32]<=S_WD;           
            else if(reg_cf_i2c_wr_buf_cs)reg_cf_i2c_wr_buf[(addr-`CF_I2C_WR_BUF_ADDR)*32+:32]<=S_WD;
        end
            
    end

////////////////////////////////////////////////////////////////////////////////////

i2cMaster #(
    .SYS_FREQ       (`FPGA_SYS_CLK_FREQ       ),
    .I2C_FREQ       (10_000                   ),
    .MUTEX_ENABLE   (1                        ),
    .WR_LEN_BIT_WID (`CLK_I2C_WR_LEN_BIT_WID  ),
    .WR_BUF_BYTE_NUM(`CLK_I2C_WR_BUF_BYTE_WID ),
    .RD_LEN_BIT_WID (`CLK_I2C_RD_LEN_BIT_WID  ),
    .RD_BUF_BYTE_NUM(`CLK_I2C_RD_BUF_BYTE_WID ))
clk_i2c_master_inst(    
    .rst     (reg_clk_i2c_rst                                ),
    .clk     (S_CLK                                          ),
    .mutexSta(reg_clk_i2c_mutex                              ),
    .mutexGet(S_RDEN && reg_clk_i2c_mutex_cs                 ),
    .addr    (reg_clk_i2c_wr_buf[7:1]                        ),
    .wrBuf   (reg_clk_i2c_wr_buf[`CLK_I2C_WR_BUF_BIT_WID-1:8]),
    .wrLen   (reg_clk_i2c_wr_len-1                             ),
    .rdBuf   (reg_clk_i2c_rd_buf                             ),
    .rdLen   (reg_clk_i2c_rd_len                             ),
  //.start   (reg_clk_i2c_start||p1s_once                    ),
    .start   (reg_clk_i2c_start                              ),
    .busy    (reg_clk_i2c_busy                               ),
    .done    (                                               ),
    .errLine (clk_i2c_line_err                               ),
    .errNack (clk_i2c_nack_err                               ),
    .sclIn   (clk_scl_in                                     ),
    .sdaIn   (clk_sda_in                                     ),
    .sclOut  (clk_scl_out                                    ),
    .sdaOut  (clk_sda_out                                    ),
    .debug   (                                               )
);   

i2cMaster #(
    .SYS_FREQ       (`FPGA_SYS_CLK_FREQ       ),
    .I2C_FREQ       (10_000                   ),
    .MUTEX_ENABLE   (1                        ),
    .WR_LEN_BIT_WID (`RTC_I2C_WR_LEN_BIT_WID  ),
    .WR_BUF_BYTE_NUM(`RTC_I2C_WR_BUF_BYTE_WID ),
    .RD_LEN_BIT_WID (`RTC_I2C_RD_LEN_BIT_WID  ),
    .RD_BUF_BYTE_NUM(`RTC_I2C_RD_BUF_BYTE_WID ))
rtc_i2c_master_inst(  
        .rst     (reg_rtc_i2c_rst                                ),
        .clk     (S_CLK                                          ),
        .mutexSta(reg_rtc_i2c_mutex                              ),
        .mutexGet(S_RDEN && reg_rtc_i2c_mutex_cs                 ),
        .addr    (reg_rtc_i2c_wr_buf[7:1]                        ),
        .wrBuf   (reg_rtc_i2c_wr_buf[`RTC_I2C_WR_BUF_BIT_WID-1:8]),
        .wrLen   (reg_rtc_i2c_wr_len-1                           ),
        .rdBuf   (reg_rtc_i2c_rd_buf                             ),
        .rdLen   (reg_rtc_i2c_rd_len                             ),
        .start   (reg_rtc_i2c_start                              ),
        .busy    (reg_rtc_i2c_busy                               ),
        .done    (                                               ),
        .errLine (rtc_i2c_line_err                               ),
        .errNack (rtc_i2c_nack_err                               ),
        .sclIn   (rtc_scl_in                                     ),
        .sdaIn   (rtc_sda_in                                     ),
        .sclOut  (rtc_scl_out                                    ),
        .sdaOut  (rtc_sda_out                                    ),
        .debug   (                                               )
    );   

generate
for(j=0;j<`CHS;j=j+1)begin: i2c_master_inst 
    assign reg_amp_pres[j]  = present_deb[j];
    assign CTRL_PROG_B[j]   = reg_amp_cf_rst[j];
    assign PHA_PROG_B[j]    = reg_amp_pf_rst[j];    
    i2cMaster #(
        .SYS_FREQ       (`FPGA_SYS_CLK_FREQ      ),
        .I2C_FREQ       (100_000                 ),
        .MUTEX_ENABLE   (1                       ),
        .WR_LEN_BIT_WID (`PF_I2C_WR_LEN_BIT_WID  ),
        .WR_BUF_BYTE_NUM(`PF_I2C_WR_BUF_BYTE_WID ),
        .RD_LEN_BIT_WID (`PF_I2C_RD_LEN_BIT_WID  ),
        .RD_BUF_BYTE_NUM(`PF_I2C_RD_BUF_BYTE_WID ))
    pf_i2c_master_inst(
        .rst     (reg_pf_i2c_rst[j]                                                     ),
        .clk     (S_CLK                                                                 ),
        .mutexSta(reg_pf_i2c_mutex[j]                                                   ),
        .mutexGet(S_RDEN && reg_pf_i2c_mutex_cs[j]                                      ),
        .addr    (reg_pf_i2c_wr_buf[(j*`PF_I2C_WR_BUF_SIZE*32+1)+:7]                       ),
        .wrBuf   (reg_pf_i2c_wr_buf[(j*`PF_I2C_WR_BUF_SIZE*32+8)+:(`PF_I2C_WR_BUF_BIT_WID-8)]),
        .wrLen   ((reg_pf_i2c_wr_len[(j*32                      )+:`PF_I2C_WR_LEN_BIT_WID])-1),
        .rdBuf   (reg_pf_i2c_rd_buf[(j*`PF_I2C_RD_BUF_SIZE*32  )+:`PF_I2C_RD_BUF_BIT_WID]),
        .rdLen   (reg_pf_i2c_rd_len[(j*32                      )+:`PF_I2C_RD_LEN_BIT_WID]),
        .start   (reg_pf_i2c_start[j]                                                   ),
        .busy    (reg_pf_i2c_busy[j]                                                    ),
        .done    (                                                                      ),
        .errLine (pf_i2c_line_err[j]                                                    ),
        .errNack (pf_i2c_nack_err[j]                                                    ),
        .sclIn   (pha_scl_in[j]                                                        ),
        .sdaIn   (pha_sda_in[j]                                                        ),
        .sclOut  (pha_scl_out[j]                                                        ),
        .sdaOut  (pha_sda_out[j]                                                        ),
        .debug   (reg_zynq_gen_sn[(0+j*8)+:8]                                           )
    );
    
    i2cMaster #(
        .SYS_FREQ       (`FPGA_SYS_CLK_FREQ      ),
        .I2C_FREQ       (100_000                 ),
        .MUTEX_ENABLE   (1                       ),
        .WR_LEN_BIT_WID (`CF_I2C_WR_LEN_BIT_WID  ),
        .WR_BUF_BYTE_NUM(`CF_I2C_WR_BUF_BYTE_WID ),
        .RD_LEN_BIT_WID (`CF_I2C_RD_LEN_BIT_WID  ),
        .RD_BUF_BYTE_NUM(`CF_I2C_RD_BUF_BYTE_WID ))
    cf_i2c_master_inst(
        .rst     (reg_cf_i2c_rst[j]                                                     ),
        .clk     (S_CLK                                                                 ),
        .mutexSta(reg_cf_i2c_mutex[j]                                                   ),
        .mutexGet(S_RDEN && reg_cf_i2c_mutex_cs[j]                                      ),
        .addr    (reg_cf_i2c_wr_buf[(j*`CF_I2C_WR_BUF_SIZE*32+1)+:7]                       ),
        .wrBuf   (reg_cf_i2c_wr_buf[(j*`CF_I2C_WR_BUF_SIZE*32+8)+:(`CF_I2C_WR_BUF_BIT_WID-8)]),
        .wrLen   ((reg_cf_i2c_wr_len[(j*32                      )+:`CF_I2C_WR_LEN_BIT_WID] )-1 ),
        .rdBuf   (reg_cf_i2c_rd_buf[(j*`CF_I2C_RD_BUF_SIZE*32  )+:`CF_I2C_RD_BUF_BIT_WID]   ),
        .rdLen   (reg_cf_i2c_rd_len[(j*32                      )+:`CF_I2C_RD_LEN_BIT_WID]                       ),
        .start   (reg_cf_i2c_start[j]                                                   ),
        .busy    (reg_cf_i2c_busy[j]                                                    ),
        .done    (                                                                      ),
        .errLine (cf_i2c_line_err[j]                                                    ),
        .errNack (cf_i2c_nack_err[j]                                                    ),
        .sclIn   (ctrl_scl_in[j]                                                         ),
        .sdaIn   (ctrl_sda_in[j]                                                         ),
        .sclOut  (ctrl_scl_out[j]                                                       ),
        .sdaOut  (ctrl_sda_out[j]                                                       ),
        .debug   (reg_zynq_gen_sn[(32+j*8)+:8]                                          )
    );
end
endgenerate

assign TRIGGER   	  = (reg_phs_out_trig==`HEAT_ASCII_STRING);
assign PL_LED[0] 	  = reg_doc_ems_sta;
assign PL_LED[1] 	  = reg_pat_ems_sta;
assign PL_LED[2] 	  = TRIGGER;
assign PL_LED[3] 	  = IRQ;
assign reg_prob_pres  = 0; 

wire      usm_pwr_sta;
reg       usm_pwr_sta_r;
reg       usm_pwr_sta_r_r;
wire	  usm_pwr_sta_posedge;
reg 	  usm_pwr_sta_posedge_keep;
reg [19:0]posedge_keep_cnt;

assign USM_PWR_SW     = reg_usm_pwr_sw;
assign usm_pwr_sta    = (c_state!=STATE_48V_OFF) && reg_usm_pwr_sw;  // both soft_switch and 48V determine the usm power sta

always @( posedge S_CLK ) begin
    if (reg_zynq_gen_rst)	usm_pwr_sta_r <= 0;
	else 					usm_pwr_sta_r <= usm_pwr_sta;
end
always @( posedge S_CLK ) begin
    if (reg_zynq_gen_rst)	usm_pwr_sta_r_r <= 0;
	else 					usm_pwr_sta_r_r <= usm_pwr_sta_r;
end


assign usm_pwr_sta_posedge=!usm_pwr_sta_r_r&&usm_pwr_sta_r;

always@(posedge S_CLK)begin
	if(reg_zynq_gen_rst) 					  					 usm_pwr_sta_posedge_keep <=0;
	else if(usm_pwr_sta_posedge)  								 usm_pwr_sta_posedge_keep <=1;
	else if(usm_pwr_sta_posedge_keep&&posedge_keep_cnt == 399999)usm_pwr_sta_posedge_keep <=0;
end

always@(posedge S_CLK)begin
	if(reg_zynq_gen_rst) 										posedge_keep_cnt <=0;
	else if(usm_pwr_sta_posedge_keep)
		if(posedge_keep_cnt == 399999 ||usm_pwr_sta_posedge)	posedge_keep_cnt <=0;
		else 													posedge_keep_cnt <=posedge_keep_cnt+1;
	else 														posedge_keep_cnt <=0;
end


wire [`USM-1:0] s_rd_delay;
generate
for(j=0;j<`USM;j=j+1)begin: usm_install
always@(posedge S_CLK ) begin
	if (reg_zynq_gen_rst) 				 				   reg_usm_limit_sta[j] <=0;
	else if(usm_pwr_sta_posedge||usm_pwr_sta_posedge_keep) reg_usm_limit_sta[j] <=0;     			//USM power ON , before usm_limit_deb has a negedge(the period is about 1.2ms), usm_pwr_sta will have a posedge.     
	else 								                   reg_usm_limit_sta[j] <= usm_pwr_sta_r&&usm_limit_deb[j];// when USM power off, usm_limit_deb will have a posedge, but it is not a real limit signal.
end

    usm u_usm(
        .i_clk                        (S_CLK                                            ),
        .i_rst_n                      (~reg_usm_rst[j]                                  ),  
        .i_coder_A                    (usm_out_a_deb[j]&&(!usm_alarm_a_deb[j]   )       ),
        .i_coder_B                    (usm_out_b_deb[j]&&(!usm_alarm_b_deb[j]   )       ),
        .O_SIN_P                      (USM_DRIVE_A_P[j]                                 ),
        .O_SIN_N                      (USM_DRIVE_A_N[j]                                 ),
        .O_COS_P                      (USM_DRIVE_B_P[j]                                 ),
        .O_COS_N                      (USM_DRIVE_B_N[j]                                 ),
        .O_PWR_EN                     (USM_POWERCTRL[j]                                 ),
        .i_freq_word                  (  reg_usm_cfg_freq[j*32+:  `USM_CFG_FREQ_BIT_WID]),
        .i_delta_pulse                ( reg_usm_cfg_pulse[j*32+: `USM_CFG_PULSE_BIT_WID]),
        .o_move_pulse                 (reg_usm_move_pulse[j*32+:`USM_MOVE_PULSE_BIT_WID]),  
        .i_limit_sta                  (reg_usm_limit_sta[j]                             ),
        .i_limit_watch                (reg_usm_limit_watch[j]                           ),
        .i_start                      (usm_start[j]                                     ),
        .i_stop                       (usm_stop[j]                                      ),
		.i_sample_small_pulse         (usm_sample_small_pulse[j]                        ),
		.i_sample_limit_en            (reg_usm_sample_limit_en[j]                       ),
		.o_irq_usm_sample_small_pulse (usm_move_err_pulse[j]                            ),
        .o_irq_usm_done_pulse         (usm_done_pulse[j]                                ),
        .o_irq_usm_limit_pulse        (usm_limit_pulse[j]                               ),
        .o_irq_usm_time_out_pulse     (usm_timeout_pulse[j]                             ),
        .o_enter_idle_pulse           (usm_run_clear_pulse[j]                           ));  
		
	usm_sample #( 
			.BRAM_DEPTH	(1024	))
	u_usm_sample(
		.clk						  (S_CLK						       ),	 
		.rst						  (reg_usm_rst[j] 				       ), 
		.i_reg_usm_run				  (reg_usm_run[j]				       ), 
		.i_reg_usm_sample_read        (reg_usm_sample_read[j]              ), 
		.i_reg_usm_sample_intv        (reg_usm_sample_intv       [j*32+:32]),
		.i_reg_usm_move_dir           (reg_usm_cfg_pulse       [(j+1)*32-1]),
		.i_reg_usm_move_pulse         (reg_usm_move_pulse        [j*32+:32]),
		.o_reg_usm_sample_data		  (reg_usm_sample_data       [j*32+:32]), 
		.i_reg_usm_sample_limit_val   (reg_usm_sample_limit_val  [j*32+:32]),
		.i_reg_usm_sample_index_addr  (reg_usm_sample_index_addr [j*16+:16]),
		.o_reg_usm_sample_depth_count (reg_usm_sample_depth_count[j*16+:16]),
		.o_reg_usm_sample_vald        (reg_usm_sample_vald[j]              ),
		.s_rd_delay                   (s_rd_delay[j]                       ),
		.o_usm_sample_small_pulse	  (usm_sample_small_pulse[j]		   )
		);			
	
	always @( posedge S_CLK )
        if (reg_zynq_gen_rst)  						   reg_usm_sample_read[j] <= 0;
		else if(S_WREN&&reg_usm_sample_read_cs[j])     reg_usm_sample_read[j] <= S_WD[0];
		else if(reg_usm_sample_vald[j]&&s_rd_delay[j]) reg_usm_sample_read[j] <= 0;	
		
end
endgenerate


dna  #(
    .DNA_PORT_START_CNT  (10 ),
    .DNA_PORT_BYTE_WIDTH (`ZYNQ_GEN_DNA_BIT_WID))
u_dna_master(
    .clk(S_CLK),
    .rst(S_RST),
    .dna_out(reg_zynq_gen_dna),
    .dna_valid());  

generate
for(j=0;j<`PWR;j=j+1)begin: ac_pwr_current_measure_inst

assign        PWR_INHIBIT[j]= reg_ac_pwr_sw[j];
assign  reg_ac_pwr_sta_ac[j]= pwr_ac_ok_deb[j];
assign  reg_ac_pwr_sta_dc[j]= pwr_dc_ok_deb[j];
assign  reg_ac_pwr_sta_ft[j]= pwr_fault_deb[j];


cur_meas #(
        .SYS_FREQ       (`FPGA_SYS_CLK_FREQ      ),
        .I2C_FREQ       (10_000                  ))
u_cur_meas(
        .i_clk     (S_CLK                                    ),
        .i_rst_n   (!reg_zynq_gen_rst                        ),
        .o_adc     (reg_ac_pwr_av[(j*32)+:`AC_POWER_AV_BIT_WID]),
        .o_adc_vld (ac_pwr_cur_valid[j]                      ),
        .scl_in    (pwr_scl_in[ j]                           ),
        .sda_in    (pwr_sda_in[ j]                           ),
        .scl_out   (pwr_scl_out[j]                           ),
        .sda_out   (pwr_sda_out[j]                           ));
end        
endgenerate

        
endmodule

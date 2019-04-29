//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Thu Apr 18 18:38:46 2019
//Host        : SDHW-GL running 64-bit major release  (build 9200)
//Command     : generate_target CPU_wrapper.bd
//Design      : CPU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CPU_wrapper
   (CLOCK_SCL,
    CLOCK_SDA,
    CTRL_IRQ,
    CTRL_PROG_B,
    CTRL_SCL,
    CTRL_SDA,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    EMERMEA,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    PHA_IRQ,
    PHA_PROG_B,
    PHA_SCL,
    PHA_SDA,
    PL_LED,
    PL_SWITCH,
    PL_UNUSED,
    PRESENT,
    PWR_AC_OK,
    PWR_DC_OK,
    PWR_FAULT,
    PWR_INHIBIT,
    PWR_SCL,
    PWR_SDA,
    RTC_SCL,
    RTC_SDA,
    TRIGGER,
    USM_ALARM_A,
    USM_ALARM_B,
    USM_ALARM_D,
    USM_ALARM_Z,
    USM_DRIVE_A_N,
    USM_DRIVE_A_P,
    USM_DRIVE_B_N,
    USM_DRIVE_B_P,
    USM_LIMIT,
    USM_OUT_A,
    USM_OUT_B,
    USM_OUT_Z,
    USM_POWERCTRL,
    USM_PWR_SW,
    XDCR_PRESENT,
    XDCR_SCL,
    XDCR_SDA);
  inout CLOCK_SCL;
  inout CLOCK_SDA;
  input [1:0]CTRL_IRQ;
  output [1:0]CTRL_PROG_B;
  inout [1:0]CTRL_SCL;
  inout [1:0]CTRL_SDA;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  input [1:0]EMERMEA;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [1:0]PHA_IRQ;
  output [1:0]PHA_PROG_B;
  inout [1:0]PHA_SCL;
  inout [1:0]PHA_SDA;
  output [3:0]PL_LED;
  input [4:0]PL_SWITCH;
  input [3:0]PL_UNUSED;
  input [1:0]PRESENT;
  input [1:0]PWR_AC_OK;
  input [1:0]PWR_DC_OK;
  input [1:0]PWR_FAULT;
  output [1:0]PWR_INHIBIT;
  inout [1:0]PWR_SCL;
  inout [1:0]PWR_SDA;
  inout RTC_SCL;
  inout RTC_SDA;
  output TRIGGER;
  input [3:0]USM_ALARM_A;
  input [3:0]USM_ALARM_B;
  input [3:0]USM_ALARM_D;
  input [3:0]USM_ALARM_Z;
  output [3:0]USM_DRIVE_A_N;
  output [3:0]USM_DRIVE_A_P;
  output [3:0]USM_DRIVE_B_N;
  output [3:0]USM_DRIVE_B_P;
  input [3:0]USM_LIMIT;
  input [3:0]USM_OUT_A;
  input [3:0]USM_OUT_B;
  input [3:0]USM_OUT_Z;
  output [3:0]USM_POWERCTRL;
  output USM_PWR_SW;
  input XDCR_PRESENT;
  input XDCR_SCL;
  input XDCR_SDA;

  wire CLOCK_SCL;
  wire CLOCK_SDA;
  wire [1:0]CTRL_IRQ;
  wire [1:0]CTRL_PROG_B;
  wire [1:0]CTRL_SCL;
  wire [1:0]CTRL_SDA;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire [1:0]EMERMEA;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [1:0]PHA_IRQ;
  wire [1:0]PHA_PROG_B;
  wire [1:0]PHA_SCL;
  wire [1:0]PHA_SDA;
  wire [3:0]PL_LED;
  wire [4:0]PL_SWITCH;
  wire [3:0]PL_UNUSED;
  wire [1:0]PRESENT;
  wire [1:0]PWR_AC_OK;
  wire [1:0]PWR_DC_OK;
  wire [1:0]PWR_FAULT;
  wire [1:0]PWR_INHIBIT;
  wire [1:0]PWR_SCL;
  wire [1:0]PWR_SDA;
  wire RTC_SCL;
  wire RTC_SDA;
  wire TRIGGER;
  wire [3:0]USM_ALARM_A;
  wire [3:0]USM_ALARM_B;
  wire [3:0]USM_ALARM_D;
  wire [3:0]USM_ALARM_Z;
  wire [3:0]USM_DRIVE_A_N;
  wire [3:0]USM_DRIVE_A_P;
  wire [3:0]USM_DRIVE_B_N;
  wire [3:0]USM_DRIVE_B_P;
  wire [3:0]USM_LIMIT;
  wire [3:0]USM_OUT_A;
  wire [3:0]USM_OUT_B;
  wire [3:0]USM_OUT_Z;
  wire [3:0]USM_POWERCTRL;
  wire USM_PWR_SW;
  wire XDCR_PRESENT;
  wire XDCR_SCL;
  wire XDCR_SDA;

  CPU CPU_i
       (.CLOCK_SCL(CLOCK_SCL),
        .CLOCK_SDA(CLOCK_SDA),
        .CTRL_IRQ(CTRL_IRQ),
        .CTRL_PROG_B(CTRL_PROG_B),
        .CTRL_SCL(CTRL_SCL),
        .CTRL_SDA(CTRL_SDA),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .EMERMEA(EMERMEA),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .PHA_IRQ(PHA_IRQ),
        .PHA_PROG_B(PHA_PROG_B),
        .PHA_SCL(PHA_SCL),
        .PHA_SDA(PHA_SDA),
        .PL_LED(PL_LED),
        .PL_SWITCH(PL_SWITCH),
        .PL_UNUSED(PL_UNUSED),
        .PRESENT(PRESENT),
        .PWR_AC_OK(PWR_AC_OK),
        .PWR_DC_OK(PWR_DC_OK),
        .PWR_FAULT(PWR_FAULT),
        .PWR_INHIBIT(PWR_INHIBIT),
        .PWR_SCL(PWR_SCL),
        .PWR_SDA(PWR_SDA),
        .RTC_SCL(RTC_SCL),
        .RTC_SDA(RTC_SDA),
        .TRIGGER(TRIGGER),
        .USM_ALARM_A(USM_ALARM_A),
        .USM_ALARM_B(USM_ALARM_B),
        .USM_ALARM_D(USM_ALARM_D),
        .USM_ALARM_Z(USM_ALARM_Z),
        .USM_DRIVE_A_N(USM_DRIVE_A_N),
        .USM_DRIVE_A_P(USM_DRIVE_A_P),
        .USM_DRIVE_B_N(USM_DRIVE_B_N),
        .USM_DRIVE_B_P(USM_DRIVE_B_P),
        .USM_LIMIT(USM_LIMIT),
        .USM_OUT_A(USM_OUT_A),
        .USM_OUT_B(USM_OUT_B),
        .USM_OUT_Z(USM_OUT_Z),
        .USM_POWERCTRL(USM_POWERCTRL),
        .USM_PWR_SW(USM_PWR_SW),
        .XDCR_PRESENT(XDCR_PRESENT),
        .XDCR_SCL(XDCR_SCL),
        .XDCR_SDA(XDCR_SDA));
endmodule

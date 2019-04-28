// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Mar 26 17:16:41 2019
// Host        : SDHW-GL running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/admin/Desktop/debounce/debounce/debounce.sim/sim_1/impl/timing/xsim/top_test_time_impl.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tftg256-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module holdup_cnt
   (Q,
    clk_IBUF_BUFG,
    rst_IBUF,
    usm_limit_deb_OBUF);
  output Q;
  input clk_IBUF_BUFG;
  input rst_IBUF;
  input usm_limit_deb_OBUF;

  wire Q;
  wire clk_IBUF_BUFG;
  wire \cnt[0]_i_10_n_0 ;
  wire \cnt[0]_i_11_n_0 ;
  wire \cnt[0]_i_1__0_n_0 ;
  wire \cnt[0]_i_3__0_n_0 ;
  wire \cnt[0]_i_4_n_0 ;
  wire \cnt[0]_i_5_n_0 ;
  wire \cnt[0]_i_6_n_0 ;
  wire \cnt[0]_i_7_n_0 ;
  wire \cnt[0]_i_8_n_0 ;
  wire \cnt[0]_i_9_n_0 ;
  wire [31:0]cnt_reg;
  wire \cnt_reg[0]_i_2_n_0 ;
  wire \cnt_reg[0]_i_2_n_4 ;
  wire \cnt_reg[0]_i_2_n_5 ;
  wire \cnt_reg[0]_i_2_n_6 ;
  wire \cnt_reg[0]_i_2_n_7 ;
  wire \cnt_reg[12]_i_1_n_0 ;
  wire \cnt_reg[12]_i_1_n_4 ;
  wire \cnt_reg[12]_i_1_n_5 ;
  wire \cnt_reg[12]_i_1_n_6 ;
  wire \cnt_reg[12]_i_1_n_7 ;
  wire \cnt_reg[16]_i_1_n_0 ;
  wire \cnt_reg[16]_i_1_n_4 ;
  wire \cnt_reg[16]_i_1_n_5 ;
  wire \cnt_reg[16]_i_1_n_6 ;
  wire \cnt_reg[16]_i_1_n_7 ;
  wire \cnt_reg[20]_i_1_n_0 ;
  wire \cnt_reg[20]_i_1_n_4 ;
  wire \cnt_reg[20]_i_1_n_5 ;
  wire \cnt_reg[20]_i_1_n_6 ;
  wire \cnt_reg[20]_i_1_n_7 ;
  wire \cnt_reg[24]_i_1_n_0 ;
  wire \cnt_reg[24]_i_1_n_4 ;
  wire \cnt_reg[24]_i_1_n_5 ;
  wire \cnt_reg[24]_i_1_n_6 ;
  wire \cnt_reg[24]_i_1_n_7 ;
  wire \cnt_reg[28]_i_1_n_4 ;
  wire \cnt_reg[28]_i_1_n_5 ;
  wire \cnt_reg[28]_i_1_n_6 ;
  wire \cnt_reg[28]_i_1_n_7 ;
  wire \cnt_reg[4]_i_1_n_0 ;
  wire \cnt_reg[4]_i_1_n_4 ;
  wire \cnt_reg[4]_i_1_n_5 ;
  wire \cnt_reg[4]_i_1_n_6 ;
  wire \cnt_reg[4]_i_1_n_7 ;
  wire \cnt_reg[8]_i_1_n_0 ;
  wire \cnt_reg[8]_i_1_n_4 ;
  wire \cnt_reg[8]_i_1_n_5 ;
  wire \cnt_reg[8]_i_1_n_6 ;
  wire \cnt_reg[8]_i_1_n_7 ;
  wire in_r;
  wire in_r_i_1_n_0;
  wire out_i_1_n_0;
  wire rst_IBUF;
  wire up_status;
  wire up_status_i_1_n_0;
  wire up_status_i_2_n_0;
  wire up_status_i_3_n_0;
  wire up_status_i_4_n_0;
  wire up_status_i_5_n_0;
  wire up_status_i_6_n_0;
  wire up_status_i_7_n_0;
  wire usm_limit_deb_OBUF;
  wire [2:0]\NLW_cnt_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_cnt_reg[28]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[8]_i_1_CO_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h7FFF)) 
    \cnt[0]_i_10 
       (.I0(cnt_reg[6]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[8]),
        .I3(cnt_reg[7]),
        .O(\cnt[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[0]_i_11 
       (.I0(cnt_reg[10]),
        .I1(cnt_reg[11]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[4]),
        .O(\cnt[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAAA)) 
    \cnt[0]_i_1__0 
       (.I0(rst_IBUF),
        .I1(\cnt[0]_i_3__0_n_0 ),
        .I2(\cnt[0]_i_4_n_0 ),
        .I3(\cnt[0]_i_5_n_0 ),
        .I4(\cnt[0]_i_6_n_0 ),
        .I5(up_status),
        .O(\cnt[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt[0]_i_3__0 
       (.I0(cnt_reg[21]),
        .I1(cnt_reg[20]),
        .I2(cnt_reg[23]),
        .I3(cnt_reg[22]),
        .I4(\cnt[0]_i_8_n_0 ),
        .O(\cnt[0]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt[0]_i_4 
       (.I0(cnt_reg[29]),
        .I1(cnt_reg[28]),
        .I2(cnt_reg[30]),
        .I3(cnt_reg[31]),
        .I4(\cnt[0]_i_9_n_0 ),
        .O(\cnt[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFF7)) 
    \cnt[0]_i_5 
       (.I0(cnt_reg[9]),
        .I1(cnt_reg[5]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(\cnt[0]_i_10_n_0 ),
        .O(\cnt[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \cnt[0]_i_6 
       (.I0(cnt_reg[13]),
        .I1(cnt_reg[12]),
        .I2(cnt_reg[15]),
        .I3(cnt_reg[14]),
        .I4(\cnt[0]_i_11_n_0 ),
        .O(\cnt[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_7 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[0]_i_8 
       (.I0(cnt_reg[18]),
        .I1(cnt_reg[19]),
        .I2(cnt_reg[16]),
        .I3(cnt_reg[17]),
        .O(\cnt[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \cnt[0]_i_9 
       (.I0(cnt_reg[26]),
        .I1(cnt_reg[27]),
        .I2(cnt_reg[24]),
        .I3(cnt_reg[25]),
        .O(\cnt[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[0]_i_2_n_7 ),
        .Q(cnt_reg[0]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[0]_i_2_n_0 ,\NLW_cnt_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[0]_i_2_n_4 ,\cnt_reg[0]_i_2_n_5 ,\cnt_reg[0]_i_2_n_6 ,\cnt_reg[0]_i_2_n_7 }),
        .S({cnt_reg[3:1],\cnt[0]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[8]_i_1_n_5 ),
        .Q(cnt_reg[10]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[8]_i_1_n_4 ),
        .Q(cnt_reg[11]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[12]_i_1_n_7 ),
        .Q(cnt_reg[12]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[12]_i_1 
       (.CI(\cnt_reg[8]_i_1_n_0 ),
        .CO({\cnt_reg[12]_i_1_n_0 ,\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_1_n_4 ,\cnt_reg[12]_i_1_n_5 ,\cnt_reg[12]_i_1_n_6 ,\cnt_reg[12]_i_1_n_7 }),
        .S(cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[12]_i_1_n_6 ),
        .Q(cnt_reg[13]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[12]_i_1_n_5 ),
        .Q(cnt_reg[14]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[12]_i_1_n_4 ),
        .Q(cnt_reg[15]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[16]_i_1_n_7 ),
        .Q(cnt_reg[16]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[16]_i_1 
       (.CI(\cnt_reg[12]_i_1_n_0 ),
        .CO({\cnt_reg[16]_i_1_n_0 ,\NLW_cnt_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[16]_i_1_n_4 ,\cnt_reg[16]_i_1_n_5 ,\cnt_reg[16]_i_1_n_6 ,\cnt_reg[16]_i_1_n_7 }),
        .S(cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[16]_i_1_n_6 ),
        .Q(cnt_reg[17]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[16]_i_1_n_5 ),
        .Q(cnt_reg[18]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[16]_i_1_n_4 ),
        .Q(cnt_reg[19]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[0]_i_2_n_6 ),
        .Q(cnt_reg[1]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[20]_i_1_n_7 ),
        .Q(cnt_reg[20]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[20]_i_1 
       (.CI(\cnt_reg[16]_i_1_n_0 ),
        .CO({\cnt_reg[20]_i_1_n_0 ,\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[20]_i_1_n_4 ,\cnt_reg[20]_i_1_n_5 ,\cnt_reg[20]_i_1_n_6 ,\cnt_reg[20]_i_1_n_7 }),
        .S(cnt_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[20]_i_1_n_6 ),
        .Q(cnt_reg[21]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[20]_i_1_n_5 ),
        .Q(cnt_reg[22]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[20]_i_1_n_4 ),
        .Q(cnt_reg[23]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[24]_i_1_n_7 ),
        .Q(cnt_reg[24]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[24]_i_1 
       (.CI(\cnt_reg[20]_i_1_n_0 ),
        .CO({\cnt_reg[24]_i_1_n_0 ,\NLW_cnt_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[24]_i_1_n_4 ,\cnt_reg[24]_i_1_n_5 ,\cnt_reg[24]_i_1_n_6 ,\cnt_reg[24]_i_1_n_7 }),
        .S(cnt_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[24]_i_1_n_6 ),
        .Q(cnt_reg[25]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[24]_i_1_n_5 ),
        .Q(cnt_reg[26]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[24]_i_1_n_4 ),
        .Q(cnt_reg[27]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[28]_i_1_n_7 ),
        .Q(cnt_reg[28]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[28]_i_1 
       (.CI(\cnt_reg[24]_i_1_n_0 ),
        .CO(\NLW_cnt_reg[28]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[28]_i_1_n_4 ,\cnt_reg[28]_i_1_n_5 ,\cnt_reg[28]_i_1_n_6 ,\cnt_reg[28]_i_1_n_7 }),
        .S(cnt_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[28]_i_1_n_6 ),
        .Q(cnt_reg[29]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[0]_i_2_n_5 ),
        .Q(cnt_reg[2]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[28]_i_1_n_5 ),
        .Q(cnt_reg[30]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[28]_i_1_n_4 ),
        .Q(cnt_reg[31]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[0]_i_2_n_4 ),
        .Q(cnt_reg[3]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[4]_i_1_n_7 ),
        .Q(cnt_reg[4]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[4]_i_1 
       (.CI(\cnt_reg[0]_i_2_n_0 ),
        .CO({\cnt_reg[4]_i_1_n_0 ,\NLW_cnt_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_1_n_4 ,\cnt_reg[4]_i_1_n_5 ,\cnt_reg[4]_i_1_n_6 ,\cnt_reg[4]_i_1_n_7 }),
        .S(cnt_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[4]_i_1_n_6 ),
        .Q(cnt_reg[5]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[4]_i_1_n_5 ),
        .Q(cnt_reg[6]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[4]_i_1_n_4 ),
        .Q(cnt_reg[7]),
        .R(\cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[8]_i_1_n_7 ),
        .Q(cnt_reg[8]),
        .R(\cnt[0]_i_1__0_n_0 ));
  CARRY4 \cnt_reg[8]_i_1 
       (.CI(\cnt_reg[4]_i_1_n_0 ),
        .CO({\cnt_reg[8]_i_1_n_0 ,\NLW_cnt_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_1_n_4 ,\cnt_reg[8]_i_1_n_5 ,\cnt_reg[8]_i_1_n_6 ,\cnt_reg[8]_i_1_n_7 }),
        .S(cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(up_status),
        .D(\cnt_reg[8]_i_1_n_6 ),
        .Q(cnt_reg[9]),
        .R(\cnt[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    in_r_i_1
       (.I0(usm_limit_deb_OBUF),
        .I1(rst_IBUF),
        .O(in_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    in_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(in_r_i_1_n_0),
        .Q(in_r),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    out_i_1
       (.I0(usm_limit_deb_OBUF),
        .I1(up_status),
        .O(out_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    out_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(out_i_1_n_0),
        .Q(Q),
        .R(rst_IBUF));
  LUT6 #(
    .INIT(64'h00000000F4F4F404)) 
    up_status_i_1
       (.I0(in_r),
        .I1(usm_limit_deb_OBUF),
        .I2(up_status),
        .I3(up_status_i_2_n_0),
        .I4(up_status_i_3_n_0),
        .I5(rst_IBUF),
        .O(up_status_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    up_status_i_2
       (.I0(\cnt[0]_i_11_n_0 ),
        .I1(up_status_i_4_n_0),
        .I2(\cnt[0]_i_10_n_0 ),
        .I3(up_status_i_5_n_0),
        .O(up_status_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    up_status_i_3
       (.I0(\cnt[0]_i_9_n_0 ),
        .I1(up_status_i_6_n_0),
        .I2(\cnt[0]_i_8_n_0 ),
        .I3(up_status_i_7_n_0),
        .O(up_status_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    up_status_i_4
       (.I0(cnt_reg[14]),
        .I1(cnt_reg[15]),
        .I2(cnt_reg[12]),
        .I3(cnt_reg[13]),
        .O(up_status_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    up_status_i_5
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[5]),
        .I3(cnt_reg[9]),
        .O(up_status_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    up_status_i_6
       (.I0(cnt_reg[31]),
        .I1(cnt_reg[30]),
        .I2(cnt_reg[28]),
        .I3(cnt_reg[29]),
        .O(up_status_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    up_status_i_7
       (.I0(cnt_reg[22]),
        .I1(cnt_reg[23]),
        .I2(cnt_reg[20]),
        .I3(cnt_reg[21]),
        .O(up_status_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    up_status_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(up_status_i_1_n_0),
        .Q(up_status),
        .R(1'b0));
endmodule

(* CNT = "5" *) (* ECO_CHECKSUM = "2e250db9" *) (* RST_V = "1'b0" *) 
(* NotValidForBitStream *)
module top
   (clk,
    rst,
    in,
    cnt_run,
    cnt_start,
    cnt_done,
    usm_limit_deb,
    usm_limit_hold);
  input clk;
  input rst;
  input in;
  output cnt_run;
  output cnt_start;
  output cnt_done;
  output usm_limit_deb;
  output usm_limit_hold;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_3_n_0 ;
  wire cnt_done;
  wire cnt_done_OBUF;
  wire cnt_done_OBUF_inst_i_2_n_0;
  wire cnt_done_OBUF_inst_i_3_n_0;
  wire cnt_done_OBUF_inst_i_4_n_0;
  wire cnt_done_OBUF_inst_i_5_n_0;
  wire cnt_done_OBUF_inst_i_6_n_0;
  wire cnt_done_OBUF_inst_i_7_n_0;
  wire cnt_done_OBUF_inst_i_8_n_0;
  wire cnt_done_OBUF_inst_i_9_n_0;
  wire [31:0]cnt_reg;
  wire \cnt_reg[0]_i_2__0_n_0 ;
  wire \cnt_reg[0]_i_2__0_n_4 ;
  wire \cnt_reg[0]_i_2__0_n_5 ;
  wire \cnt_reg[0]_i_2__0_n_6 ;
  wire \cnt_reg[0]_i_2__0_n_7 ;
  wire \cnt_reg[12]_i_1__0_n_0 ;
  wire \cnt_reg[12]_i_1__0_n_4 ;
  wire \cnt_reg[12]_i_1__0_n_5 ;
  wire \cnt_reg[12]_i_1__0_n_6 ;
  wire \cnt_reg[12]_i_1__0_n_7 ;
  wire \cnt_reg[16]_i_1__0_n_0 ;
  wire \cnt_reg[16]_i_1__0_n_4 ;
  wire \cnt_reg[16]_i_1__0_n_5 ;
  wire \cnt_reg[16]_i_1__0_n_6 ;
  wire \cnt_reg[16]_i_1__0_n_7 ;
  wire \cnt_reg[20]_i_1__0_n_0 ;
  wire \cnt_reg[20]_i_1__0_n_4 ;
  wire \cnt_reg[20]_i_1__0_n_5 ;
  wire \cnt_reg[20]_i_1__0_n_6 ;
  wire \cnt_reg[20]_i_1__0_n_7 ;
  wire \cnt_reg[24]_i_1__0_n_0 ;
  wire \cnt_reg[24]_i_1__0_n_4 ;
  wire \cnt_reg[24]_i_1__0_n_5 ;
  wire \cnt_reg[24]_i_1__0_n_6 ;
  wire \cnt_reg[24]_i_1__0_n_7 ;
  wire \cnt_reg[28]_i_1__0_n_4 ;
  wire \cnt_reg[28]_i_1__0_n_5 ;
  wire \cnt_reg[28]_i_1__0_n_6 ;
  wire \cnt_reg[28]_i_1__0_n_7 ;
  wire \cnt_reg[4]_i_1__0_n_0 ;
  wire \cnt_reg[4]_i_1__0_n_4 ;
  wire \cnt_reg[4]_i_1__0_n_5 ;
  wire \cnt_reg[4]_i_1__0_n_6 ;
  wire \cnt_reg[4]_i_1__0_n_7 ;
  wire \cnt_reg[8]_i_1__0_n_0 ;
  wire \cnt_reg[8]_i_1__0_n_4 ;
  wire \cnt_reg[8]_i_1__0_n_5 ;
  wire \cnt_reg[8]_i_1__0_n_6 ;
  wire \cnt_reg[8]_i_1__0_n_7 ;
  wire cnt_run;
  wire cnt_run_OBUF;
  wire cnt_run_i_1_n_0;
  wire cnt_run_i_2_n_0;
  wire cnt_run_i_3_n_0;
  wire cnt_run_i_4_n_0;
  wire cnt_start;
  wire cnt_start_OBUF;
  wire in;
  wire in_IBUF;
  wire rst;
  wire rst_IBUF;
  wire usm_limit_deb;
  wire usm_limit_deb_OBUF;
  wire usm_limit_hold;
  wire usm_limit_hold_OBUF;
  wire [2:0]\NLW_cnt_reg[0]_i_2__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[12]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[16]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[20]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[24]_i_1__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_cnt_reg[28]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[4]_i_1__0_CO_UNCONNECTED ;
  wire [2:0]\NLW_cnt_reg[8]_i_1__0_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("top_test_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT6 #(
    .INIT(64'hAAAAAAABAAAAAAAA)) 
    \cnt[0]_i_1 
       (.I0(rst_IBUF),
        .I1(cnt_done_OBUF_inst_i_5_n_0),
        .I2(cnt_done_OBUF_inst_i_4_n_0),
        .I3(cnt_done_OBUF_inst_i_3_n_0),
        .I4(cnt_done_OBUF_inst_i_2_n_0),
        .I5(cnt_run_OBUF),
        .O(\cnt[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_3 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_3_n_0 ));
  OBUF cnt_done_OBUF_inst
       (.I(cnt_done_OBUF),
        .O(cnt_done));
  LUT5 #(
    .INIT(32'h00000002)) 
    cnt_done_OBUF_inst_i_1
       (.I0(cnt_run_OBUF),
        .I1(cnt_done_OBUF_inst_i_2_n_0),
        .I2(cnt_done_OBUF_inst_i_3_n_0),
        .I3(cnt_done_OBUF_inst_i_4_n_0),
        .I4(cnt_done_OBUF_inst_i_5_n_0),
        .O(cnt_done_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cnt_done_OBUF_inst_i_2
       (.I0(cnt_reg[13]),
        .I1(cnt_reg[12]),
        .I2(cnt_reg[15]),
        .I3(cnt_reg[14]),
        .I4(cnt_done_OBUF_inst_i_6_n_0),
        .O(cnt_done_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cnt_done_OBUF_inst_i_3
       (.I0(cnt_reg[5]),
        .I1(cnt_reg[4]),
        .I2(cnt_reg[7]),
        .I3(cnt_reg[6]),
        .I4(cnt_done_OBUF_inst_i_7_n_0),
        .O(cnt_done_OBUF_inst_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cnt_done_OBUF_inst_i_4
       (.I0(cnt_reg[29]),
        .I1(cnt_reg[28]),
        .I2(cnt_reg[30]),
        .I3(cnt_reg[31]),
        .I4(cnt_done_OBUF_inst_i_8_n_0),
        .O(cnt_done_OBUF_inst_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    cnt_done_OBUF_inst_i_5
       (.I0(cnt_reg[21]),
        .I1(cnt_reg[20]),
        .I2(cnt_reg[23]),
        .I3(cnt_reg[22]),
        .I4(cnt_done_OBUF_inst_i_9_n_0),
        .O(cnt_done_OBUF_inst_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_done_OBUF_inst_i_6
       (.I0(cnt_reg[10]),
        .I1(cnt_reg[11]),
        .I2(cnt_reg[8]),
        .I3(cnt_reg[9]),
        .O(cnt_done_OBUF_inst_i_6_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    cnt_done_OBUF_inst_i_7
       (.I0(cnt_reg[1]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .O(cnt_done_OBUF_inst_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_done_OBUF_inst_i_8
       (.I0(cnt_reg[26]),
        .I1(cnt_reg[27]),
        .I2(cnt_reg[24]),
        .I3(cnt_reg[25]),
        .O(cnt_done_OBUF_inst_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_done_OBUF_inst_i_9
       (.I0(cnt_reg[18]),
        .I1(cnt_reg[19]),
        .I2(cnt_reg[16]),
        .I3(cnt_reg[17]),
        .O(cnt_done_OBUF_inst_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[0]_i_2__0_n_7 ),
        .Q(cnt_reg[0]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\cnt_reg[0]_i_2__0_n_0 ,\NLW_cnt_reg[0]_i_2__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[0]_i_2__0_n_4 ,\cnt_reg[0]_i_2__0_n_5 ,\cnt_reg[0]_i_2__0_n_6 ,\cnt_reg[0]_i_2__0_n_7 }),
        .S({cnt_reg[3:1],\cnt[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[8]_i_1__0_n_5 ),
        .Q(cnt_reg[10]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[8]_i_1__0_n_4 ),
        .Q(cnt_reg[11]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[12]_i_1__0_n_7 ),
        .Q(cnt_reg[12]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[12]_i_1__0 
       (.CI(\cnt_reg[8]_i_1__0_n_0 ),
        .CO({\cnt_reg[12]_i_1__0_n_0 ,\NLW_cnt_reg[12]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_1__0_n_4 ,\cnt_reg[12]_i_1__0_n_5 ,\cnt_reg[12]_i_1__0_n_6 ,\cnt_reg[12]_i_1__0_n_7 }),
        .S(cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[12]_i_1__0_n_6 ),
        .Q(cnt_reg[13]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[12]_i_1__0_n_5 ),
        .Q(cnt_reg[14]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[12]_i_1__0_n_4 ),
        .Q(cnt_reg[15]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[16]_i_1__0_n_7 ),
        .Q(cnt_reg[16]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[16]_i_1__0 
       (.CI(\cnt_reg[12]_i_1__0_n_0 ),
        .CO({\cnt_reg[16]_i_1__0_n_0 ,\NLW_cnt_reg[16]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[16]_i_1__0_n_4 ,\cnt_reg[16]_i_1__0_n_5 ,\cnt_reg[16]_i_1__0_n_6 ,\cnt_reg[16]_i_1__0_n_7 }),
        .S(cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[16]_i_1__0_n_6 ),
        .Q(cnt_reg[17]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[16]_i_1__0_n_5 ),
        .Q(cnt_reg[18]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[16]_i_1__0_n_4 ),
        .Q(cnt_reg[19]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[0]_i_2__0_n_6 ),
        .Q(cnt_reg[1]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[20]_i_1__0_n_7 ),
        .Q(cnt_reg[20]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[20]_i_1__0 
       (.CI(\cnt_reg[16]_i_1__0_n_0 ),
        .CO({\cnt_reg[20]_i_1__0_n_0 ,\NLW_cnt_reg[20]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[20]_i_1__0_n_4 ,\cnt_reg[20]_i_1__0_n_5 ,\cnt_reg[20]_i_1__0_n_6 ,\cnt_reg[20]_i_1__0_n_7 }),
        .S(cnt_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[20]_i_1__0_n_6 ),
        .Q(cnt_reg[21]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[20]_i_1__0_n_5 ),
        .Q(cnt_reg[22]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[20]_i_1__0_n_4 ),
        .Q(cnt_reg[23]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[24]_i_1__0_n_7 ),
        .Q(cnt_reg[24]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[24]_i_1__0 
       (.CI(\cnt_reg[20]_i_1__0_n_0 ),
        .CO({\cnt_reg[24]_i_1__0_n_0 ,\NLW_cnt_reg[24]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[24]_i_1__0_n_4 ,\cnt_reg[24]_i_1__0_n_5 ,\cnt_reg[24]_i_1__0_n_6 ,\cnt_reg[24]_i_1__0_n_7 }),
        .S(cnt_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[24]_i_1__0_n_6 ),
        .Q(cnt_reg[25]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[24]_i_1__0_n_5 ),
        .Q(cnt_reg[26]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[24]_i_1__0_n_4 ),
        .Q(cnt_reg[27]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[28]_i_1__0_n_7 ),
        .Q(cnt_reg[28]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[28]_i_1__0 
       (.CI(\cnt_reg[24]_i_1__0_n_0 ),
        .CO(\NLW_cnt_reg[28]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[28]_i_1__0_n_4 ,\cnt_reg[28]_i_1__0_n_5 ,\cnt_reg[28]_i_1__0_n_6 ,\cnt_reg[28]_i_1__0_n_7 }),
        .S(cnt_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[28]_i_1__0_n_6 ),
        .Q(cnt_reg[29]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[0]_i_2__0_n_5 ),
        .Q(cnt_reg[2]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[28]_i_1__0_n_5 ),
        .Q(cnt_reg[30]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[28]_i_1__0_n_4 ),
        .Q(cnt_reg[31]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[0]_i_2__0_n_4 ),
        .Q(cnt_reg[3]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[4]_i_1__0_n_7 ),
        .Q(cnt_reg[4]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[4]_i_1__0 
       (.CI(\cnt_reg[0]_i_2__0_n_0 ),
        .CO({\cnt_reg[4]_i_1__0_n_0 ,\NLW_cnt_reg[4]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_1__0_n_4 ,\cnt_reg[4]_i_1__0_n_5 ,\cnt_reg[4]_i_1__0_n_6 ,\cnt_reg[4]_i_1__0_n_7 }),
        .S(cnt_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[4]_i_1__0_n_6 ),
        .Q(cnt_reg[5]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[4]_i_1__0_n_5 ),
        .Q(cnt_reg[6]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[4]_i_1__0_n_4 ),
        .Q(cnt_reg[7]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[8]_i_1__0_n_7 ),
        .Q(cnt_reg[8]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[8]_i_1__0 
       (.CI(\cnt_reg[4]_i_1__0_n_0 ),
        .CO({\cnt_reg[8]_i_1__0_n_0 ,\NLW_cnt_reg[8]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_1__0_n_4 ,\cnt_reg[8]_i_1__0_n_5 ,\cnt_reg[8]_i_1__0_n_6 ,\cnt_reg[8]_i_1__0_n_7 }),
        .S(cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(cnt_run_OBUF),
        .D(\cnt_reg[8]_i_1__0_n_6 ),
        .Q(cnt_reg[9]),
        .R(\cnt[0]_i_1_n_0 ));
  OBUF cnt_run_OBUF_inst
       (.I(cnt_run_OBUF),
        .O(cnt_run));
  LUT6 #(
    .INIT(64'h00000000EEEEEEE2)) 
    cnt_run_i_1
       (.I0(cnt_start_OBUF),
        .I1(cnt_run_OBUF),
        .I2(cnt_run_i_2_n_0),
        .I3(cnt_done_OBUF_inst_i_4_n_0),
        .I4(cnt_done_OBUF_inst_i_5_n_0),
        .I5(rst_IBUF),
        .O(cnt_run_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_run_i_2
       (.I0(cnt_done_OBUF_inst_i_6_n_0),
        .I1(cnt_run_i_3_n_0),
        .I2(cnt_done_OBUF_inst_i_7_n_0),
        .I3(cnt_run_i_4_n_0),
        .O(cnt_run_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_run_i_3
       (.I0(cnt_reg[14]),
        .I1(cnt_reg[15]),
        .I2(cnt_reg[12]),
        .I3(cnt_reg[13]),
        .O(cnt_run_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    cnt_run_i_4
       (.I0(cnt_reg[6]),
        .I1(cnt_reg[7]),
        .I2(cnt_reg[4]),
        .I3(cnt_reg[5]),
        .O(cnt_run_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cnt_run_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(cnt_run_i_1_n_0),
        .Q(cnt_run_OBUF),
        .R(1'b0));
  OBUF cnt_start_OBUF_inst
       (.I(cnt_start_OBUF),
        .O(cnt_start));
  LUT3 #(
    .INIT(8'h06)) 
    cnt_start_OBUF_inst_i_1
       (.I0(usm_limit_deb_OBUF),
        .I1(in_IBUF),
        .I2(cnt_run_OBUF),
        .O(cnt_start_OBUF));
  IBUF in_IBUF_inst
       (.I(in),
        .O(in_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  holdup_cnt uholdup_cnt
       (.Q(usm_limit_hold_OBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF),
        .usm_limit_deb_OBUF(usm_limit_deb_OBUF));
  OBUF usm_limit_deb_OBUF_inst
       (.I(usm_limit_deb_OBUF),
        .O(usm_limit_deb));
  FDRE #(
    .INIT(1'b0)) 
    usm_limit_deb_reg
       (.C(clk_IBUF_BUFG),
        .CE(cnt_done_OBUF),
        .D(in_IBUF),
        .Q(usm_limit_deb_OBUF),
        .R(rst_IBUF));
  OBUF usm_limit_hold_OBUF_inst
       (.I(usm_limit_hold_OBUF),
        .O(usm_limit_hold));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

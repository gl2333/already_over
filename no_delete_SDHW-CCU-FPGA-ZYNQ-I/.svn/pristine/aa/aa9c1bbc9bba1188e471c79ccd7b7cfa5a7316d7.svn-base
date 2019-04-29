module input_debounce
#(
    parameter integer CHS = 2,
    parameter integer USM = 4,
    parameter integer PWR = 2
) 
(                                   
    input            clk            , 
    input            rst            ,
    input  [    4:0] PL_SWITCH      ,
    input  [    3:0] PL_UNUSED      ,
    input  [    1:0] EMERMEA        ,
    input  [CHS-1:0] PRESENT        ,
    input  [CHS-1:0] CTRL_IRQ       , 
    input  [CHS-1:0] PHA_IRQ        ,
    input  [USM-1:0] USM_OUT_A      ,
    input  [USM-1:0] USM_OUT_B      ,
    input  [USM-1:0] USM_OUT_Z      ,
    input  [USM-1:0] USM_ALARM_A    ,
    input  [USM-1:0] USM_ALARM_B    ,
    input  [USM-1:0] USM_ALARM_Z    ,
    input  [USM-1:0] USM_ALARM_D    ,
    input  [USM-1:0] USM_LIMIT      ,
    input  [PWR-1:0] PWR_AC_OK      ,
    input  [PWR-1:0] PWR_DC_OK      ,
    input  [PWR-1:0] PWR_FAULT      ,
    input  [PWR-1:0] ac_aol         ,
    output [    4:0] pl_switch_deb  ,
    output [    3:0] pl_unused_deb  ,
    output [    1:0] emermea_deb    ,
    output [CHS-1:0] present_deb    ,
    output [CHS-1:0] ctrl_irq_deb   ,
    output [CHS-1:0] pha_irq_deb    ,
    output [USM-1:0] usm_out_a_deb  ,
    output [USM-1:0] usm_out_b_deb  ,
    output [USM-1:0] usm_out_z_deb  ,
    output [USM-1:0] usm_alarm_a_deb,
    output [USM-1:0] usm_alarm_b_deb,
    output [USM-1:0] usm_alarm_z_deb,
    output [USM-1:0] usm_alarm_d_deb,
    output [USM-1:0] usm_limit_hold ,
    output [PWR-1:0] pwr_ac_ok_deb  ,
    output [PWR-1:0] pwr_dc_ok_deb  ,
    output [PWR-1:0] pwr_fault_deb  ,                                       
    output [PWR-1:0] ac_aol_deb     
);

    wire [USM-1:0] usm_limit_deb  ;
genvar j;
generate for(j=0;j<=    4;j=j+1)begin: u01 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb01  (.clk(clk),.rst(rst),.in(  PL_SWITCH[j]),.out(  pl_switch_deb[j]));end endgenerate 
generate for(j=0;j<=    3;j=j+1)begin: u02 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb02  (.clk(clk),.rst(rst),.in(  PL_UNUSED[j]),.out(  pl_unused_deb[j]));end endgenerate                                  
generate for(j=0;j<=    1;j=j+1)begin: u03 deb_cnt    #(.RST_V(1'b0),.CNT(2_500_000 )) udeb03  (.clk(clk),.rst(rst),.in(    EMERMEA[j]),.out(    emermea_deb[j]));end endgenerate                                 
generate for(j=0;j<=CHS-1;j=j+1)begin: u04 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb04  (.clk(clk),.rst(rst),.in(    PRESENT[j]),.out(    present_deb[j]));end endgenerate                                   
generate for(j=0;j<=CHS-1;j=j+1)begin: u05 deb_cnt    #(.RST_V(1'b0),.CNT(9			)) udeb05  (.clk(clk),.rst(rst),.in(   CTRL_IRQ[j]),.out(   ctrl_irq_deb[j]));end endgenerate 
generate for(j=0;j<=CHS-1;j=j+1)begin: u06 deb_cnt    #(.RST_V(1'b0),.CNT(9			)) udeb06  (.clk(clk),.rst(rst),.in(    PHA_IRQ[j]),.out(    pha_irq_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u07 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb07  (.clk(clk),.rst(rst),.in(  USM_OUT_A[j]),.out(  usm_out_a_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u08 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb08  (.clk(clk),.rst(rst),.in(  USM_OUT_B[j]),.out(  usm_out_b_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u09 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb09  (.clk(clk),.rst(rst),.in(  USM_OUT_Z[j]),.out(  usm_out_z_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u10 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb10  (.clk(clk),.rst(rst),.in(USM_ALARM_A[j]),.out(usm_alarm_a_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u11 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb11  (.clk(clk),.rst(rst),.in(USM_ALARM_B[j]),.out(usm_alarm_b_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u12 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb12  (.clk(clk),.rst(rst),.in(USM_ALARM_Z[j]),.out(usm_alarm_z_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u13 deb_cnt    #(.RST_V(1'b0),.CNT(12        )) udeb13  (.clk(clk),.rst(rst),.in(USM_ALARM_D[j]),.out(usm_alarm_d_deb[j]));end endgenerate 
generate for(j=0;j<=USM-1;j=j+1)begin: u14 deb_cnt    #(.RST_V(1'b0),.CNT(5_000     )) udeb14  (.clk(clk),.rst(rst),.in(  USM_LIMIT[j]),.out(  usm_limit_deb[j]));end endgenerate 
generate for(j=0;j<=PWR-1;j=j+1)begin: u15 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb15  (.clk(clk),.rst(rst),.in(  PWR_AC_OK[j]),.out(  pwr_ac_ok_deb[j]));end endgenerate 
generate for(j=0;j<=PWR-1;j=j+1)begin: u16 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb16  (.clk(clk),.rst(rst),.in(  PWR_DC_OK[j]),.out(  pwr_dc_ok_deb[j]));end endgenerate 
generate for(j=0;j<=PWR-1;j=j+1)begin: u17 deb_cnt    #(.RST_V(1'b0),.CNT(6         )) udeb17  (.clk(clk),.rst(rst),.in(  PWR_FAULT[j]),.out(  pwr_fault_deb[j]));end endgenerate 
generate for(j=0;j<=PWR-1;j=j+1)begin: u18 deb_cnt    #(.RST_V(1'b0),.CNT(20_000_000)) udeb18  (.clk(clk),.rst(rst),.in(     ac_aol[j]),.out(     ac_aol_deb[j]));end endgenerate                                
generate for(j=0;j<=USM-1;j=j+1)begin: u20 holdup_cnt #(.RST_V(1'b0),.CNT(50_000_000)) uholdup1(.clk(clk),.rst(rst),.in(usm_limit_deb[j]),.out(usm_limit_hold[j]));end endgenerate                                
endmodule

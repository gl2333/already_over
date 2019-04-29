-makelib ies/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../project_1.srcs/sources_1/ip/clk_gen/clk_gen_clk_wiz.v" \
  "../../../../project_1.srcs/sources_1/ip/clk_gen/clk_gen.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib


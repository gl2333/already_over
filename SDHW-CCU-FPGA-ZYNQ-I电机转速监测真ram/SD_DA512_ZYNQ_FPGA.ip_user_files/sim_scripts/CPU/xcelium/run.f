-makelib xcelium_lib/xilinx_vip -sv \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_1 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ip/CPU_AXI4_DEV_0_1/src/bram_2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CPU/ip/CPU_AXI4_DEV_0_1/src/bram_2/sim/bram.v" \
  "../../../bd/CPU/ipshared/63dd/hdl/AXI4_DEV_v1_0_S00_AXI.v" \
  "../../../bd/CPU/ipshared/63dd/src/AXI_REG.v" \
  "../../../bd/CPU/ipshared/63dd/src/I2CMaster.v" \
  "../../../bd/CPU/ipshared/63dd/src/cur_meas.v" \
  "../../../bd/CPU/ipshared/63dd/src/deb_cnt.v" \
  "../../../bd/CPU/ipshared/63dd/src/dna.v" \
  "../../../bd/CPU/ipshared/63dd/src/hold_up.v" \
  "../../../bd/CPU/ipshared/63dd/src/input_debounce.v" \
  "../../../bd/CPU/ipshared/63dd/src/usm.v" \
  "../../../bd/CPU/ipshared/63dd/src/wave_gen.v" \
  "../../../bd/CPU/ipshared/63dd/src/usm_sample.v" \
  "../../../bd/CPU/ipshared/63dd/hdl/AXI4_DEV_v1_0.v" \
  "../../../bd/CPU/ip/CPU_AXI4_DEV_0_1/sim/CPU_AXI4_DEV_0_1.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_protocol_checker_v2_0_3 -sv \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_3 -sv \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_5 -sv \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CPU/ip/CPU_processing_system7_0_0_1/sim/CPU_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_12 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CPU/ip/CPU_rst_ps7_0_100M_0_1/sim/CPU_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CPU/sim/CPU.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_2 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_2 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_2 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_16 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_17 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_17 \
  "../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/CPU/ip/CPU_auto_pc_0/sim/CPU_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib


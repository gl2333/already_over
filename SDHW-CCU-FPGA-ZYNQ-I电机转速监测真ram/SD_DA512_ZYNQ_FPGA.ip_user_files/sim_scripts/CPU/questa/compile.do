vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_1
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_protocol_checker_v2_0_3
vlib questa_lib/msim/axi_vip_v1_1_3
vlib questa_lib/msim/processing_system7_vip_v1_0_5
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_12
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/fifo_generator_v13_2_2
vlib questa_lib/msim/axi_data_fifo_v2_1_16
vlib questa_lib/msim/axi_register_slice_v2_1_17
vlib questa_lib/msim/axi_protocol_converter_v2_1_17

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_1 questa_lib/msim/blk_mem_gen_v8_4_1
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 questa_lib/msim/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 questa_lib/msim/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 questa_lib/msim/processing_system7_vip_v1_0_5
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 questa_lib/msim/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_2 questa_lib/msim/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_16 questa_lib/msim/axi_data_fifo_v2_1_16
vmap axi_register_slice_v2_1_17 questa_lib/msim/axi_register_slice_v2_1_17
vmap axi_protocol_converter_v2_1_17 questa_lib/msim/axi_protocol_converter_v2_1_17

vlog -work xilinx_vip -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_1 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ip/CPU_AXI4_DEV_0_1/src/bram_2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
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

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/CPU/ip/CPU_processing_system7_0_0_1/sim/CPU_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/CPU/ip/CPU_rst_ps7_0_100M_0_1/sim/CPU_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/CPU/sim/CPU.v" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -64 -93 \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_16 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_17 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_17 -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/CPU/ipshared/63dd/src" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/ec67/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/5bb9/hdl/verilog" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/70fd/hdl" "+incdir+../../../../SD_DA512_ZYNQ_FPGA.srcs/sources_1/bd/CPU/ipshared/63dd/src" "+incdir+D:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/CPU/ip/CPU_auto_pc_0/sim/CPU_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"


cd "D:/4_WORK/1_svn/FPGA/SDHW-CCU/SDHW-CCU-FPGA-ZYNQ-I-DS/SD_DA512_ZYNQ_FPGA.ipdefs/AXI4_DEV_0_0_0/src"
set f [open compile_date.vh w]

puts $f "`ifndef COMPILE_DATE__VH__"
puts $f "    `define COMPILE_DATE__VH__"
puts $f ""
set time_str "    `define FIRMWARE_COMPILE_DATE 32'h"
append time_str [clock format [clock seconds] -format %Y%m%d]
puts $f $time_str
puts $f "`endif"

close $f


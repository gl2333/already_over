onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Bram_opt

do {wave.do}

view wave
view structure
view signals

do {Bram.udo}

run -all

quit -force

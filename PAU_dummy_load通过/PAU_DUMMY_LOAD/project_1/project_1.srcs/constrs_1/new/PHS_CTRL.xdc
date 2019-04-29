#Clock
create_clock -period 40.000 -name sys_freq -waveform {0.000 20.000} [get_ports CLK_IN]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IN]



#Pin location
set_property PACKAGE_PIN D4 [get_ports CLK_IN]

set_property PACKAGE_PIN G16 [get_ports SCL_Pfpga]
set_property PACKAGE_PIN C11 [get_ports SDA_Pfpga]
set_property PACKAGE_PIN H12  [get_ports SCL_Cfpga]
set_property PACKAGE_PIN D13  [get_ports SDA_Cfpga]
#set_property PACKAGE_PIN  [get_ports IRQ_Cfpga]
#set_property PACKAGE_PIN  [get_ports IRQ_Pfpga]
set_property PACKAGE_PIN E15 [get_ports TRIGGER_IN]

set_property PACKAGE_PIN H16 [get_ports {LED[0]}]
set_property PACKAGE_PIN J16 [get_ports {LED[1]}]



set_property PACKAGE_PIN R15 [get_ports {switch[7]}]
set_property PACKAGE_PIN R16 [get_ports {switch[6]}]
set_property PACKAGE_PIN P15 [get_ports {switch[5]}]
set_property PACKAGE_PIN P16 [get_ports {switch[4]}]
set_property PACKAGE_PIN N14 [get_ports {switch[3]}]
set_property PACKAGE_PIN N16 [get_ports {switch[2]}]
set_property PACKAGE_PIN M14 [get_ports {switch[1]}]
set_property PACKAGE_PIN M15 [get_ports {switch[0]}]


#lEVEL
set_property IOSTANDARD LVCMOS33 [get_ports *]
#PULL UP
#set_property PULLUP true [get_ports SCL_Pfpga]
#set_property PULLUP true [get_ports SDA_Pfpga]
set_property PULLUP true [get_ports SCL_Cfpga]
set_property PULLUP true [get_ports SDA_Cfpga]
#PULL DOWN
#set_property PULLDOWN true [get_ports IRQ_Cfpga]
#set_property PULLDOWN true [get_ports IRQ_Pfpga]


set_clock_groups -name clkgroup -asynchronous -group [get_clocks [get_clocks -of_objects [get_pins u_clk_gen/inst/mmcm_adv_inst/CLKOUT0]]] -group [get_clocks [get_clocks -of_objects [get_pins u_clk_gen/inst/mmcm_adv_inst/CLKOUT1]]]


















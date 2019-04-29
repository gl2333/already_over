//hardware_fpga_define
`ifndef HARDWARE_FPGA_DEFINE__H__
`define HARDWARE_FPGA_DEFINE__H__

`define PHS_FPGA_I2C_SLV_ADDR_7BIT     (53                            )//for hardware use
`define CTRL_FPGA_I2C_SLV_ADDR_7BIT    (55                            )//for hardware use
`define PHS_FPGA_I2C_SLV_ADDR_8BIT     (`PHS_FPGA_I2C_SLV_ADDR_7BIT*2 )//for software use
`define CTRL_FPGA_I2C_SLV_ADDR_8BIT    (`CTRL_FPGA_I2C_SLV_ADDR_7BIT*2)//for software use
`define FLASH_DATA_I2C_SLV_ADDR_8BIT   (8'hA0                         )  //A0 A1 A2 = 0 0 0 for AT24CS64  for software use
`define FLASH_ID_I2C_SLV_ADDR_8BIT     (8'hB0                         )  //A0 A1 A2 = 0 0 0 for AT24CS64  for software use
`define RTC_CLK_I2C_SLV_ADDR_8BIT      (8'hD0                         )  //RTC clock for DS1388  13bytes  for software use
`define RTC_LDATA_I2C_SLV_ADDR_8BIT    (8'hD2                         )  //RTC clock for DS1388  256bytes for software use
`define RTC_HDATA_I2C_SLV_ADDR_8BIT    (8'hD4                         )  //RTC clock for DS1388  256bytes for software use
`define FPGA_SYS_CLK_FREQ              (50_000_000                    )//ZYNQ/Phase/Control FPGAs are both 100Mhz
`define I2C_SLV_ADDR_BYTE_WID          (2                             )  
`define CHS                            (2                             )
`define CHN                            (64                            )//channel per chassis
`define PWR                            (2                             )
`define USM                            (4                             )
`define IN_AIR_NUM                     (2                             )
`define OUT_AIR_NUM                    (4                             )

`endif

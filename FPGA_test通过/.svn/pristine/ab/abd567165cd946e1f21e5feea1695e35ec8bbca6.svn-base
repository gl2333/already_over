#ifndef amp.hpp
#define amp.hpp
#include <iostream>
#include "time.h"
/* run this program using the console pauser or add your own getch, system("pause") or input loop */
#include "test.hpp" 
#include "ControlI2C.h"
#include <iostream>

#include "windows.h"
#include <conio.h>

#define MAX7232_ADDR			0xd0	
#define LM75A_ADDR 				0x90
#define ISL95811_ADDR 			0x50
#define RES_VAL_ADDR			0x00
#define RES_ID_ADDR				0x01
#define RES_ID					0x80
#define PAC1710_ADDR			0x30
#define PWR_A_CFG_ADDR			0x0A
#define PWR_V_CFG_ADDR			0x0B
#define PWR_A_ADDR				0x0D	//Data= (High*256+Low)/16
#define PWR_V_ADDR				0x11
#define PWR_W_ADDR  			0x15
#define PWR_V_CFG_DATA			0x8A	//10ms(10bits), 4 average, default is no average	
#define PWR_A_CFG_DATA			0x52 	//default is no average, -80mV to 80mV, set to 40mV
#define RES_WR_RD_INTERVAL		20      //must above 20ms

#define REG_TEMP_ADDR			0x00	//0x00 temp read only
#define REG_CFG_ADDR			0x01	//01 rw config
#define REG_HYSTERSIS_ADDR		0x02	//02 rw hystersis reg
#define REG_THRESHOLD_ADDR		0x03	//03 rw over temp shutdown threshold reg
#define EEPROM_I2C_SLAVE_ADDR_7BIT 0xa0 //7bit:0x50;8bit:0xa0

void initDev(void);
void IOIDTest(void);
void resIDTest(void);
void resWrRdTest(void);
void resWr(unsigned char res);
unsigned char resRd(void);
void powerIDTest(void);
void pwrInit(void);
float getV(void);
float getA(void);
void  wr_rd_flash(char data[],uint16_t page_res_addr,int length);

#endif

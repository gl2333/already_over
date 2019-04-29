#include "amp.hpp"
#include "usb_dev.hpp"

static UCHAR CUR_ID_ADDR[5] = {0xFD,0xFE,0xFF,0x0B,0x0A};
static UCHAR CUR_ID_DATA[5] = {0x58,0x5D,0x81,0x53,0x88};


//////////////////////////////////////////////////////////////////////////////////////////////////
void initDev(void){
	int ret,i,j;
	VII_INIT_CONFIG I2C_Config;
	VII_BOARD_INFO BoardInfo;
	
	//Scan device
	ret = VII_ScanDevice(1);
	if(ret <= 0)
	{
		printf("No device connect!\n");
		exit(0);
	}
	
    //Open device
    ret = VII_OpenDevice(VII_USBI2C, 0, 0);
    if (ret != ERR_SUCCESS)
    {
        printf("Open device error!\n");
        exit(0);
    }
    
	//Get product information
	ret = VII_ReadBoardInfo(0,&BoardInfo);
    if (ret != ERR_SUCCESS){
        printf("Read board information error!\n");
        exit(0);
    }else{
		printf("Product Name:%s\n",BoardInfo.ProductName);
		printf("Firmware Version:V%d.%d.%d\n",BoardInfo.FirmwareVersion[1],
				BoardInfo.FirmwareVersion[2],BoardInfo.FirmwareVersion[3]);
		printf("Hardware Version:V%d.%d.%d\n",BoardInfo.HardwareVersion[1],
				BoardInfo.HardwareVersion[2],BoardInfo.HardwareVersion[3]);
		printf("Serial Number:");
		for(i=0;i<12;i++){
			printf("%02X",BoardInfo.SerialNumber[i]);
		}
		printf("\n\n");
	}
	
    //Initializes the device
    I2C_Config.AddrType = VII_ADDR_7BIT;
    I2C_Config.ClockSpeed = 10000;
    I2C_Config.ControlMode = VII_HCTL_MODE;
    I2C_Config.MasterMode = VII_MASTER;
    I2C_Config.SubAddrWidth = VII_SUB_ADDR_1BYTE;
    ret = VII_InitI2C(VII_USBI2C, 0, 0, &I2C_Config);
    if (ret != ERR_SUCCESS)
    {
        printf("Initialize device error!\n");
        exit(0);
    }
}


void resIDTest(void){
	unsigned char ret,res_reg;
	
	printf("----------------------------------------------\n");
	printf("|    1.0 Resistor ID test:                   |\n");
	printf("----------------------------------------------\n");
	
	ret = VII_ReadBytes(VII_USBI2C, 0, 0, ISL95811_ADDR, RES_ID_ADDR, &res_reg, 1);
    if (ret != ERR_SUCCESS) printf("Read resistor error!\n");
    
	if(res_reg!=RES_ID) printf("**************Error***************\n");	
	else printf("Done\n\n\n");
} 


void IOIDTest(void){
	unsigned char ret,res_reg=0;
	
	printf("----------------------------------------------\n");
	printf("|    0.0 Write IO test:                      |\n");
	printf("----------------------------------------------\n");
	ret = VII_WriteBytes(VII_USBI2C, 0, 0, MAX7232_ADDR, 0x00, &res_reg, 0);
	if (ret != ERR_SUCCESS) printf("Write IO error!\n");
    Sleep(1000);
	ret = VII_WriteBytes(VII_USBI2C, 0, 0, MAX7232_ADDR, 0xff, &res_reg, 0);
	if (ret != ERR_SUCCESS) printf("Write IO error!\n");
	Sleep(1000);
	ret = VII_WriteBytes(VII_USBI2C, 0, 0, MAX7232_ADDR, 0x00, &res_reg, 0);
	if (ret != ERR_SUCCESS) printf("Write IO error!\n");
	Sleep(1000);
	ret = VII_WriteBytes(VII_USBI2C, 0, 0, MAX7232_ADDR, 0xff, &res_reg, 0);
	if (ret != ERR_SUCCESS) printf("Write IO error!\n");
	Sleep(1000);
	
	printf("Done\n\n\n");
} 

void resWrRdTest(void){
	unsigned char ret,i,res_reg,error;
	unsigned int j;
	
	printf("----------------------------------------------\n");
	printf("|    1.1 Resistor write and read back test:   |\n");
	printf("----------------------------------------------\n");
	
	error=0;
	for(j=0;j<=255;j=j+11){ 	
		resWr(j);
    	res_reg = resRd();		
		if(res_reg!=j) { error = 1;exit(0);}
	}
	if(error) {
		printf("**************Error***************\n");	
		printf("Error when index = %d\n",j);
	}
	else printf("Done\n\n\n");
} 

void resWr(unsigned char res){
	char ret = VII_WriteBytes(VII_USBI2C, 0, 0, ISL95811_ADDR, RES_VAL_ADDR, &res, 1);
	if (ret != ERR_SUCCESS) { 
	printf("**************Write Resistor Error***************\n");
	exit(0);
}
}

unsigned char resRd(){
	unsigned char reg;
	Sleep(RES_WR_RD_INTERVAL);
	char ret = VII_ReadBytes(VII_USBI2C, 0, 0, ISL95811_ADDR, RES_VAL_ADDR, &reg, 1);
	if (ret != ERR_SUCCESS){
		
	printf("**************Read Resistor Error***************\n");
	exit(0);
}
	return reg;
}

void powerIDTest(void){
	unsigned char ret, addr, reg, error;
	unsigned int j;
	
	printf("----------------------------------------------\n");
	printf("|    1.2 Power ID test:                      |\n");
	printf("----------------------------------------------\n");
	
	error = 0;
	//test device id, manufacture id, revision id.
	for(int i=0;i<3;i++){
		addr = CUR_ID_ADDR[i];
		ret = VII_ReadBytes(VII_USBI2C, 0, 0, PAC1710_ADDR, addr, &reg, 1);
    	if (ret != ERR_SUCCESS) printf("Read power error!\n");
		if(CUR_ID_DATA[i]!=reg) {error = 1; break;}
	}
    
	if(error) printf("**************Error***************\n");	
	else printf("Done\n\n\n");
} 

void pwrInit(void){
	unsigned char reg[2];
	unsigned char ret;
	reg[0] = PWR_A_CFG_DATA;
	ret = VII_WriteBytes(VII_USBI2C, 0, 0, PAC1710_ADDR, PWR_A_CFG_ADDR, reg, 1);
	if (ret != ERR_SUCCESS) printf("**************Write Power Error***************\n");
}

float getV(void){
	unsigned char reg,ret;	
	ret = VII_ReadBytes(VII_USBI2C, 0, 0, PAC1710_ADDR, PWR_V_ADDR, &reg, 1);
    if (ret != ERR_SUCCESS) printf("**************Read Power Error***************\n");
	return (float)reg*40/256;
}

float getA(void){
	unsigned char reg,ret;	
	ret = VII_ReadBytes(VII_USBI2C, 0, 0, PAC1710_ADDR, PWR_A_ADDR, &reg, 1);
    if (ret != ERR_SUCCESS) printf("Read power error!\n");
	return (float)((char)reg)*16*4/0x7ff;
}





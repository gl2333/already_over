#include "usb_dev.hpp"
 
void USB_DEV_INIT(void)
{
	//Scan device
	if(VII_ScanDevice(1) <= 0 ){
		printf("No device connect!\n");
		exit(0);
	}
	
	//Open device
    if (VII_OpenDevice(VII_USBI2C, 0, 0) != ERR_SUCCESS)
    {
        printf("Open device error!\n");
        exit(0);
    }
	
	//Get product information
	VII_BOARD_INFO BoardInfo;
    if (VII_ReadBoardInfo(0,&BoardInfo) != ERR_SUCCESS){
        printf("Read board information error!\n");
        exit(0);
    }
	else
	{
		printf("Product Name:%s\n",BoardInfo.ProductName);
		printf("Firmware Version:V%d.%d.%d\n",BoardInfo.FirmwareVersion[1],BoardInfo.FirmwareVersion[2],BoardInfo.FirmwareVersion[3]);
		printf("Hardware Version:V%d.%d.%d\n",BoardInfo.HardwareVersion[1],BoardInfo.HardwareVersion[2],BoardInfo.HardwareVersion[3]);
		printf("Serial Number:");
		for(int i=0;i<12;i++)
		{
			printf("%02X",BoardInfo.SerialNumber[i]);
		}
		printf("\n");
		printf("\n");
		printf("************************************************************\n");
	}
}


void USB_DEV_CONFIG_I2C(void)
{
	//Config I2C as your own option
	VII_INIT_CONFIG I2C_Config;
	//Initializes the device
    I2C_Config.AddrType = VII_ADDR_7BIT;
    I2C_Config.ClockSpeed = 100000;  //unit: hz
    I2C_Config.ControlMode = VII_HCTL_MODE;
    I2C_Config.MasterMode = VII_MASTER;
    I2C_Config.SubAddrWidth = VII_SUB_ADDR_1BYTE;
    if (VII_InitI2C(VII_USBI2C, 0, 0, &I2C_Config) != ERR_SUCCESS)
    {
        printf("Initialize device error!\n");
        exit(0);
    }
}

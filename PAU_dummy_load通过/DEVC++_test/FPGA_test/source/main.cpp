#include <stdio.h>
#include <windows.h>
#include <conio.h>
#include "ControlI2C.h"
#include "ControlGPIO.h"
#include "ErrorType.h"

#define RES_WR_RD_INTERVAL 100
#define PHS_FPGA_I2C_SLV_ADDR_7BIT     0x6a                          
#define CTRL_FPGA_I2C_SLV_ADDR_7BIT    0x6e                          
                          
#define PF_PHS_DIR_BYTE_ADDR 	0x417C		
#define PF_PHS_DIR_BYTE_END  	0x41BB       			
 
#define AMP_RV_BYTE_ADDR 	33224			//0x81c8
#define AMP_RV_BYTE_END  	33287			//0x8207
/* 
#define AMP_VV_BYTE_ADDR 	33288			//0x8208
#define AMP_VV_BYTE_END  	33351			//0x8247

#define AMP_AV_BYTE_ADDR 	33416			//0x8288
#define AMP_AV_BYTE_END  	33479			//0x82c7
*/
 
void initDev(void);

void WrRd_PHS(void);
void Rd_PHS(void);
void Wr_R(void);
void Rd_general1(void);
void Rd_general2(void);
void Rd_general3(void);
void Rd_general4(void);
void Rd_general6(void);
void Rd_general7(void);
void Rd_general8(void);

void Wr_PHS_FPGA(unsigned short,unsigned char);
void Wr_CTRL_FPGA(unsigned short,unsigned char);
unsigned char Rd_PHS_FPGA(unsigned short);
unsigned char Rd_CTRL_FPGA(unsigned short);

void Trigger(void);
unsigned short _crol_(unsigned short,int,int);

int main(int argc,char *argv[])
{

initDev();

	while(1)
	{
		int a; 
		printf("FUNCTIONS LIST:\n");
		printf("***********************crtl_fpga functions***********************\n");	
		printf("1、RD Inlet Air Tempreature\n");
		printf("2、RD Outlet Air Temperature\n");
		printf("3、RD Fan Speed\n");
		printf("4、RD Power switch\n");
		printf("5、WR Resistor\n");
		printf("6、RD Resistor\n");
		printf("7、RD voltage\n");
		printf("8、RD current\n");
		printf("***********************phs_fpga functions************************\n");
		printf("9、WR_RD Phase\n");
		printf("10、RD Phase\n");
		printf("11、Trigger\n");
		printf("Choose function num="); 
		
		scanf("%d",&a);
		printf("Function=%d\n",a); 
		if(a==1)	
		{/*printf("Register_addr:IN_AIR_TV_BYTE_ADDR  32840;	IN_AIR_TV_BYTE_END		32844\n");*/
		Rd_general1();} 
		if(a==2)	
		{/*printf("Register_addr:OUT_AIR_TV_BYTE_ADDR 32868;	OUT_AIR_TV_BYTE_END 	32880\n");*/
		Rd_general2();} 
		if(a==3)	
		{/*printf("Register_addr:FAN_RPM_BYTE_ADDR 	32896;	OUT_AIR_TV_BYTE_END 	32897\n");*/
		Rd_general3();} 
		if(a==4)	
		{/*printf("Register_addr:AMP_PW_SW_BYTE_ADDR 	32904;	AMP_PW_SW_BYTE_END 		33156\n");*/
		Rd_general4();} 
		if(a==5)
		{Wr_R();}
		if(a==6)	
		{/*printf("Register_addr:AMP_RV_BYTE_ADDR 	33224;	AMP_RV_BYTE_END 		33287\n");*/
		Rd_general6();} 
		if(a==7)	
		{/*printf("Register_addr:AMP_VV_BYTE_ADDR 	33288;	AMP_VV_BYTE_END 		33351\n");*/
		Rd_general7();} 
		if(a==8)	
		{/*printf("Register_addr:AMP_AV_BYTE_ADDR 	33416;	AMP_AV_BYTE_END 		33479\n");*/
		Rd_general8();} 
		if(a==9)
		{WrRd_PHS();}
		if(a==10)
		{Rd_PHS();}
		if(a==11)
		{Trigger();}
		printf("\n");
	} 	
}






void initDev(void)
{
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
    	
    //Initializes the device
    I2C_Config.AddrType = VII_ADDR_7BIT;
    I2C_Config.ClockSpeed = 10000;
    I2C_Config.ControlMode = VII_HCTL_MODE;
    I2C_Config.MasterMode = VII_MASTER;
    I2C_Config.SubAddrWidth = VII_SUB_ADDR_2BYTE;
    ret = VII_InitI2C(VII_USBI2C, 0, 0, &I2C_Config);
    if (ret != ERR_SUCCESS)
    {
        printf("Initialize device error!\n");
        exit(0);
    }
}

// PHS_FPGA Board: write and read PHS
void WrRd_PHS(void)
{
	unsigned char value;
	unsigned char value_tmp;
	unsigned char res_reg;
	unsigned short i;
	
	printf("Input :Phs_value = ");		
	scanf("%d",&value_tmp);
	value=value_tmp;
	for(i=PF_PHS_DIR_BYTE_ADDR;i<=PF_PHS_DIR_BYTE_END;i=i+1)
	{
		Wr_PHS_FPGA(_crol_(i,16,8),value);
    	res_reg=Rd_PHS_FPGA(_crol_(i,16,8));
		printf("PHS_0x%x = %d\n",i-PF_PHS_DIR_BYTE_ADDR,res_reg);
	}
	Trigger();
}

//PHS_FPGA Board: read PHS
void Rd_PHS(void)
{
	unsigned char res_reg=0;
	unsigned short i;
	
	for(i=i-PF_PHS_DIR_BYTE_ADDR;i<=PF_PHS_DIR_BYTE_END;i++)
	{
    	res_reg=Rd_PHS_FPGA(_crol_(i,16,8));
		printf("PHS_0x%x = %d\n",i-PF_PHS_DIR_BYTE_ADDR,res_reg);
	}
}

//CTRL_FPGA Board: Write resistor
void Wr_R()
{
	unsigned char value;
	unsigned char res_reg=0;	
	unsigned short i;	
//	printf("Input :Resistor_value = ");		
//	scanf("%d",&value);
	for(i=0X8188;i<=0X81c7;i++)
	{
		Wr_CTRL_FPGA(_crol_(i,16,8),i);
	//	res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
	//	printf("read addr%d data =%d\n",i-0X8000,res_reg);
	}
}


//CTRL_FPGA Board: 
void Rd_general1()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;

//	printf("Input :reg_addr_start = ");		
//	scanf("%d",&reg_addr_start1);
//	reg_addr_start=reg_addr_start1;	

//	printf("Input :reg_addr_end   = ");		
//	scanf("%d",&reg_addr_end1);	
//	reg_addr_end=reg_addr_end1;
//	for(i=0x8a00;i<=0x8a00;i++)
	for(i=0x8048;i<=0x804c;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general2()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=0x8064;i<=0x8070;i++)
	//for(i=0x8b00;i<=0x8b00;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general3()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=32896;i<=32897;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general4()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=32904;i<=33156;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general6()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=33224;i<=33287;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general7()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=0x8208;i<=0x8247;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}

void Rd_general8()
{
	unsigned short reg_addr_start1;
	unsigned short reg_addr_start;
	unsigned short reg_addr_end;
	unsigned short reg_addr_end1;
	unsigned char res_reg;	
	unsigned short i;
	for(i=0x8288;i<=0x82c7;i++)
	{	
		res_reg = Rd_CTRL_FPGA (_crol_(i,16,8));
		printf("read addr0x%x  = 0x%x\n",i,res_reg);
	}
}




//write to phs_FPGA
void Wr_PHS_FPGA(unsigned short PHS_FPGA_res_addr,unsigned char res)
{
	char ret = VII_WriteBytes(VII_USBI2C, 0, 0, PHS_FPGA_I2C_SLV_ADDR_7BIT, PHS_FPGA_res_addr, &res, 1);
		if (ret != ERR_SUCCESS) 
		{ 
			printf("Write PHS_FPGA Error\n");
			exit(0);
		}
}

//read from phs_FPGA
unsigned char Rd_PHS_FPGA(unsigned short PHS_FPGA_res_addr)
{
	uint8_t PHS_FPGA_reg;
	Sleep(RES_WR_RD_INTERVAL);
	char ret = VII_ReadBytes(VII_USBI2C, 0, 0, PHS_FPGA_I2C_SLV_ADDR_7BIT, PHS_FPGA_res_addr, &PHS_FPGA_reg, 1);
		if (ret != ERR_SUCCESS)
		{	
			printf("Read PHS_FPGA Error\n");
			exit(0);
		}
	return PHS_FPGA_reg;
}

//write to ctrl_FPGA,if two usb-i2c adapters are used, the DevIndex is 1
void Wr_CTRL_FPGA(unsigned short CTRL_FPGA_res_addr,unsigned char res)
{
	char ret = VII_WriteBytes(VII_USBI2C, 0, 0, CTRL_FPGA_I2C_SLV_ADDR_7BIT, CTRL_FPGA_res_addr, &res, 1);
		if (ret != ERR_SUCCESS) 
		{ 
		printf("Write CTR_FPGA Error\n");
		exit(0);
		}
}

//read from ctrl_FPGA,if two usb-i2c adapters are used, the DevIndex is 1
unsigned char Rd_CTRL_FPGA(unsigned short CTRL_FPGA_res_addr)
{
	unsigned char CTRL_FPGA_reg;
	Sleep(RES_WR_RD_INTERVAL);
	char ret = VII_ReadBytes(VII_USBI2C, 0, 0, CTRL_FPGA_I2C_SLV_ADDR_7BIT, CTRL_FPGA_res_addr, &CTRL_FPGA_reg, 1);
		if (ret != ERR_SUCCESS)
		{		
			printf("Read CTRL_FPGA Error\n");
			exit(0);
		}
	return CTRL_FPGA_reg;
}

void Trigger(void)
{
	int ret;
	ret = VGI_SetOutput(VGI_USBGPIO, 0, VGI_GPIO_PIN0);
		if (ret != ERR_SUCCESS)
		printf("Set pin output error!\n");
	ret = VGI_SetPins(VGI_USBGPIO, 0, VGI_GPIO_PIN0);
		if (ret != ERR_SUCCESS)
		printf("Set pin high error!\n");	
}

//Circulatory left shift  
unsigned short _crol_(unsigned short a,int n,int i)
{
	unsigned short 	temp;
	temp=a>>(n-i);
	a=a<<i;
	a=a|temp;
	return a;
}


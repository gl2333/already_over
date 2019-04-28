#include "test.hpp"
#include "amp.hpp"


void test_1_1 (void){
	printf("\n");
    printf("\Start Test 1.1 \n");
    
    	//循环向电阻寄存器写入i*20的值，同时读取电压电流值  
	for(int i=0;i<13;i++){
		resWr(i*20);
		Sleep(500); 
	
	    float a =getV();
		float b =getA();
		printf("v=%f,A=%f\n",a,b);	
	}
	
	resWr(255);    
   
}

void test_1_2 (void){
	printf("\n");
    printf("    Start Test 1.2 \n");
    
    //循环向电阻寄存器写入0xFF,0x00,0x5A,0xA5，同时读取电压电流值 
	for(int i=0;i<100;i++){
		resWr(i*20);
		Sleep(500); 
	    resWr(0xFF);
	    Sleep(500);
	    float a =getV();
		float b =getA();
		printf("v=%f,A=%f\n",a,b);
	
	    resWr(0x00);
	    Sleep(500);
	    a =getV();
		b =getA();
		printf("v=%f,A=%f\n",a,b);
	
	    resWr(0x5A);
	    Sleep(500);
	    a =getV();
		b =getA();
		printf("v=%f,A=%f\n",a,b);
	
	    resWr(0xA5);
	    Sleep(500);
		a =getV();
		b =getA();
		printf("v=%f,A=%f\n",a,b);		
	}	
	
	resWr(255);
}

void test_1_3 (void){
	printf("\n");
    printf("    Start Test 1.3 \n");
    
    //向电阻寄存器写255，读取电压电流值
	resWr(255);
	Sleep(500); 
	float a =getV();
	float b =getA();
	printf("v=%f,A=%f\n",a,b);
	
}

void test_1_4 (void){
	printf("\n");
    printf("    Start Test 1.4 \n");
    //向电阻寄存器写0，读取电压电流值
	resWr(0);
	Sleep(500); 
	float a =getV();
	float b =getA();
	printf("v=%f,A=%f\n",a,b);
	
}

void test_1_5 (void){
	printf("\n");
    printf("    Start Test 1.5 \n");
    //向flash写入产品信息：SDHW-PAU-PCB-AMP-VI-2018-32 
	char data[]="SDHW-PAU-PCB-AMP-VI-2018-32";
	int length=sizeof(data)-1;
	uint16_t page_res_addr=0x0021;//flash page 1的地址是两个字节：0x0021
	wr_rd_flash(data,page_res_addr,length);//写读产品信息 
}

void test_1_6 (void){
	printf("\n");
    printf("    Start Test 1.6 \n");

}

void test_1_7 (void){
	printf("\n");
    printf("    Start Test 1.7 \n");

}

void test_1_8 (void){
	printf("\n");
    printf("    Start Test 1.8 \n");

}

void test_1_9 (void){
	printf("\n");
    printf("    Start Test 1.9 \n");

}

void test_1_10(void){
	printf("\n");
    printf("    Start Test 1.10\n");

}

void test_2_1 (void){
	printf("\n");
    printf("    Start Test 2.1 \n");

}

void test_2_2 (void){
	printf("\n");
    printf("    Start Test 2.2 \n");

}

void test_2_3 (void){
	printf("\n");
    printf("    Start Test 2.3 \n");

}

void test_2_4 (void){
	printf("\n");
    printf("    Start Test 2.4 \n");

}

void test_2_5 (void){
	printf("\n");
    printf("    Start Test 2.5 \n");

}

void test_2_6 (void){
	printf("\n");
    printf("    Start Test 2.6 \n");

}

void test_2_7 (void){
	printf("\n");
    printf("    Start Test 2.7 \n");

}

void test_2_8 (void){
	printf("\n");
    printf("    Start Test 2.8 \n");

}

void test_2_9 (void){
	printf("\n");
    printf("    Start Test 2.9 \n");

}

void test_2_10(void){
	printf("\n");
    printf("    Start Test 2.10\n");

}

void test_3_1 (void){
	printf("\n");
    printf("    Start Test 3.1 \n");

}

void test_3_2 (void){
	printf("\n");
    printf("    Start Test 3.2 \n");

}

void test_3_3 (void){
	printf("\n");
    printf("    Start Test 3.3 \n");

}

void test_3_4 (void){
	printf("\n");
    printf("    Start Test 3.4 \n");

}

void test_3_5 (void){
	printf("\n");
    printf("    Start Test 3.5 \n");

}

void test_3_6 (void){
	printf("\n");
    printf("    Start Test 3.6 \n");

}

void test_3_7 (void){
	printf("\n");
    printf("    Start Test 3.7 \n");
	
}

void test_3_8 (void){
	printf("\n");
    printf("    Start Test 3.8 \n");

}

void test_3_9 (void){
	printf("\n");
    printf("    Start Test 3.9 \n");

}

void test_3_10(void){
	printf("\n");
    printf("    Start Test 3.10\n");

}

void test_4_1 (void){
	printf("\n");
    printf("    Start Test 4.1 \n");

}

void test_4_2 (void){
	printf("\n");
    printf("    Start Test 4.2 \n");

}

void test_4_3 (void){
	printf("\n");
    printf("    Start Test 4.3 \n");

}

void test_4_4 (void){
	printf("\n");
    printf("    Start Test 4.4 \n");

}

void test_4_5 (void){
	printf("\n");
    printf("    Start Test 4.5 \n");

}

void test_4_6 (void){
	printf("\n");
    printf("    Start Test 4.6 \n");

}

void test_4_7 (void){
	printf("\n");
    printf("    Start Test 4.7 \n");

}

void test_4_8 (void){
	printf("\n");
    printf("    Start Test 4.8 \n");

}

void test_4_9 (void){
	printf("\n");
    printf("    Start Test 4.9 \n");

}

void test_4_10(void){
	printf("\n");
    printf("    Start Test 4.10\n");

}

void test_5_1 (void){
	printf("\n");
    printf("    Start Test 5.1 \n");

}

void test_5_2 (void){
	printf("\n");
    printf("    Start Test 5.2 \n");

}

void test_5_3 (void){
	printf("\n");
    printf("    Start Test 5.3 \n");

}

void test_5_4 (void){
	printf("\n");
    printf("    Start Test 5.4 \n");

}

void test_5_5 (void){
	printf("\n");
    printf("    Start Test 5.5 \n");

}

void test_5_6 (void){
	printf("\n");
    printf("    Start Test 5.6 \n");

}

void test_5_7 (void){
	printf("\n");
    printf("    Start Test 5.7 \n");

}

void test_5_8 (void){
	printf("\n");
    printf("    Start Test 5.8 \n");

}

void test_5_9 (void){
	printf("\n");
    printf("    Start Test 5.9 \n");

}

void test_5_10(void){
	printf("\n");
    printf("    Start Test 5.10\n");

}

void test_6_1 (void){
	printf("\n");
    printf("    Start Test 6.1 \n");

}

void test_6_2 (void){
	printf("\n");
    printf("    Start Test 6.2 \n");

}

void test_6_3 (void){
	printf("\n");
    printf("    Start Test 6.3 \n");

}

void test_6_4 (void){
	printf("\n");
    printf("    Start Test 6.4 \n");

}

void test_6_5 (void){
	printf("\n");
    printf("    Start Test 6.5 \n");

}

void test_6_6 (void){
	printf("\n");
    printf("    Start Test 6.6 \n");

}

void test_6_7 (void){
	printf("\n");
    printf("    Start Test 6.7 \n");

}

void test_6_8 (void){
	printf("\n");
    printf("    Start Test 6.8 \n");

}

void test_6_9 (void){
	printf("\n");
    printf("    Start Test 6.9 \n");

}

void test_6_10(void){
	printf("\n");
    printf("    Start Test 6.10\n");

}




`ifndef ZYNQFPGAREGDEF__V__
    `define ZYNQFPGAREGDEF__V__

    `define SHENDE_MEDICAL_ID    "TMednehS"
    `define FIRMWARE_COMPILE_DATE 32'h20180620
    `define FIRMWARE_COMPILE_TIME 32'h00115104 


/////////////////////////////////////////////////////////////////////////////
//ZYNQ FPGA General
/////////////////////////////////////////////////////////////////////////////
//Scratch Register, for read and write test
    `define ZYNQ_GEN_SCR_NUM       1
    `define ZYNQ_GEN_SCR_BIT_WID   8
    `define ZYNQ_GEN_SCR_ADDR      100	//32bit width addr
    `define ZYNQ_GEN_SCR_SIZE      1		//32bit width size
    `define ZYNQ_GEN_SCR_END       100	//32bit width addr
    `define ZYNQ_GEN_SCR_BYTE_ADDR 16'h0190//8bit width addr
    `define ZYNQ_GEN_SCR_BYTE_WID  1		//8bit width size
    `define ZYNQ_GEN_SCR_BYTE_END  16'h0190//8bit width addr

//ShendeMT = Shende Medical Technology
    `define ZYNQ_GEN_ID_NUM       1
    `define ZYNQ_GEN_ID_BIT_WID   64
    `define ZYNQ_GEN_ID_ADDR      101	//32bit width addr
    `define ZYNQ_GEN_ID_SIZE      2		//32bit width size
    `define ZYNQ_GEN_ID_END       102	//32bit width addr
    `define ZYNQ_GEN_ID_BYTE_ADDR 16'h0194//8bit width addr
    `define ZYNQ_GEN_ID_BYTE_WID  8		//8bit width size
    `define ZYNQ_GEN_ID_BYTE_END  16'h019b//8bit width addr

//Serial Number, for Manufacturing
    `define ZYNQ_GEN_SN_NUM       1
    `define ZYNQ_GEN_SN_BIT_WID   64
    `define ZYNQ_GEN_SN_ADDR      103	//32bit width addr
    `define ZYNQ_GEN_SN_SIZE      2		//32bit width size
    `define ZYNQ_GEN_SN_END       104	//32bit width addr
    `define ZYNQ_GEN_SN_BYTE_ADDR 16'h019c//8bit width addr
    `define ZYNQ_GEN_SN_BYTE_WID  8		//8bit width size
    `define ZYNQ_GEN_SN_BYTE_END  16'h01a3//8bit width addr

//Firmware Version ,compile date
    `define ZYNQ_GEN_FM_NUM       1
    `define ZYNQ_GEN_FM_BIT_WID   64
    `define ZYNQ_GEN_FM_ADDR      105	//32bit width addr
    `define ZYNQ_GEN_FM_SIZE      2		//32bit width size
    `define ZYNQ_GEN_FM_END       106	//32bit width addr
    `define ZYNQ_GEN_FM_BYTE_ADDR 16'h01a4//8bit width addr
    `define ZYNQ_GEN_FM_BYTE_WID  8		//8bit width size
    `define ZYNQ_GEN_FM_BYTE_END  16'h01ab//8bit width addr

//FPGA factory-programmed,read-onlyuniqueID
    `define ZYNQ_GEN_DNA_NUM       1
    `define ZYNQ_GEN_DNA_BIT_WID   57
    `define ZYNQ_GEN_DNA_ADDR      107	//32bit width addr
    `define ZYNQ_GEN_DNA_SIZE      2		//32bit width size
    `define ZYNQ_GEN_DNA_END       108	//32bit width addr
    `define ZYNQ_GEN_DNA_BYTE_ADDR 16'h01ac//8bit width addr
    `define ZYNQ_GEN_DNA_BYTE_WID  8		//8bit width size
    `define ZYNQ_GEN_DNA_BYTE_END  16'h01b3//8bit width addr

//Pass Word, for Safety and anti-cloning
    `define ZYNQ_GEN_PW_NUM       1
    `define ZYNQ_GEN_PW_BIT_WID   64
    `define ZYNQ_GEN_PW_ADDR      109	//32bit width addr
    `define ZYNQ_GEN_PW_SIZE      2		//32bit width size
    `define ZYNQ_GEN_PW_END       110	//32bit width addr
    `define ZYNQ_GEN_PW_BYTE_ADDR 16'h01b4//8bit width addr
    `define ZYNQ_GEN_PW_BYTE_WID  8		//8bit width size
    `define ZYNQ_GEN_PW_BYTE_END  16'h01bb//8bit width addr

//1 verified, 0 illegal
    `define ZYNQ_GEN_VF_NUM       1
    `define ZYNQ_GEN_VF_BIT_WID   1
    `define ZYNQ_GEN_VF_ADDR      111	//32bit width addr
    `define ZYNQ_GEN_VF_SIZE      1		//32bit width size
    `define ZYNQ_GEN_VF_END       111	//32bit width addr
    `define ZYNQ_GEN_VF_BYTE_ADDR 16'h01bc//8bit width addr
    `define ZYNQ_GEN_VF_BYTE_WID  1		//8bit width size
    `define ZYNQ_GEN_VF_BYTE_END  16'h01bc//8bit width addr

//FPGA software reset
    `define ZYNQ_GEN_RST_NUM       1
    `define ZYNQ_GEN_RST_BIT_WID   1
    `define ZYNQ_GEN_RST_ADDR      112	//32bit width addr
    `define ZYNQ_GEN_RST_SIZE      1		//32bit width size
    `define ZYNQ_GEN_RST_END       112	//32bit width addr
    `define ZYNQ_GEN_RST_BYTE_ADDR 16'h01c0//8bit width addr
    `define ZYNQ_GEN_RST_BYTE_WID  1		//8bit width size
    `define ZYNQ_GEN_RST_BYTE_END  16'h01c0//8bit width addr

//Reserved for future use
    `define ZYNQ_GEN_RSV_NUM       1
    `define ZYNQ_GEN_RSV_BIT_WID   512
    `define ZYNQ_GEN_RSV_ADDR      113	//32bit width addr
    `define ZYNQ_GEN_RSV_SIZE      16		//32bit width size
    `define ZYNQ_GEN_RSV_END       128	//32bit width addr
    `define ZYNQ_GEN_RSV_BYTE_ADDR 16'h01c4//8bit width addr
    `define ZYNQ_GEN_RSV_BYTE_WID  64		//8bit width size
    `define ZYNQ_GEN_RSV_BYTE_END  16'h0203//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Emergency Stop switch
/////////////////////////////////////////////////////////////////////////////
//Doctor EMS status, 0 released, 1 pressed
    `define EMS_DOC_STA_NUM       1
    `define EMS_DOC_STA_BIT_WID   1
    `define EMS_DOC_STA_ADDR      129	//32bit width addr
    `define EMS_DOC_STA_SIZE      1		//32bit width size
    `define EMS_DOC_STA_END       129	//32bit width addr
    `define EMS_DOC_STA_BYTE_ADDR 16'h0204//8bit width addr
    `define EMS_DOC_STA_BYTE_WID  1		//8bit width size
    `define EMS_DOC_STA_BYTE_END  16'h0204//8bit width addr

//Paitent EMS status, 0 released, 1 pressed
    `define EMS_PAT_STA_NUM       1
    `define EMS_PAT_STA_BIT_WID   1
    `define EMS_PAT_STA_ADDR      130	//32bit width addr
    `define EMS_PAT_STA_SIZE      1		//32bit width size
    `define EMS_PAT_STA_END       130	//32bit width addr
    `define EMS_PAT_STA_BYTE_ADDR 16'h0208//8bit width addr
    `define EMS_PAT_STA_BYTE_WID  1		//8bit width size
    `define EMS_PAT_STA_BYTE_END  16'h0208//8bit width addr

//Reserved for future use
    `define EMS_RSV_NUM       1
    `define EMS_RSV_BIT_WID   512
    `define EMS_RSV_ADDR      131	//32bit width addr
    `define EMS_RSV_SIZE      16		//32bit width size
    `define EMS_RSV_END       146	//32bit width addr
    `define EMS_RSV_BYTE_ADDR 16'h020c//8bit width addr
    `define EMS_RSV_BYTE_WID  64		//8bit width size
    `define EMS_RSV_BYTE_END  16'h024b//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Clock frequency I2C module
/////////////////////////////////////////////////////////////////////////////
//Read Only; Read 0, free, auto turn to 1; Read 1 is occupied, wait
    `define CLK_I2C_MUTEX_NUM       1
    `define CLK_I2C_MUTEX_BIT_WID   1
    `define CLK_I2C_MUTEX_ADDR      147	//32bit width addr
    `define CLK_I2C_MUTEX_SIZE      1		//32bit width size
    `define CLK_I2C_MUTEX_END       147	//32bit width addr
    `define CLK_I2C_MUTEX_BYTE_ADDR 16'h024c//8bit width addr
    `define CLK_I2C_MUTEX_BYTE_WID  1		//8bit width size
    `define CLK_I2C_MUTEX_BYTE_END  16'h024c//8bit width addr

//Reset, 1 reset, 0 work
    `define CLK_I2C_RST_NUM       1
    `define CLK_I2C_RST_BIT_WID   1
    `define CLK_I2C_RST_ADDR      148	//32bit width addr
    `define CLK_I2C_RST_SIZE      1		//32bit width size
    `define CLK_I2C_RST_END       148	//32bit width addr
    `define CLK_I2C_RST_BYTE_ADDR 16'h0250//8bit width addr
    `define CLK_I2C_RST_BYTE_WID  1		//8bit width size
    `define CLK_I2C_RST_BYTE_END  16'h0250//8bit width addr

//Write buffer
    `define CLK_I2C_WR_BUF_NUM       1
    `define CLK_I2C_WR_BUF_BIT_WID   1880
    `define CLK_I2C_WR_BUF_ADDR      149	//32bit width addr
    `define CLK_I2C_WR_BUF_SIZE      59		//32bit width size
    `define CLK_I2C_WR_BUF_END       207	//32bit width addr
    `define CLK_I2C_WR_BUF_BYTE_ADDR 16'h0254//8bit width addr
    `define CLK_I2C_WR_BUF_BYTE_WID  235		//8bit width size
    `define CLK_I2C_WR_BUF_BYTE_END  16'h033e//8bit width addr

//Write buffer length
    `define CLK_I2C_WR_LEN_NUM       1
    `define CLK_I2C_WR_LEN_BIT_WID   8
    `define CLK_I2C_WR_LEN_ADDR      208	//32bit width addr
    `define CLK_I2C_WR_LEN_SIZE      1		//32bit width size
    `define CLK_I2C_WR_LEN_END       208	//32bit width addr
    `define CLK_I2C_WR_LEN_BYTE_ADDR 16'h0340//8bit width addr
    `define CLK_I2C_WR_LEN_BYTE_WID  1		//8bit width size
    `define CLK_I2C_WR_LEN_BYTE_END  16'h0340//8bit width addr

//Read buffer
    `define CLK_I2C_RD_BUF_NUM       1
    `define CLK_I2C_RD_BUF_BIT_WID   1880
    `define CLK_I2C_RD_BUF_ADDR      209	//32bit width addr
    `define CLK_I2C_RD_BUF_SIZE      59		//32bit width size
    `define CLK_I2C_RD_BUF_END       267	//32bit width addr
    `define CLK_I2C_RD_BUF_BYTE_ADDR 16'h0344//8bit width addr
    `define CLK_I2C_RD_BUF_BYTE_WID  235		//8bit width size
    `define CLK_I2C_RD_BUF_BYTE_END  16'h042e//8bit width addr

//Read buffer length
    `define CLK_I2C_RD_LEN_NUM       1
    `define CLK_I2C_RD_LEN_BIT_WID   8
    `define CLK_I2C_RD_LEN_ADDR      268	//32bit width addr
    `define CLK_I2C_RD_LEN_SIZE      1		//32bit width size
    `define CLK_I2C_RD_LEN_END       268	//32bit width addr
    `define CLK_I2C_RD_LEN_BYTE_ADDR 16'h0430//8bit width addr
    `define CLK_I2C_RD_LEN_BYTE_WID  1		//8bit width size
    `define CLK_I2C_RD_LEN_BYTE_END  16'h0430//8bit width addr

//Start operation when write any value
    `define CLK_I2C_START_NUM       1
    `define CLK_I2C_START_BIT_WID   1
    `define CLK_I2C_START_ADDR      269	//32bit width addr
    `define CLK_I2C_START_SIZE      1		//32bit width size
    `define CLK_I2C_START_END       269	//32bit width addr
    `define CLK_I2C_START_BYTE_ADDR 16'h0434//8bit width addr
    `define CLK_I2C_START_BYTE_WID  1		//8bit width size
    `define CLK_I2C_START_BYTE_END  16'h0434//8bit width addr

//Status, 1 busy, 0 idle
    `define CLK_I2C_BUSY_NUM       1
    `define CLK_I2C_BUSY_BIT_WID   1
    `define CLK_I2C_BUSY_ADDR      270	//32bit width addr
    `define CLK_I2C_BUSY_SIZE      1		//32bit width size
    `define CLK_I2C_BUSY_END       270	//32bit width addr
    `define CLK_I2C_BUSY_BYTE_ADDR 16'h0438//8bit width addr
    `define CLK_I2C_BUSY_BYTE_WID  1		//8bit width size
    `define CLK_I2C_BUSY_BYTE_END  16'h0438//8bit width addr

//Line error, 1 error, 0 OK
    `define CLK_I2C_LERR_NUM       1
    `define CLK_I2C_LERR_BIT_WID   1
    `define CLK_I2C_LERR_ADDR      271	//32bit width addr
    `define CLK_I2C_LERR_SIZE      1		//32bit width size
    `define CLK_I2C_LERR_END       271	//32bit width addr
    `define CLK_I2C_LERR_BYTE_ADDR 16'h043c//8bit width addr
    `define CLK_I2C_LERR_BYTE_WID  1		//8bit width size
    `define CLK_I2C_LERR_BYTE_END  16'h043c//8bit width addr

//Nack error, 1 error, 0 OK
    `define CLK_I2C_NERR_NUM       1
    `define CLK_I2C_NERR_BIT_WID   1
    `define CLK_I2C_NERR_ADDR      272	//32bit width addr
    `define CLK_I2C_NERR_SIZE      1		//32bit width size
    `define CLK_I2C_NERR_END       272	//32bit width addr
    `define CLK_I2C_NERR_BYTE_ADDR 16'h0440//8bit width addr
    `define CLK_I2C_NERR_BYTE_WID  1		//8bit width size
    `define CLK_I2C_NERR_BYTE_END  16'h0440//8bit width addr

//Hardware debug
    `define CLK_I2C_DEBUG_NUM       1
    `define CLK_I2C_DEBUG_BIT_WID   16
    `define CLK_I2C_DEBUG_ADDR      273	//32bit width addr
    `define CLK_I2C_DEBUG_SIZE      1		//32bit width size
    `define CLK_I2C_DEBUG_END       273	//32bit width addr
    `define CLK_I2C_DEBUG_BYTE_ADDR 16'h0444//8bit width addr
    `define CLK_I2C_DEBUG_BYTE_WID  2		//8bit width size
    `define CLK_I2C_DEBUG_BYTE_END  16'h0445//8bit width addr

//clock prescaler, PRES = 100,000,000/2/BaudRate
    `define CLK_I2C_PRES_NUM       1
    `define CLK_I2C_PRES_BIT_WID   16
    `define CLK_I2C_PRES_ADDR      274	//32bit width addr
    `define CLK_I2C_PRES_SIZE      1		//32bit width size
    `define CLK_I2C_PRES_END       274	//32bit width addr
    `define CLK_I2C_PRES_BYTE_ADDR 16'h0448//8bit width addr
    `define CLK_I2C_PRES_BYTE_WID  2		//8bit width size
    `define CLK_I2C_PRES_BYTE_END  16'h0449//8bit width addr

//Reserved for future use
    `define CLK_I2C_RSV_NUM       1
    `define CLK_I2C_RSV_BIT_WID   512
    `define CLK_I2C_RSV_ADDR      275	//32bit width addr
    `define CLK_I2C_RSV_SIZE      16		//32bit width size
    `define CLK_I2C_RSV_END       290	//32bit width addr
    `define CLK_I2C_RSV_BYTE_ADDR 16'h044c//8bit width addr
    `define CLK_I2C_RSV_BYTE_WID  64		//8bit width size
    `define CLK_I2C_RSV_BYTE_END  16'h048b//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//RTC I2C master 
/////////////////////////////////////////////////////////////////////////////
//Read Only; Read 0, free, auto turn to 1; Read 1 is occupied, wait
    `define RTC_I2C_MUTEX_NUM       1
    `define RTC_I2C_MUTEX_BIT_WID   1
    `define RTC_I2C_MUTEX_ADDR      291	//32bit width addr
    `define RTC_I2C_MUTEX_SIZE      1		//32bit width size
    `define RTC_I2C_MUTEX_END       291	//32bit width addr
    `define RTC_I2C_MUTEX_BYTE_ADDR 16'h048c//8bit width addr
    `define RTC_I2C_MUTEX_BYTE_WID  1		//8bit width size
    `define RTC_I2C_MUTEX_BYTE_END  16'h048c//8bit width addr

//Reset, 1 reset, 0 work, always 0, can't write
    `define RTC_I2C_RST_NUM       1
    `define RTC_I2C_RST_BIT_WID   1
    `define RTC_I2C_RST_ADDR      292	//32bit width addr
    `define RTC_I2C_RST_SIZE      1		//32bit width size
    `define RTC_I2C_RST_END       292	//32bit width addr
    `define RTC_I2C_RST_BYTE_ADDR 16'h0490//8bit width addr
    `define RTC_I2C_RST_BYTE_WID  1		//8bit width size
    `define RTC_I2C_RST_BYTE_END  16'h0490//8bit width addr

//Write buffer
    `define RTC_I2C_WR_BUF_NUM       1
    `define RTC_I2C_WR_BUF_BIT_WID   160
    `define RTC_I2C_WR_BUF_ADDR      293	//32bit width addr
    `define RTC_I2C_WR_BUF_SIZE      5		//32bit width size
    `define RTC_I2C_WR_BUF_END       297	//32bit width addr
    `define RTC_I2C_WR_BUF_BYTE_ADDR 16'h0494//8bit width addr
    `define RTC_I2C_WR_BUF_BYTE_WID  20		//8bit width size
    `define RTC_I2C_WR_BUF_BYTE_END  16'h04a7//8bit width addr

//Write buffer length
    `define RTC_I2C_WR_LEN_NUM       1
    `define RTC_I2C_WR_LEN_BIT_WID   5
    `define RTC_I2C_WR_LEN_ADDR      298	//32bit width addr
    `define RTC_I2C_WR_LEN_SIZE      1		//32bit width size
    `define RTC_I2C_WR_LEN_END       298	//32bit width addr
    `define RTC_I2C_WR_LEN_BYTE_ADDR 16'h04a8//8bit width addr
    `define RTC_I2C_WR_LEN_BYTE_WID  1		//8bit width size
    `define RTC_I2C_WR_LEN_BYTE_END  16'h04a8//8bit width addr

//Read buffer
    `define RTC_I2C_RD_BUF_NUM       1
    `define RTC_I2C_RD_BUF_BIT_WID   128
    `define RTC_I2C_RD_BUF_ADDR      299	//32bit width addr
    `define RTC_I2C_RD_BUF_SIZE      4		//32bit width size
    `define RTC_I2C_RD_BUF_END       302	//32bit width addr
    `define RTC_I2C_RD_BUF_BYTE_ADDR 16'h04ac//8bit width addr
    `define RTC_I2C_RD_BUF_BYTE_WID  16		//8bit width size
    `define RTC_I2C_RD_BUF_BYTE_END  16'h04bb//8bit width addr

//Read buffer length
    `define RTC_I2C_RD_LEN_NUM       1
    `define RTC_I2C_RD_LEN_BIT_WID   5
    `define RTC_I2C_RD_LEN_ADDR      303	//32bit width addr
    `define RTC_I2C_RD_LEN_SIZE      1		//32bit width size
    `define RTC_I2C_RD_LEN_END       303	//32bit width addr
    `define RTC_I2C_RD_LEN_BYTE_ADDR 16'h04bc//8bit width addr
    `define RTC_I2C_RD_LEN_BYTE_WID  1		//8bit width size
    `define RTC_I2C_RD_LEN_BYTE_END  16'h04bc//8bit width addr

//Start operation when write any value
    `define RTC_I2C_START_NUM       1
    `define RTC_I2C_START_BIT_WID   1
    `define RTC_I2C_START_ADDR      304	//32bit width addr
    `define RTC_I2C_START_SIZE      1		//32bit width size
    `define RTC_I2C_START_END       304	//32bit width addr
    `define RTC_I2C_START_BYTE_ADDR 16'h04c0//8bit width addr
    `define RTC_I2C_START_BYTE_WID  1		//8bit width size
    `define RTC_I2C_START_BYTE_END  16'h04c0//8bit width addr

//Status, 1 busy, 0 idle
    `define RTC_I2C_BUSY_NUM       1
    `define RTC_I2C_BUSY_BIT_WID   1
    `define RTC_I2C_BUSY_ADDR      305	//32bit width addr
    `define RTC_I2C_BUSY_SIZE      1		//32bit width size
    `define RTC_I2C_BUSY_END       305	//32bit width addr
    `define RTC_I2C_BUSY_BYTE_ADDR 16'h04c4//8bit width addr
    `define RTC_I2C_BUSY_BYTE_WID  1		//8bit width size
    `define RTC_I2C_BUSY_BYTE_END  16'h04c4//8bit width addr

//Line error, 1 error, 0 OK
    `define RTC_I2C_LERR_NUM       1
    `define RTC_I2C_LERR_BIT_WID   1
    `define RTC_I2C_LERR_ADDR      306	//32bit width addr
    `define RTC_I2C_LERR_SIZE      1		//32bit width size
    `define RTC_I2C_LERR_END       306	//32bit width addr
    `define RTC_I2C_LERR_BYTE_ADDR 16'h04c8//8bit width addr
    `define RTC_I2C_LERR_BYTE_WID  1		//8bit width size
    `define RTC_I2C_LERR_BYTE_END  16'h04c8//8bit width addr

//Nack error, 1 error, 0 OK
    `define RTC_I2C_NERR_NUM       1
    `define RTC_I2C_NERR_BIT_WID   1
    `define RTC_I2C_NERR_ADDR      307	//32bit width addr
    `define RTC_I2C_NERR_SIZE      1		//32bit width size
    `define RTC_I2C_NERR_END       307	//32bit width addr
    `define RTC_I2C_NERR_BYTE_ADDR 16'h04cc//8bit width addr
    `define RTC_I2C_NERR_BYTE_WID  1		//8bit width size
    `define RTC_I2C_NERR_BYTE_END  16'h04cc//8bit width addr

//clock prescaler, PRES = 100,000,000/2/BaudRate
    `define RTC_I2C_PRES_NUM       1
    `define RTC_I2C_PRES_BIT_WID   16
    `define RTC_I2C_PRES_ADDR      308	//32bit width addr
    `define RTC_I2C_PRES_SIZE      1		//32bit width size
    `define RTC_I2C_PRES_END       308	//32bit width addr
    `define RTC_I2C_PRES_BYTE_ADDR 16'h04d0//8bit width addr
    `define RTC_I2C_PRES_BYTE_WID  2		//8bit width size
    `define RTC_I2C_PRES_BYTE_END  16'h04d1//8bit width addr

//Reserved for future use
    `define RTC_I2C_RSV_NUM       1
    `define RTC_I2C_RSV_BIT_WID   512
    `define RTC_I2C_RSV_ADDR      309	//32bit width addr
    `define RTC_I2C_RSV_SIZE      16		//32bit width size
    `define RTC_I2C_RSV_END       324	//32bit width addr
    `define RTC_I2C_RSV_BYTE_ADDR 16'h04d4//8bit width addr
    `define RTC_I2C_RSV_BYTE_WID  64		//8bit width size
    `define RTC_I2C_RSV_BYTE_END  16'h0513//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//PROBE present
/////////////////////////////////////////////////////////////////////////////
//0 present, 1 unconnected
    `define PROB_PRES_NUM       1
    `define PROB_PRES_BIT_WID   1
    `define PROB_PRES_ADDR      325	//32bit width addr
    `define PROB_PRES_SIZE      1		//32bit width size
    `define PROB_PRES_END       325	//32bit width addr
    `define PROB_PRES_BYTE_ADDR 16'h0514//8bit width addr
    `define PROB_PRES_BYTE_WID  1		//8bit width size
    `define PROB_PRES_BYTE_END  16'h0514//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//PFLH I2C master 
/////////////////////////////////////////////////////////////////////////////
//Read Only; Read 0, free, auto turn to 1; Read 1 is occupied, wait
    `define PFLH_I2C_MUTEX_NUM       1
    `define PFLH_I2C_MUTEX_BIT_WID   1
    `define PFLH_I2C_MUTEX_ADDR      326	//32bit width addr
    `define PFLH_I2C_MUTEX_SIZE      1		//32bit width size
    `define PFLH_I2C_MUTEX_END       326	//32bit width addr
    `define PFLH_I2C_MUTEX_BYTE_ADDR 16'h0518//8bit width addr
    `define PFLH_I2C_MUTEX_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_MUTEX_BYTE_END  16'h0518//8bit width addr

//Reset, 1 reset, 0 work
    `define PFLH_I2C_RST_NUM       1
    `define PFLH_I2C_RST_BIT_WID   1
    `define PFLH_I2C_RST_ADDR      327	//32bit width addr
    `define PFLH_I2C_RST_SIZE      1		//32bit width size
    `define PFLH_I2C_RST_END       327	//32bit width addr
    `define PFLH_I2C_RST_BYTE_ADDR 16'h051c//8bit width addr
    `define PFLH_I2C_RST_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_RST_BYTE_END  16'h051c//8bit width addr

//Write buffer
    `define PFLH_I2C_WR_BUF_NUM       1
    `define PFLH_I2C_WR_BUF_BIT_WID   544
    `define PFLH_I2C_WR_BUF_ADDR      328	//32bit width addr
    `define PFLH_I2C_WR_BUF_SIZE      17		//32bit width size
    `define PFLH_I2C_WR_BUF_END       344	//32bit width addr
    `define PFLH_I2C_WR_BUF_BYTE_ADDR 16'h0520//8bit width addr
    `define PFLH_I2C_WR_BUF_BYTE_WID  68		//8bit width size
    `define PFLH_I2C_WR_BUF_BYTE_END  16'h0563//8bit width addr

//Write buffer length
    `define PFLH_I2C_WR_LEN_NUM       1
    `define PFLH_I2C_WR_LEN_BIT_WID   7
    `define PFLH_I2C_WR_LEN_ADDR      345	//32bit width addr
    `define PFLH_I2C_WR_LEN_SIZE      1		//32bit width size
    `define PFLH_I2C_WR_LEN_END       345	//32bit width addr
    `define PFLH_I2C_WR_LEN_BYTE_ADDR 16'h0564//8bit width addr
    `define PFLH_I2C_WR_LEN_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_WR_LEN_BYTE_END  16'h0564//8bit width addr

//Read buffer
    `define PFLH_I2C_RD_BUF_NUM       1
    `define PFLH_I2C_RD_BUF_BIT_WID   512
    `define PFLH_I2C_RD_BUF_ADDR      346	//32bit width addr
    `define PFLH_I2C_RD_BUF_SIZE      16		//32bit width size
    `define PFLH_I2C_RD_BUF_END       361	//32bit width addr
    `define PFLH_I2C_RD_BUF_BYTE_ADDR 16'h0568//8bit width addr
    `define PFLH_I2C_RD_BUF_BYTE_WID  64		//8bit width size
    `define PFLH_I2C_RD_BUF_BYTE_END  16'h05a7//8bit width addr

//Read buffer length
    `define PFLH_I2C_RD_LEN_NUM       1
    `define PFLH_I2C_RD_LEN_BIT_WID   7
    `define PFLH_I2C_RD_LEN_ADDR      362	//32bit width addr
    `define PFLH_I2C_RD_LEN_SIZE      1		//32bit width size
    `define PFLH_I2C_RD_LEN_END       362	//32bit width addr
    `define PFLH_I2C_RD_LEN_BYTE_ADDR 16'h05a8//8bit width addr
    `define PFLH_I2C_RD_LEN_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_RD_LEN_BYTE_END  16'h05a8//8bit width addr

//Start operation when write any value
    `define PFLH_I2C_START_NUM       1
    `define PFLH_I2C_START_BIT_WID   1
    `define PFLH_I2C_START_ADDR      363	//32bit width addr
    `define PFLH_I2C_START_SIZE      1		//32bit width size
    `define PFLH_I2C_START_END       363	//32bit width addr
    `define PFLH_I2C_START_BYTE_ADDR 16'h05ac//8bit width addr
    `define PFLH_I2C_START_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_START_BYTE_END  16'h05ac//8bit width addr

//Status, 1 busy, 0 idle
    `define PFLH_I2C_BUSY_NUM       1
    `define PFLH_I2C_BUSY_BIT_WID   1
    `define PFLH_I2C_BUSY_ADDR      364	//32bit width addr
    `define PFLH_I2C_BUSY_SIZE      1		//32bit width size
    `define PFLH_I2C_BUSY_END       364	//32bit width addr
    `define PFLH_I2C_BUSY_BYTE_ADDR 16'h05b0//8bit width addr
    `define PFLH_I2C_BUSY_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_BUSY_BYTE_END  16'h05b0//8bit width addr

//Line error, 1 error, 0 OK
    `define PFLH_I2C_LERR_NUM       1
    `define PFLH_I2C_LERR_BIT_WID   1
    `define PFLH_I2C_LERR_ADDR      365	//32bit width addr
    `define PFLH_I2C_LERR_SIZE      1		//32bit width size
    `define PFLH_I2C_LERR_END       365	//32bit width addr
    `define PFLH_I2C_LERR_BYTE_ADDR 16'h05b4//8bit width addr
    `define PFLH_I2C_LERR_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_LERR_BYTE_END  16'h05b4//8bit width addr

//Nack error, 1 error, 0 OK
    `define PFLH_I2C_NERR_NUM       1
    `define PFLH_I2C_NERR_BIT_WID   1
    `define PFLH_I2C_NERR_ADDR      366	//32bit width addr
    `define PFLH_I2C_NERR_SIZE      1		//32bit width size
    `define PFLH_I2C_NERR_END       366	//32bit width addr
    `define PFLH_I2C_NERR_BYTE_ADDR 16'h05b8//8bit width addr
    `define PFLH_I2C_NERR_BYTE_WID  1		//8bit width size
    `define PFLH_I2C_NERR_BYTE_END  16'h05b8//8bit width addr

//clock prescaler, PRES = 100,000,000/2/BaudRate
    `define PFLH_I2C_PRES_NUM       1
    `define PFLH_I2C_PRES_BIT_WID   16
    `define PFLH_I2C_PRES_ADDR      367	//32bit width addr
    `define PFLH_I2C_PRES_SIZE      1		//32bit width size
    `define PFLH_I2C_PRES_END       367	//32bit width addr
    `define PFLH_I2C_PRES_BYTE_ADDR 16'h05bc//8bit width addr
    `define PFLH_I2C_PRES_BYTE_WID  2		//8bit width size
    `define PFLH_I2C_PRES_BYTE_END  16'h05bd//8bit width addr

//Reserved for future use
    `define PFLH_I2C_RSV_NUM       1
    `define PFLH_I2C_RSV_BIT_WID   512
    `define PFLH_I2C_RSV_ADDR      368	//32bit width addr
    `define PFLH_I2C_RSV_SIZE      16		//32bit width size
    `define PFLH_I2C_RSV_END       383	//32bit width addr
    `define PFLH_I2C_RSV_BYTE_ADDR 16'h05c0//8bit width addr
    `define PFLH_I2C_RSV_BYTE_WID  64		//8bit width size
    `define PFLH_I2C_RSV_BYTE_END  16'h05ff//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase Out Trigger
/////////////////////////////////////////////////////////////////////////////
//Write HEAT start heat, write any other value  stop heat, auto clear when time up
    `define PHS_OUT_TRIG_NUM       1
    `define PHS_OUT_TRIG_BIT_WID   32
    `define PHS_OUT_TRIG_ADDR      384	//32bit width addr
    `define PHS_OUT_TRIG_SIZE      1		//32bit width size
    `define PHS_OUT_TRIG_END       384	//32bit width addr
    `define PHS_OUT_TRIG_BYTE_ADDR 16'h0600//8bit width addr
    `define PHS_OUT_TRIG_BYTE_WID  4		//8bit width size
    `define PHS_OUT_TRIG_BYTE_END  16'h0603//8bit width addr

//Heattime, unit is 10ns, default 0, max 3hour, when time up, generate irq
    `define PHS_OUT_TIME_NUM       1
    `define PHS_OUT_TIME_BIT_WID   40
    `define PHS_OUT_TIME_ADDR      385	//32bit width addr
    `define PHS_OUT_TIME_SIZE      2		//32bit width size
    `define PHS_OUT_TIME_END       386	//32bit width addr
    `define PHS_OUT_TIME_BYTE_ADDR 16'h0604//8bit width addr
    `define PHS_OUT_TIME_BYTE_WID  5		//8bit width size
    `define PHS_OUT_TIME_BYTE_END  16'h0608//8bit width addr

//Reserved for future use
    `define PHS_OUT_RSV_NUM       1
    `define PHS_OUT_RSV_BIT_WID   512
    `define PHS_OUT_RSV_ADDR      387	//32bit width addr
    `define PHS_OUT_RSV_SIZE      16		//32bit width size
    `define PHS_OUT_RSV_END       402	//32bit width addr
    `define PHS_OUT_RSV_BYTE_ADDR 16'h060c//8bit width addr
    `define PHS_OUT_RSV_BYTE_WID  64		//8bit width size
    `define PHS_OUT_RSV_BYTE_END  16'h064b//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//USM POWER
/////////////////////////////////////////////////////////////////////////////
//USM control board power switch, 1 open, 0 close
    `define USM_PWR_SW_NUM       1
    `define USM_PWR_SW_BIT_WID   1
    `define USM_PWR_SW_ADDR      403	//32bit width addr
    `define USM_PWR_SW_SIZE      1		//32bit width size
    `define USM_PWR_SW_END       403	//32bit width addr
    `define USM_PWR_SW_BYTE_ADDR 16'h064c//8bit width addr
    `define USM_PWR_SW_BYTE_WID  1		//8bit width size
    `define USM_PWR_SW_BYTE_END  16'h064c//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//USM
/////////////////////////////////////////////////////////////////////////////
//Reset, 1 reset, 0 work, default 1
    `define USM_RST_NUM       5
    `define USM_RST_BIT_WID   1
    `define USM_RST_ADDR      404	//32bit width addr
    `define USM_RST_SIZE      1		//32bit width size
    `define USM_RST_END       408	//32bit width addr
    `define USM_RST_BYTE_ADDR 16'h0650//8bit width addr
    `define USM_RST_BYTE_WID  1		//8bit width size
    `define USM_RST_BYTE_END  16'h0660//8bit width addr

//Write 1 to start, write 0 to stop, when done/timeout/limit switch,  auto clear
    `define USM_RUN_NUM       5
    `define USM_RUN_BIT_WID   1
    `define USM_RUN_ADDR      409	//32bit width addr
    `define USM_RUN_SIZE      1		//32bit width size
    `define USM_RUN_END       413	//32bit width addr
    `define USM_RUN_BYTE_ADDR 16'h0664//8bit width addr
    `define USM_RUN_BYTE_WID  1		//8bit width size
    `define USM_RUN_BYTE_END  16'h0674//8bit width addr

//output USM driver signal, T = CFG_FREQ*2*10ns
    `define USM_CFG_FREQ_NUM       5
    `define USM_CFG_FREQ_BIT_WID   16
    `define USM_CFG_FREQ_ADDR      414	//32bit width addr
    `define USM_CFG_FREQ_SIZE      1		//32bit width size
    `define USM_CFG_FREQ_END       418	//32bit width addr
    `define USM_CFG_FREQ_BYTE_ADDR 16'h0678//8bit width addr
    `define USM_CFG_FREQ_BYTE_WID  2		//8bit width size
    `define USM_CFG_FREQ_BYTE_END  16'h0689//8bit width addr

//1 clockwise rotation, 0 counterclockwise rotation
    `define USM_CFG_DIR_NUM       5
    `define USM_CFG_DIR_BIT_WID   1
    `define USM_CFG_DIR_ADDR      419	//32bit width addr
    `define USM_CFG_DIR_SIZE      1		//32bit width size
    `define USM_CFG_DIR_END       423	//32bit width addr
    `define USM_CFG_DIR_BYTE_ADDR 16'h068c//8bit width addr
    `define USM_CFG_DIR_BYTE_WID  1		//8bit width size
    `define USM_CFG_DIR_BYTE_END  16'h069c//8bit width addr

//Traget run pulse
    `define USM_CFG_PULSE_NUM       5
    `define USM_CFG_PULSE_BIT_WID   32
    `define USM_CFG_PULSE_ADDR      424	//32bit width addr
    `define USM_CFG_PULSE_SIZE      1		//32bit width size
    `define USM_CFG_PULSE_END       428	//32bit width addr
    `define USM_CFG_PULSE_BYTE_ADDR 16'h06a0//8bit width addr
    `define USM_CFG_PULSE_BYTE_WID  4		//8bit width size
    `define USM_CFG_PULSE_BYTE_END  16'h06b3//8bit width addr

//Actual run pulse
    `define USM_MOVE_PULSE_NUM       5
    `define USM_MOVE_PULSE_BIT_WID   32
    `define USM_MOVE_PULSE_ADDR      429	//32bit width addr
    `define USM_MOVE_PULSE_SIZE      1		//32bit width size
    `define USM_MOVE_PULSE_END       433	//32bit width addr
    `define USM_MOVE_PULSE_BYTE_ADDR 16'h06b4//8bit width addr
    `define USM_MOVE_PULSE_BYTE_WID  4		//8bit width size
    `define USM_MOVE_PULSE_BYTE_END  16'h06c7//8bit width addr

//Limit switch status, read only, 1 at limit, 0 free to run
    `define USM_LIMIT_STA_NUM       5
    `define USM_LIMIT_STA_BIT_WID   1
    `define USM_LIMIT_STA_ADDR      434	//32bit width addr
    `define USM_LIMIT_STA_SIZE      1		//32bit width size
    `define USM_LIMIT_STA_END       438	//32bit width addr
    `define USM_LIMIT_STA_BYTE_ADDR 16'h06c8//8bit width addr
    `define USM_LIMIT_STA_BYTE_WID  1		//8bit width size
    `define USM_LIMIT_STA_BYTE_END  16'h06d8//8bit width addr

//Limit enable, 1: running auto stop at limit and generate IRQ, 0:ignore limit sta change, default 1 after reset release
    `define USM_LIMIT_WATCH_NUM       5
    `define USM_LIMIT_WATCH_BIT_WID   1
    `define USM_LIMIT_WATCH_ADDR      439	//32bit width addr
    `define USM_LIMIT_WATCH_SIZE      1		//32bit width size
    `define USM_LIMIT_WATCH_END       443	//32bit width addr
    `define USM_LIMIT_WATCH_BYTE_ADDR 16'h06dc//8bit width addr
    `define USM_LIMIT_WATCH_BYTE_WID  1		//8bit width size
    `define USM_LIMIT_WATCH_BYTE_END  16'h06ec//8bit width addr

//Reserved for future use
    `define USM_RSV_NUM       5
    `define USM_RSV_BIT_WID   512
    `define USM_RSV_ADDR      444	//32bit width addr
    `define USM_RSV_SIZE      16		//32bit width size
    `define USM_RSV_END       523	//32bit width addr
    `define USM_RSV_BYTE_ADDR 16'h06f0//8bit width addr
    `define USM_RSV_BYTE_WID  64		//8bit width size
    `define USM_RSV_BYTE_END  16'h082f//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier Chassis Control
/////////////////////////////////////////////////////////////////////////////
//0 present, 1 unconnected
    `define AMP_PRES_NUM       8
    `define AMP_PRES_BIT_WID   1
    `define AMP_PRES_ADDR      524	//32bit width addr
    `define AMP_PRES_SIZE      1		//32bit width size
    `define AMP_PRES_END       531	//32bit width addr
    `define AMP_PRES_BYTE_ADDR 16'h0830//8bit width addr
    `define AMP_PRES_BYTE_WID  1		//8bit width size
    `define AMP_PRES_BYTE_END  16'h084c//8bit width addr

//Control FPGA hardware reset, ~prog_b, 1 reset, 0 work, default 1
    `define AMP_CF_RST_NUM       8
    `define AMP_CF_RST_BIT_WID   1
    `define AMP_CF_RST_ADDR      532	//32bit width addr
    `define AMP_CF_RST_SIZE      1		//32bit width size
    `define AMP_CF_RST_END       539	//32bit width addr
    `define AMP_CF_RST_BYTE_ADDR 16'h0850//8bit width addr
    `define AMP_CF_RST_BYTE_WID  1		//8bit width size
    `define AMP_CF_RST_BYTE_END  16'h086c//8bit width addr

//Control FPGA hardware config done, 1 done, 0 busy
    `define AMP_CF_DONE_NUM       8
    `define AMP_CF_DONE_BIT_WID   1
    `define AMP_CF_DONE_ADDR      540	//32bit width addr
    `define AMP_CF_DONE_SIZE      1		//32bit width size
    `define AMP_CF_DONE_END       547	//32bit width addr
    `define AMP_CF_DONE_BYTE_ADDR 16'h0870//8bit width addr
    `define AMP_CF_DONE_BYTE_WID  1		//8bit width size
    `define AMP_CF_DONE_BYTE_END  16'h088c//8bit width addr

//Phase FPGA hardware reset, ~prog_b, 1 reset, 0 work, default 1
    `define AMP_PF_RST_NUM       8
    `define AMP_PF_RST_BIT_WID   1
    `define AMP_PF_RST_ADDR      548	//32bit width addr
    `define AMP_PF_RST_SIZE      1		//32bit width size
    `define AMP_PF_RST_END       555	//32bit width addr
    `define AMP_PF_RST_BYTE_ADDR 16'h0890//8bit width addr
    `define AMP_PF_RST_BYTE_WID  1		//8bit width size
    `define AMP_PF_RST_BYTE_END  16'h08ac//8bit width addr

//Phase FPGA hardware config done, 1 done, 0 busy
    `define AMP_PF_DONE_NUM       8
    `define AMP_PF_DONE_BIT_WID   1
    `define AMP_PF_DONE_ADDR      556	//32bit width addr
    `define AMP_PF_DONE_SIZE      1		//32bit width size
    `define AMP_PF_DONE_END       563	//32bit width addr
    `define AMP_PF_DONE_BYTE_ADDR 16'h08b0//8bit width addr
    `define AMP_PF_DONE_BYTE_WID  1		//8bit width size
    `define AMP_PF_DONE_BYTE_END  16'h08cc//8bit width addr

//Reserved for future use
    `define AMP_RSV_NUM       8
    `define AMP_RSV_BIT_WID   512
    `define AMP_RSV_ADDR      564	//32bit width addr
    `define AMP_RSV_SIZE      16		//32bit width size
    `define AMP_RSV_END       691	//32bit width addr
    `define AMP_RSV_BYTE_ADDR 16'h08d0//8bit width addr
    `define AMP_RSV_BYTE_WID  64		//8bit width size
    `define AMP_RSV_BYTE_END  16'h0acf//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Optical Fiber module
/////////////////////////////////////////////////////////////////////////////
//Reset, 1 reset, 0 work
    `define OFTM_RST_NUM       3
    `define OFTM_RST_BIT_WID   1
    `define OFTM_RST_ADDR      692	//32bit width addr
    `define OFTM_RST_SIZE      1		//32bit width size
    `define OFTM_RST_END       694	//32bit width addr
    `define OFTM_RST_BYTE_ADDR 16'h0ad0//8bit width addr
    `define OFTM_RST_BYTE_WID  1		//8bit width size
    `define OFTM_RST_BYTE_END  16'h0ad8//8bit width addr

//Status, 1 ok, 0 error
    `define OFTM_STA_NUM       3
    `define OFTM_STA_BIT_WID   1
    `define OFTM_STA_ADDR      695	//32bit width addr
    `define OFTM_STA_SIZE      1		//32bit width size
    `define OFTM_STA_END       697	//32bit width addr
    `define OFTM_STA_BYTE_ADDR 16'h0adc//8bit width addr
    `define OFTM_STA_BYTE_WID  1		//8bit width size
    `define OFTM_STA_BYTE_END  16'h0ae4//8bit width addr

//Temperature value
    `define OFTM_TV_NUM       3
    `define OFTM_TV_BIT_WID   16
    `define OFTM_TV_ADDR      698	//32bit width addr
    `define OFTM_TV_SIZE      1		//32bit width size
    `define OFTM_TV_END       700	//32bit width addr
    `define OFTM_TV_BYTE_ADDR 16'h0ae8//8bit width addr
    `define OFTM_TV_BYTE_WID  2		//8bit width size
    `define OFTM_TV_BYTE_END  16'h0af1//8bit width addr

//Temperature limit
    `define OFTM_TL_NUM       3
    `define OFTM_TL_BIT_WID   16
    `define OFTM_TL_ADDR      701	//32bit width addr
    `define OFTM_TL_SIZE      1		//32bit width size
    `define OFTM_TL_END       703	//32bit width addr
    `define OFTM_TL_BYTE_ADDR 16'h0af4//8bit width addr
    `define OFTM_TL_BYTE_WID  2		//8bit width size
    `define OFTM_TL_BYTE_END  16'h0afd//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//AC Power Module
/////////////////////////////////////////////////////////////////////////////
//Reset, 1 reset, 0 work
    `define AC_POWER_RST_NUM       4
    `define AC_POWER_RST_BIT_WID   1
    `define AC_POWER_RST_ADDR      704	//32bit width addr
    `define AC_POWER_RST_SIZE      1		//32bit width size
    `define AC_POWER_RST_END       707	//32bit width addr
    `define AC_POWER_RST_BYTE_ADDR 16'h0b00//8bit width addr
    `define AC_POWER_RST_BYTE_WID  1		//8bit width size
    `define AC_POWER_RST_BYTE_END  16'h0b0c//8bit width addr

//Status, AC-OK, 0 OK
    `define AC_POWER_STA_AC_NUM       4
    `define AC_POWER_STA_AC_BIT_WID   1
    `define AC_POWER_STA_AC_ADDR      708	//32bit width addr
    `define AC_POWER_STA_AC_SIZE      1		//32bit width size
    `define AC_POWER_STA_AC_END       711	//32bit width addr
    `define AC_POWER_STA_AC_BYTE_ADDR 16'h0b10//8bit width addr
    `define AC_POWER_STA_AC_BYTE_WID  1		//8bit width size
    `define AC_POWER_STA_AC_BYTE_END  16'h0b1c//8bit width addr

//Status, DC-OK, 0 OK
    `define AC_POWER_STA_DC_NUM       4
    `define AC_POWER_STA_DC_BIT_WID   1
    `define AC_POWER_STA_DC_ADDR      712	//32bit width addr
    `define AC_POWER_STA_DC_SIZE      1		//32bit width size
    `define AC_POWER_STA_DC_END       715	//32bit width addr
    `define AC_POWER_STA_DC_BYTE_ADDR 16'h0b20//8bit width addr
    `define AC_POWER_STA_DC_BYTE_WID  1		//8bit width size
    `define AC_POWER_STA_DC_BYTE_END  16'h0b2c//8bit width addr

//Status, FAULT, 1 OK
    `define AC_POWER_STA_FT_NUM       4
    `define AC_POWER_STA_FT_BIT_WID   1
    `define AC_POWER_STA_FT_ADDR      716	//32bit width addr
    `define AC_POWER_STA_FT_SIZE      1		//32bit width size
    `define AC_POWER_STA_FT_END       719	//32bit width addr
    `define AC_POWER_STA_FT_BYTE_ADDR 16'h0b30//8bit width addr
    `define AC_POWER_STA_FT_BYTE_WID  1		//8bit width size
    `define AC_POWER_STA_FT_BYTE_END  16'h0b3c//8bit width addr

//Switch, 1 on, 0 off
    `define AC_POWER_SW_NUM       4
    `define AC_POWER_SW_BIT_WID   1
    `define AC_POWER_SW_ADDR      720	//32bit width addr
    `define AC_POWER_SW_SIZE      1		//32bit width size
    `define AC_POWER_SW_END       723	//32bit width addr
    `define AC_POWER_SW_BYTE_ADDR 16'h0b40//8bit width addr
    `define AC_POWER_SW_BYTE_WID  1		//8bit width size
    `define AC_POWER_SW_BYTE_END  16'h0b4c//8bit width addr

//Current value
    `define AC_POWER_AV_NUM       4
    `define AC_POWER_AV_BIT_WID   16
    `define AC_POWER_AV_ADDR      724	//32bit width addr
    `define AC_POWER_AV_SIZE      1		//32bit width size
    `define AC_POWER_AV_END       727	//32bit width addr
    `define AC_POWER_AV_BYTE_ADDR 16'h0b50//8bit width addr
    `define AC_POWER_AV_BYTE_WID  2		//8bit width size
    `define AC_POWER_AV_BYTE_END  16'h0b5d//8bit width addr

//Current limit
    `define AC_POWER_AL_NUM       4
    `define AC_POWER_AL_BIT_WID   16
    `define AC_POWER_AL_ADDR      728	//32bit width addr
    `define AC_POWER_AL_SIZE      1		//32bit width size
    `define AC_POWER_AL_END       731	//32bit width addr
    `define AC_POWER_AL_BYTE_ADDR 16'h0b60//8bit width addr
    `define AC_POWER_AL_BYTE_WID  2		//8bit width size
    `define AC_POWER_AL_BYTE_END  16'h0b6d//8bit width addr

//Reserved for future use
    `define AC_POWER_RSV_NUM       4
    `define AC_POWER_RSV_BIT_WID   512
    `define AC_POWER_RSV_ADDR      732	//32bit width addr
    `define AC_POWER_RSV_SIZE      16		//32bit width size
    `define AC_POWER_RSV_END       795	//32bit width addr
    `define AC_POWER_RSV_BYTE_ADDR 16'h0b70//8bit width addr
    `define AC_POWER_RSV_BYTE_WID  64		//8bit width size
    `define AC_POWER_RSV_BYTE_END  16'h0c6f//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase FGPA I2C module
/////////////////////////////////////////////////////////////////////////////
//Read Only; Read 0, free, auto turn to 1; Read 1 is occupied, wait
    `define PF_I2C_MUTEX_NUM       8
    `define PF_I2C_MUTEX_BIT_WID   1
    `define PF_I2C_MUTEX_ADDR      796	//32bit width addr
    `define PF_I2C_MUTEX_SIZE      1		//32bit width size
    `define PF_I2C_MUTEX_END       803	//32bit width addr
    `define PF_I2C_MUTEX_BYTE_ADDR 16'h0c70//8bit width addr
    `define PF_I2C_MUTEX_BYTE_WID  1		//8bit width size
    `define PF_I2C_MUTEX_BYTE_END  16'h0c8c//8bit width addr

//Reset, 1 reset, 0 work
    `define PF_I2C_RST_NUM       8
    `define PF_I2C_RST_BIT_WID   1
    `define PF_I2C_RST_ADDR      804	//32bit width addr
    `define PF_I2C_RST_SIZE      1		//32bit width size
    `define PF_I2C_RST_END       811	//32bit width addr
    `define PF_I2C_RST_BYTE_ADDR 16'h0c90//8bit width addr
    `define PF_I2C_RST_BYTE_WID  1		//8bit width size
    `define PF_I2C_RST_BYTE_END  16'h0cac//8bit width addr

//Write buffer
    `define PF_I2C_WR_BUF_NUM       8
    `define PF_I2C_WR_BUF_BIT_WID   544
    `define PF_I2C_WR_BUF_ADDR      812	//32bit width addr
    `define PF_I2C_WR_BUF_SIZE      17		//32bit width size
    `define PF_I2C_WR_BUF_END       947	//32bit width addr
    `define PF_I2C_WR_BUF_BYTE_ADDR 16'h0cb0//8bit width addr
    `define PF_I2C_WR_BUF_BYTE_WID  68		//8bit width size
    `define PF_I2C_WR_BUF_BYTE_END  16'h0ecf//8bit width addr

//Write buffer length
    `define PF_I2C_WR_LEN_NUM       8
    `define PF_I2C_WR_LEN_BIT_WID   7
    `define PF_I2C_WR_LEN_ADDR      948	//32bit width addr
    `define PF_I2C_WR_LEN_SIZE      1		//32bit width size
    `define PF_I2C_WR_LEN_END       955	//32bit width addr
    `define PF_I2C_WR_LEN_BYTE_ADDR 16'h0ed0//8bit width addr
    `define PF_I2C_WR_LEN_BYTE_WID  1		//8bit width size
    `define PF_I2C_WR_LEN_BYTE_END  16'h0eec//8bit width addr

//Read buffer
    `define PF_I2C_RD_BUF_NUM       8
    `define PF_I2C_RD_BUF_BIT_WID   512
    `define PF_I2C_RD_BUF_ADDR      956	//32bit width addr
    `define PF_I2C_RD_BUF_SIZE      16		//32bit width size
    `define PF_I2C_RD_BUF_END       1083	//32bit width addr
    `define PF_I2C_RD_BUF_BYTE_ADDR 16'h0ef0//8bit width addr
    `define PF_I2C_RD_BUF_BYTE_WID  64		//8bit width size
    `define PF_I2C_RD_BUF_BYTE_END  16'h10ef//8bit width addr

//Read buffer length
    `define PF_I2C_RD_LEN_NUM       8
    `define PF_I2C_RD_LEN_BIT_WID   7
    `define PF_I2C_RD_LEN_ADDR      1084	//32bit width addr
    `define PF_I2C_RD_LEN_SIZE      1		//32bit width size
    `define PF_I2C_RD_LEN_END       1091	//32bit width addr
    `define PF_I2C_RD_LEN_BYTE_ADDR 16'h10f0//8bit width addr
    `define PF_I2C_RD_LEN_BYTE_WID  1		//8bit width size
    `define PF_I2C_RD_LEN_BYTE_END  16'h110c//8bit width addr

//Start operation when write any value
    `define PF_I2C_START_NUM       8
    `define PF_I2C_START_BIT_WID   1
    `define PF_I2C_START_ADDR      1092	//32bit width addr
    `define PF_I2C_START_SIZE      1		//32bit width size
    `define PF_I2C_START_END       1099	//32bit width addr
    `define PF_I2C_START_BYTE_ADDR 16'h1110//8bit width addr
    `define PF_I2C_START_BYTE_WID  1		//8bit width size
    `define PF_I2C_START_BYTE_END  16'h112c//8bit width addr

//Status, 1 busy, 0 idle
    `define PF_I2C_BUSY_NUM       8
    `define PF_I2C_BUSY_BIT_WID   1
    `define PF_I2C_BUSY_ADDR      1100	//32bit width addr
    `define PF_I2C_BUSY_SIZE      1		//32bit width size
    `define PF_I2C_BUSY_END       1107	//32bit width addr
    `define PF_I2C_BUSY_BYTE_ADDR 16'h1130//8bit width addr
    `define PF_I2C_BUSY_BYTE_WID  1		//8bit width size
    `define PF_I2C_BUSY_BYTE_END  16'h114c//8bit width addr

//Line error, 1 error, 0 OK
    `define PF_I2C_LERR_NUM       8
    `define PF_I2C_LERR_BIT_WID   1
    `define PF_I2C_LERR_ADDR      1108	//32bit width addr
    `define PF_I2C_LERR_SIZE      1		//32bit width size
    `define PF_I2C_LERR_END       1115	//32bit width addr
    `define PF_I2C_LERR_BYTE_ADDR 16'h1150//8bit width addr
    `define PF_I2C_LERR_BYTE_WID  1		//8bit width size
    `define PF_I2C_LERR_BYTE_END  16'h116c//8bit width addr

//Nack error, 1 error, 0 OK
    `define PF_I2C_NERR_NUM       8
    `define PF_I2C_NERR_BIT_WID   1
    `define PF_I2C_NERR_ADDR      1116	//32bit width addr
    `define PF_I2C_NERR_SIZE      1		//32bit width size
    `define PF_I2C_NERR_END       1123	//32bit width addr
    `define PF_I2C_NERR_BYTE_ADDR 16'h1170//8bit width addr
    `define PF_I2C_NERR_BYTE_WID  1		//8bit width size
    `define PF_I2C_NERR_BYTE_END  16'h118c//8bit width addr

//Hardware debug
    `define PF_I2C_DEBUG_NUM       8
    `define PF_I2C_DEBUG_BIT_WID   16
    `define PF_I2C_DEBUG_ADDR      1124	//32bit width addr
    `define PF_I2C_DEBUG_SIZE      1		//32bit width size
    `define PF_I2C_DEBUG_END       1131	//32bit width addr
    `define PF_I2C_DEBUG_BYTE_ADDR 16'h1190//8bit width addr
    `define PF_I2C_DEBUG_BYTE_WID  2		//8bit width size
    `define PF_I2C_DEBUG_BYTE_END  16'h11ad//8bit width addr

//clock prescaler, PRES = 100,000,000/2/BaudRate
    `define PF_I2C_PRES_NUM       8
    `define PF_I2C_PRES_BIT_WID   16
    `define PF_I2C_PRES_ADDR      1132	//32bit width addr
    `define PF_I2C_PRES_SIZE      1		//32bit width size
    `define PF_I2C_PRES_END       1139	//32bit width addr
    `define PF_I2C_PRES_BYTE_ADDR 16'h11b0//8bit width addr
    `define PF_I2C_PRES_BYTE_WID  2		//8bit width size
    `define PF_I2C_PRES_BYTE_END  16'h11cd//8bit width addr

//Reserved for future use
    `define PF_I2C_RSV_NUM       8
    `define PF_I2C_RSV_BIT_WID   512
    `define PF_I2C_RSV_ADDR      1140	//32bit width addr
    `define PF_I2C_RSV_SIZE      16		//32bit width size
    `define PF_I2C_RSV_END       1267	//32bit width addr
    `define PF_I2C_RSV_BYTE_ADDR 16'h11d0//8bit width addr
    `define PF_I2C_RSV_BYTE_WID  64		//8bit width size
    `define PF_I2C_RSV_BYTE_END  16'h13cf//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FGPA I2C module
/////////////////////////////////////////////////////////////////////////////
//Read Only; Read 0, free, auto turn to 1; Read 1 is occupied, wait
    `define CF_I2C_MUTEX_NUM       8
    `define CF_I2C_MUTEX_BIT_WID   1
    `define CF_I2C_MUTEX_ADDR      1268	//32bit width addr
    `define CF_I2C_MUTEX_SIZE      1		//32bit width size
    `define CF_I2C_MUTEX_END       1275	//32bit width addr
    `define CF_I2C_MUTEX_BYTE_ADDR 16'h13d0//8bit width addr
    `define CF_I2C_MUTEX_BYTE_WID  1		//8bit width size
    `define CF_I2C_MUTEX_BYTE_END  16'h13ec//8bit width addr

//Reset, 1 reset, 0 work
    `define CF_I2C_RST_NUM       8
    `define CF_I2C_RST_BIT_WID   1
    `define CF_I2C_RST_ADDR      1276	//32bit width addr
    `define CF_I2C_RST_SIZE      1		//32bit width size
    `define CF_I2C_RST_END       1283	//32bit width addr
    `define CF_I2C_RST_BYTE_ADDR 16'h13f0//8bit width addr
    `define CF_I2C_RST_BYTE_WID  1		//8bit width size
    `define CF_I2C_RST_BYTE_END  16'h140c//8bit width addr

//Write buffer
    `define CF_I2C_WR_BUF_NUM       8
    `define CF_I2C_WR_BUF_BIT_WID   544
    `define CF_I2C_WR_BUF_ADDR      1284	//32bit width addr
    `define CF_I2C_WR_BUF_SIZE      17		//32bit width size
    `define CF_I2C_WR_BUF_END       1419	//32bit width addr
    `define CF_I2C_WR_BUF_BYTE_ADDR 16'h1410//8bit width addr
    `define CF_I2C_WR_BUF_BYTE_WID  68		//8bit width size
    `define CF_I2C_WR_BUF_BYTE_END  16'h162f//8bit width addr

//Write buffer length
    `define CF_I2C_WR_LEN_NUM       8
    `define CF_I2C_WR_LEN_BIT_WID   7
    `define CF_I2C_WR_LEN_ADDR      1420	//32bit width addr
    `define CF_I2C_WR_LEN_SIZE      1		//32bit width size
    `define CF_I2C_WR_LEN_END       1427	//32bit width addr
    `define CF_I2C_WR_LEN_BYTE_ADDR 16'h1630//8bit width addr
    `define CF_I2C_WR_LEN_BYTE_WID  1		//8bit width size
    `define CF_I2C_WR_LEN_BYTE_END  16'h164c//8bit width addr

//Read buffer
    `define CF_I2C_RD_BUF_NUM       8
    `define CF_I2C_RD_BUF_BIT_WID   512
    `define CF_I2C_RD_BUF_ADDR      1428	//32bit width addr
    `define CF_I2C_RD_BUF_SIZE      16		//32bit width size
    `define CF_I2C_RD_BUF_END       1555	//32bit width addr
    `define CF_I2C_RD_BUF_BYTE_ADDR 16'h1650//8bit width addr
    `define CF_I2C_RD_BUF_BYTE_WID  64		//8bit width size
    `define CF_I2C_RD_BUF_BYTE_END  16'h184f//8bit width addr

//Read buffer length
    `define CF_I2C_RD_LEN_NUM       8
    `define CF_I2C_RD_LEN_BIT_WID   7
    `define CF_I2C_RD_LEN_ADDR      1556	//32bit width addr
    `define CF_I2C_RD_LEN_SIZE      1		//32bit width size
    `define CF_I2C_RD_LEN_END       1563	//32bit width addr
    `define CF_I2C_RD_LEN_BYTE_ADDR 16'h1850//8bit width addr
    `define CF_I2C_RD_LEN_BYTE_WID  1		//8bit width size
    `define CF_I2C_RD_LEN_BYTE_END  16'h186c//8bit width addr

//Start operation when write any value
    `define CF_I2C_START_NUM       8
    `define CF_I2C_START_BIT_WID   1
    `define CF_I2C_START_ADDR      1564	//32bit width addr
    `define CF_I2C_START_SIZE      1		//32bit width size
    `define CF_I2C_START_END       1571	//32bit width addr
    `define CF_I2C_START_BYTE_ADDR 16'h1870//8bit width addr
    `define CF_I2C_START_BYTE_WID  1		//8bit width size
    `define CF_I2C_START_BYTE_END  16'h188c//8bit width addr

//Status, 1 busy, 0 idle
    `define CF_I2C_BUSY_NUM       8
    `define CF_I2C_BUSY_BIT_WID   1
    `define CF_I2C_BUSY_ADDR      1572	//32bit width addr
    `define CF_I2C_BUSY_SIZE      1		//32bit width size
    `define CF_I2C_BUSY_END       1579	//32bit width addr
    `define CF_I2C_BUSY_BYTE_ADDR 16'h1890//8bit width addr
    `define CF_I2C_BUSY_BYTE_WID  1		//8bit width size
    `define CF_I2C_BUSY_BYTE_END  16'h18ac//8bit width addr

//Line error, 1 error, 0 OK
    `define CF_I2C_LERR_NUM       8
    `define CF_I2C_LERR_BIT_WID   1
    `define CF_I2C_LERR_ADDR      1580	//32bit width addr
    `define CF_I2C_LERR_SIZE      1		//32bit width size
    `define CF_I2C_LERR_END       1587	//32bit width addr
    `define CF_I2C_LERR_BYTE_ADDR 16'h18b0//8bit width addr
    `define CF_I2C_LERR_BYTE_WID  1		//8bit width size
    `define CF_I2C_LERR_BYTE_END  16'h18cc//8bit width addr

//Nack error, 1 error, 0 OK
    `define CF_I2C_NERR_NUM       8
    `define CF_I2C_NERR_BIT_WID   1
    `define CF_I2C_NERR_ADDR      1588	//32bit width addr
    `define CF_I2C_NERR_SIZE      1		//32bit width size
    `define CF_I2C_NERR_END       1595	//32bit width addr
    `define CF_I2C_NERR_BYTE_ADDR 16'h18d0//8bit width addr
    `define CF_I2C_NERR_BYTE_WID  1		//8bit width size
    `define CF_I2C_NERR_BYTE_END  16'h18ec//8bit width addr

//Hardware debug
    `define CF_I2C_DEBUG_NUM       8
    `define CF_I2C_DEBUG_BIT_WID   16
    `define CF_I2C_DEBUG_ADDR      1596	//32bit width addr
    `define CF_I2C_DEBUG_SIZE      1		//32bit width size
    `define CF_I2C_DEBUG_END       1603	//32bit width addr
    `define CF_I2C_DEBUG_BYTE_ADDR 16'h18f0//8bit width addr
    `define CF_I2C_DEBUG_BYTE_WID  2		//8bit width size
    `define CF_I2C_DEBUG_BYTE_END  16'h190d//8bit width addr

//clock prescaler, PRES = 100,000,000/2/BaudRate
    `define CF_I2C_PRES_NUM       8
    `define CF_I2C_PRES_BIT_WID   16
    `define CF_I2C_PRES_ADDR      1604	//32bit width addr
    `define CF_I2C_PRES_SIZE      1		//32bit width size
    `define CF_I2C_PRES_END       1611	//32bit width addr
    `define CF_I2C_PRES_BYTE_ADDR 16'h1910//8bit width addr
    `define CF_I2C_PRES_BYTE_WID  2		//8bit width size
    `define CF_I2C_PRES_BYTE_END  16'h192d//8bit width addr

//Reserved for future use
    `define CF_I2C_RSV_NUM       8
    `define CF_I2C_RSV_BIT_WID   512
    `define CF_I2C_RSV_ADDR      1612	//32bit width addr
    `define CF_I2C_RSV_SIZE      16		//32bit width size
    `define CF_I2C_RSV_END       1739	//32bit width addr
    `define CF_I2C_RSV_BYTE_ADDR 16'h1930//8bit width addr
    `define CF_I2C_RSV_BYTE_WID  64		//8bit width size
    `define CF_I2C_RSV_BYTE_END  16'h1b2f//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Emergency Stop Switch Interrupt status
/////////////////////////////////////////////////////////////////////////////
//Doctor Release
    `define IRQ_STA_EMS_DOC_RLS_NUM       1
    `define IRQ_STA_EMS_DOC_RLS_BIT_WID   1
    `define IRQ_STA_EMS_DOC_RLS_ADDR      1740	//32bit width addr
    `define IRQ_STA_EMS_DOC_RLS_SIZE      1		//32bit width size
    `define IRQ_STA_EMS_DOC_RLS_END       1740	//32bit width addr
    `define IRQ_STA_EMS_DOC_RLS_BYTE_ADDR 16'h1b30//8bit width addr
    `define IRQ_STA_EMS_DOC_RLS_BYTE_WID  1		//8bit width size
    `define IRQ_STA_EMS_DOC_RLS_BYTE_END  16'h1b30//8bit width addr

//Doctor Press
    `define IRQ_STA_EMS_DOC_PRS_NUM       1
    `define IRQ_STA_EMS_DOC_PRS_BIT_WID   1
    `define IRQ_STA_EMS_DOC_PRS_ADDR      1741	//32bit width addr
    `define IRQ_STA_EMS_DOC_PRS_SIZE      1		//32bit width size
    `define IRQ_STA_EMS_DOC_PRS_END       1741	//32bit width addr
    `define IRQ_STA_EMS_DOC_PRS_BYTE_ADDR 16'h1b34//8bit width addr
    `define IRQ_STA_EMS_DOC_PRS_BYTE_WID  1		//8bit width size
    `define IRQ_STA_EMS_DOC_PRS_BYTE_END  16'h1b34//8bit width addr

//Paitent Release
    `define IRQ_STA_EMS_PAT_RLS_NUM       1
    `define IRQ_STA_EMS_PAT_RLS_BIT_WID   1
    `define IRQ_STA_EMS_PAT_RLS_ADDR      1742	//32bit width addr
    `define IRQ_STA_EMS_PAT_RLS_SIZE      1		//32bit width size
    `define IRQ_STA_EMS_PAT_RLS_END       1742	//32bit width addr
    `define IRQ_STA_EMS_PAT_RLS_BYTE_ADDR 16'h1b38//8bit width addr
    `define IRQ_STA_EMS_PAT_RLS_BYTE_WID  1		//8bit width size
    `define IRQ_STA_EMS_PAT_RLS_BYTE_END  16'h1b38//8bit width addr

//Paitent Press
    `define IRQ_STA_EMS_PAT_PRS_NUM       1
    `define IRQ_STA_EMS_PAT_PRS_BIT_WID   1
    `define IRQ_STA_EMS_PAT_PRS_ADDR      1743	//32bit width addr
    `define IRQ_STA_EMS_PAT_PRS_SIZE      1		//32bit width size
    `define IRQ_STA_EMS_PAT_PRS_END       1743	//32bit width addr
    `define IRQ_STA_EMS_PAT_PRS_BYTE_ADDR 16'h1b3c//8bit width addr
    `define IRQ_STA_EMS_PAT_PRS_BYTE_WID  1		//8bit width size
    `define IRQ_STA_EMS_PAT_PRS_BYTE_END  16'h1b3c//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Heat Done
/////////////////////////////////////////////////////////////////////////////
//Heat time done, auto generate, read clear
    `define IRQ_STA_HEAT_DONE_NUM       1
    `define IRQ_STA_HEAT_DONE_BIT_WID   1
    `define IRQ_STA_HEAT_DONE_ADDR      1744	//32bit width addr
    `define IRQ_STA_HEAT_DONE_SIZE      1		//32bit width size
    `define IRQ_STA_HEAT_DONE_END       1744	//32bit width addr
    `define IRQ_STA_HEAT_DONE_BYTE_ADDR 16'h1b40//8bit width addr
    `define IRQ_STA_HEAT_DONE_BYTE_WID  1		//8bit width size
    `define IRQ_STA_HEAT_DONE_BYTE_END  16'h1b40//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//AC Power Interrupt status
/////////////////////////////////////////////////////////////////////////////
//AC-OK Error
    `define IRQ_STA_AC_AC_ERR_NUM       4
    `define IRQ_STA_AC_AC_ERR_BIT_WID   1
    `define IRQ_STA_AC_AC_ERR_ADDR      1745	//32bit width addr
    `define IRQ_STA_AC_AC_ERR_SIZE      1		//32bit width size
    `define IRQ_STA_AC_AC_ERR_END       1748	//32bit width addr
    `define IRQ_STA_AC_AC_ERR_BYTE_ADDR 16'h1b44//8bit width addr
    `define IRQ_STA_AC_AC_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AC_AC_ERR_BYTE_END  16'h1b50//8bit width addr

//DC-OK Error
    `define IRQ_STA_AC_DC_ERR_NUM       4
    `define IRQ_STA_AC_DC_ERR_BIT_WID   1
    `define IRQ_STA_AC_DC_ERR_ADDR      1749	//32bit width addr
    `define IRQ_STA_AC_DC_ERR_SIZE      1		//32bit width size
    `define IRQ_STA_AC_DC_ERR_END       1752	//32bit width addr
    `define IRQ_STA_AC_DC_ERR_BYTE_ADDR 16'h1b54//8bit width addr
    `define IRQ_STA_AC_DC_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AC_DC_ERR_BYTE_END  16'h1b60//8bit width addr

//Fault Error
    `define IRQ_STA_AC_FAULT_NUM       4
    `define IRQ_STA_AC_FAULT_BIT_WID   1
    `define IRQ_STA_AC_FAULT_ADDR      1753	//32bit width addr
    `define IRQ_STA_AC_FAULT_SIZE      1		//32bit width size
    `define IRQ_STA_AC_FAULT_END       1756	//32bit width addr
    `define IRQ_STA_AC_FAULT_BYTE_ADDR 16'h1b64//8bit width addr
    `define IRQ_STA_AC_FAULT_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AC_FAULT_BYTE_END  16'h1b70//8bit width addr

//Current Ampere Over Limit
    `define IRQ_STA_AC_AOL_NUM       4
    `define IRQ_STA_AC_AOL_BIT_WID   1
    `define IRQ_STA_AC_AOL_ADDR      1757	//32bit width addr
    `define IRQ_STA_AC_AOL_SIZE      1		//32bit width size
    `define IRQ_STA_AC_AOL_END       1760	//32bit width addr
    `define IRQ_STA_AC_AOL_BYTE_ADDR 16'h1b74//8bit width addr
    `define IRQ_STA_AC_AOL_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AC_AOL_BYTE_END  16'h1b80//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Optical Fiber module Interrupt status
/////////////////////////////////////////////////////////////////////////////
//Temperature Over Limit
    `define IRQ_STA_OFTM_TOV_NUM       3
    `define IRQ_STA_OFTM_TOV_BIT_WID   1
    `define IRQ_STA_OFTM_TOV_ADDR      1761	//32bit width addr
    `define IRQ_STA_OFTM_TOV_SIZE      1		//32bit width size
    `define IRQ_STA_OFTM_TOV_END       1763	//32bit width addr
    `define IRQ_STA_OFTM_TOV_BYTE_ADDR 16'h1b84//8bit width addr
    `define IRQ_STA_OFTM_TOV_BYTE_WID  1		//8bit width size
    `define IRQ_STA_OFTM_TOV_BYTE_END  16'h1b8c//8bit width addr

//Fiber lose connect
    `define IRQ_STA_OFTM_LOS_NUM       3
    `define IRQ_STA_OFTM_LOS_BIT_WID   1
    `define IRQ_STA_OFTM_LOS_ADDR      1764	//32bit width addr
    `define IRQ_STA_OFTM_LOS_SIZE      1		//32bit width size
    `define IRQ_STA_OFTM_LOS_END       1766	//32bit width addr
    `define IRQ_STA_OFTM_LOS_BYTE_ADDR 16'h1b90//8bit width addr
    `define IRQ_STA_OFTM_LOS_BYTE_WID  1		//8bit width size
    `define IRQ_STA_OFTM_LOS_BYTE_END  16'h1b98//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier Chassis Interrupt status
/////////////////////////////////////////////////////////////////////////////
//Chassis Insert In
    `define IRQ_STA_CHS_CII_NUM       8
    `define IRQ_STA_CHS_CII_BIT_WID   1
    `define IRQ_STA_CHS_CII_ADDR      1767	//32bit width addr
    `define IRQ_STA_CHS_CII_SIZE      1		//32bit width size
    `define IRQ_STA_CHS_CII_END       1774	//32bit width addr
    `define IRQ_STA_CHS_CII_BYTE_ADDR 16'h1b9c//8bit width addr
    `define IRQ_STA_CHS_CII_BYTE_WID  1		//8bit width size
    `define IRQ_STA_CHS_CII_BYTE_END  16'h1bb8//8bit width addr

//Chassis Pull out
    `define IRQ_STA_CHS_CPO_NUM       8
    `define IRQ_STA_CHS_CPO_BIT_WID   1
    `define IRQ_STA_CHS_CPO_ADDR      1775	//32bit width addr
    `define IRQ_STA_CHS_CPO_SIZE      1		//32bit width size
    `define IRQ_STA_CHS_CPO_END       1782	//32bit width addr
    `define IRQ_STA_CHS_CPO_BYTE_ADDR 16'h1bbc//8bit width addr
    `define IRQ_STA_CHS_CPO_BYTE_WID  1		//8bit width size
    `define IRQ_STA_CHS_CPO_BYTE_END  16'h1bd8//8bit width addr

//Phase FPGA IRQ
    `define IRQ_STA_CHS_PHS_FPGA_NUM       8
    `define IRQ_STA_CHS_PHS_FPGA_BIT_WID   1
    `define IRQ_STA_CHS_PHS_FPGA_ADDR      1783	//32bit width addr
    `define IRQ_STA_CHS_PHS_FPGA_SIZE      1		//32bit width size
    `define IRQ_STA_CHS_PHS_FPGA_END       1790	//32bit width addr
    `define IRQ_STA_CHS_PHS_FPGA_BYTE_ADDR 16'h1bdc//8bit width addr
    `define IRQ_STA_CHS_PHS_FPGA_BYTE_WID  1		//8bit width size
    `define IRQ_STA_CHS_PHS_FPGA_BYTE_END  16'h1bf8//8bit width addr

//Control FPGA IRQ
    `define IRQ_STA_CHS_CTRL_FPGA_NUM       8
    `define IRQ_STA_CHS_CTRL_FPGA_BIT_WID   1
    `define IRQ_STA_CHS_CTRL_FPGA_ADDR      1791	//32bit width addr
    `define IRQ_STA_CHS_CTRL_FPGA_SIZE      1		//32bit width size
    `define IRQ_STA_CHS_CTRL_FPGA_END       1798	//32bit width addr
    `define IRQ_STA_CHS_CTRL_FPGA_BYTE_ADDR 16'h1bfc//8bit width addr
    `define IRQ_STA_CHS_CTRL_FPGA_BYTE_WID  1		//8bit width size
    `define IRQ_STA_CHS_CTRL_FPGA_BYTE_END  16'h1c18//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//USM Interrupt status
/////////////////////////////////////////////////////////////////////////////
//USM work done (include manual stop by software)
    `define IRQ_STA_USM_DONE_NUM       5
    `define IRQ_STA_USM_DONE_BIT_WID   1
    `define IRQ_STA_USM_DONE_ADDR      1799	//32bit width addr
    `define IRQ_STA_USM_DONE_SIZE      1		//32bit width size
    `define IRQ_STA_USM_DONE_END       1803	//32bit width addr
    `define IRQ_STA_USM_DONE_BYTE_ADDR 16'h1c1c//8bit width addr
    `define IRQ_STA_USM_DONE_BYTE_WID  1		//8bit width size
    `define IRQ_STA_USM_DONE_BYTE_END  16'h1c2c//8bit width addr

//USM work time out
    `define IRQ_STA_USM_TIME_OUT_NUM       5
    `define IRQ_STA_USM_TIME_OUT_BIT_WID   1
    `define IRQ_STA_USM_TIME_OUT_ADDR      1804	//32bit width addr
    `define IRQ_STA_USM_TIME_OUT_SIZE      1		//32bit width size
    `define IRQ_STA_USM_TIME_OUT_END       1808	//32bit width addr
    `define IRQ_STA_USM_TIME_OUT_BYTE_ADDR 16'h1c30//8bit width addr
    `define IRQ_STA_USM_TIME_OUT_BYTE_WID  1		//8bit width size
    `define IRQ_STA_USM_TIME_OUT_BYTE_END  16'h1c40//8bit width addr

//USM work run to limit
    `define IRQ_STA_USM_LIMIT_NUM       5
    `define IRQ_STA_USM_LIMIT_BIT_WID   1
    `define IRQ_STA_USM_LIMIT_ADDR      1809	//32bit width addr
    `define IRQ_STA_USM_LIMIT_SIZE      1		//32bit width size
    `define IRQ_STA_USM_LIMIT_END       1813	//32bit width addr
    `define IRQ_STA_USM_LIMIT_BYTE_ADDR 16'h1c44//8bit width addr
    `define IRQ_STA_USM_LIMIT_BYTE_WID  1		//8bit width size
    `define IRQ_STA_USM_LIMIT_BYTE_END  16'h1c54//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//reserve
/////////////////////////////////////////////////////////////////////////////
//Reserved for future use
    `define IRQ_STA_RSV_NUM       1
    `define IRQ_STA_RSV_BIT_WID   512
    `define IRQ_STA_RSV_ADDR      1814	//32bit width addr
    `define IRQ_STA_RSV_SIZE      16		//32bit width size
    `define IRQ_STA_RSV_END       1829	//32bit width addr
    `define IRQ_STA_RSV_BYTE_ADDR 16'h1c58//8bit width addr
    `define IRQ_STA_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_STA_RSV_BYTE_END  16'h1c97//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Emergency Stop Switch Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//Doctor Release
    `define IRQ_MASK_EMS_DOC_RLS_NUM       1
    `define IRQ_MASK_EMS_DOC_RLS_BIT_WID   1
    `define IRQ_MASK_EMS_DOC_RLS_ADDR      1830	//32bit width addr
    `define IRQ_MASK_EMS_DOC_RLS_SIZE      1		//32bit width size
    `define IRQ_MASK_EMS_DOC_RLS_END       1830	//32bit width addr
    `define IRQ_MASK_EMS_DOC_RLS_BYTE_ADDR 16'h1c98//8bit width addr
    `define IRQ_MASK_EMS_DOC_RLS_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_EMS_DOC_RLS_BYTE_END  16'h1c98//8bit width addr

//Doctor Press
    `define IRQ_MASK_EMS_DOC_PRS_NUM       1
    `define IRQ_MASK_EMS_DOC_PRS_BIT_WID   1
    `define IRQ_MASK_EMS_DOC_PRS_ADDR      1831	//32bit width addr
    `define IRQ_MASK_EMS_DOC_PRS_SIZE      1		//32bit width size
    `define IRQ_MASK_EMS_DOC_PRS_END       1831	//32bit width addr
    `define IRQ_MASK_EMS_DOC_PRS_BYTE_ADDR 16'h1c9c//8bit width addr
    `define IRQ_MASK_EMS_DOC_PRS_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_EMS_DOC_PRS_BYTE_END  16'h1c9c//8bit width addr

//Paitent Release
    `define IRQ_MASK_EMS_PAT_RLS_NUM       1
    `define IRQ_MASK_EMS_PAT_RLS_BIT_WID   1
    `define IRQ_MASK_EMS_PAT_RLS_ADDR      1832	//32bit width addr
    `define IRQ_MASK_EMS_PAT_RLS_SIZE      1		//32bit width size
    `define IRQ_MASK_EMS_PAT_RLS_END       1832	//32bit width addr
    `define IRQ_MASK_EMS_PAT_RLS_BYTE_ADDR 16'h1ca0//8bit width addr
    `define IRQ_MASK_EMS_PAT_RLS_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_EMS_PAT_RLS_BYTE_END  16'h1ca0//8bit width addr

//Paitent Press
    `define IRQ_MASK_EMS_PAT_PRS_NUM       1
    `define IRQ_MASK_EMS_PAT_PRS_BIT_WID   1
    `define IRQ_MASK_EMS_PAT_PRS_ADDR      1833	//32bit width addr
    `define IRQ_MASK_EMS_PAT_PRS_SIZE      1		//32bit width size
    `define IRQ_MASK_EMS_PAT_PRS_END       1833	//32bit width addr
    `define IRQ_MASK_EMS_PAT_PRS_BYTE_ADDR 16'h1ca4//8bit width addr
    `define IRQ_MASK_EMS_PAT_PRS_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_EMS_PAT_PRS_BYTE_END  16'h1ca4//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Heat Done
/////////////////////////////////////////////////////////////////////////////
//Heat time done, auto generate, read clear
    `define IRQ_MASK_HEAT_DONE_NUM       1
    `define IRQ_MASK_HEAT_DONE_BIT_WID   1
    `define IRQ_MASK_HEAT_DONE_ADDR      1834	//32bit width addr
    `define IRQ_MASK_HEAT_DONE_SIZE      1		//32bit width size
    `define IRQ_MASK_HEAT_DONE_END       1834	//32bit width addr
    `define IRQ_MASK_HEAT_DONE_BYTE_ADDR 16'h1ca8//8bit width addr
    `define IRQ_MASK_HEAT_DONE_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_HEAT_DONE_BYTE_END  16'h1ca8//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//AC Power Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//AC-OK Error
    `define IRQ_MASK_AC_AC_ERR_NUM       4
    `define IRQ_MASK_AC_AC_ERR_BIT_WID   1
    `define IRQ_MASK_AC_AC_ERR_ADDR      1835	//32bit width addr
    `define IRQ_MASK_AC_AC_ERR_SIZE      1		//32bit width size
    `define IRQ_MASK_AC_AC_ERR_END       1838	//32bit width addr
    `define IRQ_MASK_AC_AC_ERR_BYTE_ADDR 16'h1cac//8bit width addr
    `define IRQ_MASK_AC_AC_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AC_AC_ERR_BYTE_END  16'h1cb8//8bit width addr

//DC-OK Error
    `define IRQ_MASK_AC_DC_ERR_NUM       4
    `define IRQ_MASK_AC_DC_ERR_BIT_WID   1
    `define IRQ_MASK_AC_DC_ERR_ADDR      1839	//32bit width addr
    `define IRQ_MASK_AC_DC_ERR_SIZE      1		//32bit width size
    `define IRQ_MASK_AC_DC_ERR_END       1842	//32bit width addr
    `define IRQ_MASK_AC_DC_ERR_BYTE_ADDR 16'h1cbc//8bit width addr
    `define IRQ_MASK_AC_DC_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AC_DC_ERR_BYTE_END  16'h1cc8//8bit width addr

//Fault Error
    `define IRQ_MASK_AC_FAULT_NUM       4
    `define IRQ_MASK_AC_FAULT_BIT_WID   1
    `define IRQ_MASK_AC_FAULT_ADDR      1843	//32bit width addr
    `define IRQ_MASK_AC_FAULT_SIZE      1		//32bit width size
    `define IRQ_MASK_AC_FAULT_END       1846	//32bit width addr
    `define IRQ_MASK_AC_FAULT_BYTE_ADDR 16'h1ccc//8bit width addr
    `define IRQ_MASK_AC_FAULT_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AC_FAULT_BYTE_END  16'h1cd8//8bit width addr

//Current Ampere Over Limit
    `define IRQ_MASK_AC_AOL_NUM       4
    `define IRQ_MASK_AC_AOL_BIT_WID   1
    `define IRQ_MASK_AC_AOL_ADDR      1847	//32bit width addr
    `define IRQ_MASK_AC_AOL_SIZE      1		//32bit width size
    `define IRQ_MASK_AC_AOL_END       1850	//32bit width addr
    `define IRQ_MASK_AC_AOL_BYTE_ADDR 16'h1cdc//8bit width addr
    `define IRQ_MASK_AC_AOL_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AC_AOL_BYTE_END  16'h1ce8//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Optical Fiber module Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//Temperature Over Limit
    `define IRQ_MASK_OFTM_TOV_NUM       3
    `define IRQ_MASK_OFTM_TOV_BIT_WID   1
    `define IRQ_MASK_OFTM_TOV_ADDR      1851	//32bit width addr
    `define IRQ_MASK_OFTM_TOV_SIZE      1		//32bit width size
    `define IRQ_MASK_OFTM_TOV_END       1853	//32bit width addr
    `define IRQ_MASK_OFTM_TOV_BYTE_ADDR 16'h1cec//8bit width addr
    `define IRQ_MASK_OFTM_TOV_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_OFTM_TOV_BYTE_END  16'h1cf4//8bit width addr

//Fiber lose connect
    `define IRQ_MASK_OFTM_LOS_NUM       3
    `define IRQ_MASK_OFTM_LOS_BIT_WID   1
    `define IRQ_MASK_OFTM_LOS_ADDR      1854	//32bit width addr
    `define IRQ_MASK_OFTM_LOS_SIZE      1		//32bit width size
    `define IRQ_MASK_OFTM_LOS_END       1856	//32bit width addr
    `define IRQ_MASK_OFTM_LOS_BYTE_ADDR 16'h1cf8//8bit width addr
    `define IRQ_MASK_OFTM_LOS_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_OFTM_LOS_BYTE_END  16'h1d00//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier Chassis Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//Chassis Insert In
    `define IRQ_MASK_CHS_CII_NUM       8
    `define IRQ_MASK_CHS_CII_BIT_WID   1
    `define IRQ_MASK_CHS_CII_ADDR      1857	//32bit width addr
    `define IRQ_MASK_CHS_CII_SIZE      1		//32bit width size
    `define IRQ_MASK_CHS_CII_END       1864	//32bit width addr
    `define IRQ_MASK_CHS_CII_BYTE_ADDR 16'h1d04//8bit width addr
    `define IRQ_MASK_CHS_CII_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_CHS_CII_BYTE_END  16'h1d20//8bit width addr

//Chassis Pull out
    `define IRQ_MASK_CHS_CPO_NUM       8
    `define IRQ_MASK_CHS_CPO_BIT_WID   1
    `define IRQ_MASK_CHS_CPO_ADDR      1865	//32bit width addr
    `define IRQ_MASK_CHS_CPO_SIZE      1		//32bit width size
    `define IRQ_MASK_CHS_CPO_END       1872	//32bit width addr
    `define IRQ_MASK_CHS_CPO_BYTE_ADDR 16'h1d24//8bit width addr
    `define IRQ_MASK_CHS_CPO_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_CHS_CPO_BYTE_END  16'h1d40//8bit width addr

//Phase FPGA IRQ
    `define IRQ_MASK_CHS_PHS_FPGA_NUM       8
    `define IRQ_MASK_CHS_PHS_FPGA_BIT_WID   1
    `define IRQ_MASK_CHS_PHS_FPGA_ADDR      1873	//32bit width addr
    `define IRQ_MASK_CHS_PHS_FPGA_SIZE      1		//32bit width size
    `define IRQ_MASK_CHS_PHS_FPGA_END       1880	//32bit width addr
    `define IRQ_MASK_CHS_PHS_FPGA_BYTE_ADDR 16'h1d44//8bit width addr
    `define IRQ_MASK_CHS_PHS_FPGA_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_CHS_PHS_FPGA_BYTE_END  16'h1d60//8bit width addr

//Control FPGA IRQ
    `define IRQ_MASK_CHS_CTRL_FPGA_NUM       8
    `define IRQ_MASK_CHS_CTRL_FPGA_BIT_WID   1
    `define IRQ_MASK_CHS_CTRL_FPGA_ADDR      1881	//32bit width addr
    `define IRQ_MASK_CHS_CTRL_FPGA_SIZE      1		//32bit width size
    `define IRQ_MASK_CHS_CTRL_FPGA_END       1888	//32bit width addr
    `define IRQ_MASK_CHS_CTRL_FPGA_BYTE_ADDR 16'h1d64//8bit width addr
    `define IRQ_MASK_CHS_CTRL_FPGA_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_CHS_CTRL_FPGA_BYTE_END  16'h1d80//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//USM Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//USM work done
    `define IRQ_MASK_USM_DONE_NUM       5
    `define IRQ_MASK_USM_DONE_BIT_WID   1
    `define IRQ_MASK_USM_DONE_ADDR      1889	//32bit width addr
    `define IRQ_MASK_USM_DONE_SIZE      1		//32bit width size
    `define IRQ_MASK_USM_DONE_END       1893	//32bit width addr
    `define IRQ_MASK_USM_DONE_BYTE_ADDR 16'h1d84//8bit width addr
    `define IRQ_MASK_USM_DONE_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_USM_DONE_BYTE_END  16'h1d94//8bit width addr

//USM work time out
    `define IRQ_MASK_USM_TIME_OUT_NUM       5
    `define IRQ_MASK_USM_TIME_OUT_BIT_WID   1
    `define IRQ_MASK_USM_TIME_OUT_ADDR      1894	//32bit width addr
    `define IRQ_MASK_USM_TIME_OUT_SIZE      1		//32bit width size
    `define IRQ_MASK_USM_TIME_OUT_END       1898	//32bit width addr
    `define IRQ_MASK_USM_TIME_OUT_BYTE_ADDR 16'h1d98//8bit width addr
    `define IRQ_MASK_USM_TIME_OUT_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_USM_TIME_OUT_BYTE_END  16'h1da8//8bit width addr

//USM work run to limit
    `define IRQ_MASK_USM_LIMIT_NUM       5
    `define IRQ_MASK_USM_LIMIT_BIT_WID   1
    `define IRQ_MASK_USM_LIMIT_ADDR      1899	//32bit width addr
    `define IRQ_MASK_USM_LIMIT_SIZE      1		//32bit width size
    `define IRQ_MASK_USM_LIMIT_END       1903	//32bit width addr
    `define IRQ_MASK_USM_LIMIT_BYTE_ADDR 16'h1dac//8bit width addr
    `define IRQ_MASK_USM_LIMIT_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_USM_LIMIT_BYTE_END  16'h1dbc//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//reserve
/////////////////////////////////////////////////////////////////////////////
//Reserved for future use
    `define IRQ_MASK_RSV_NUM       1
    `define IRQ_MASK_RSV_BIT_WID   512
    `define IRQ_MASK_RSV_ADDR      1904	//32bit width addr
    `define IRQ_MASK_RSV_SIZE      16		//32bit width size
    `define IRQ_MASK_RSV_END       1919	//32bit width addr
    `define IRQ_MASK_RSV_BYTE_ADDR 16'h1dc0//8bit width addr
    `define IRQ_MASK_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_MASK_RSV_BYTE_END  16'h1dff//8bit width addr

`endif

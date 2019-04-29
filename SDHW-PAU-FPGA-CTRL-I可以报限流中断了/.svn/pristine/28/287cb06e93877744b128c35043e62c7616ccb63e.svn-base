`ifndef CONTROLFPGAREGDEF__V__
    `define CONTROLFPGAREGDEF__V__

    `define SHENDE_MEDICAL_ID    "TMednehS"
    `define FIRMWARE_COMPILE_DATE 32'h20180620
    `define FIRMWARE_COMPILE_TIME 32'h00115108 


/////////////////////////////////////////////////////////////////////////////
//Control FPGA General
/////////////////////////////////////////////////////////////////////////////
//Scratch Register, for read and write test
    `define CF_GEN_SCR_NUM       1
    `define CF_GEN_SCR_BIT_WID   8
    `define CF_GEN_SCR_ADDR      8192	//32bit width addr
    `define CF_GEN_SCR_SIZE      1		//32bit width size
    `define CF_GEN_SCR_END       8192	//32bit width addr
    `define CF_GEN_SCR_BYTE_ADDR 16'h8000//8bit width addr
    `define CF_GEN_SCR_BYTE_WID  1		//8bit width size
    `define CF_GEN_SCR_BYTE_END  16'h8000//8bit width addr

//ShendeMT = Shende Medical Technology
    `define CF_GEN_ID_NUM       1
    `define CF_GEN_ID_BIT_WID   64
    `define CF_GEN_ID_ADDR      8193	//32bit width addr
    `define CF_GEN_ID_SIZE      2		//32bit width size
    `define CF_GEN_ID_END       8194	//32bit width addr
    `define CF_GEN_ID_BYTE_ADDR 16'h8004//8bit width addr
    `define CF_GEN_ID_BYTE_WID  8		//8bit width size
    `define CF_GEN_ID_BYTE_END  16'h800b//8bit width addr

//Control Card, Serial Number, for Manufacturing
    `define CF_GEN_SN_NUM       1
    `define CF_GEN_SN_BIT_WID   64
    `define CF_GEN_SN_ADDR      8195	//32bit width addr
    `define CF_GEN_SN_SIZE      2		//32bit width size
    `define CF_GEN_SN_END       8196	//32bit width addr
    `define CF_GEN_SN_BYTE_ADDR 16'h800c//8bit width addr
    `define CF_GEN_SN_BYTE_WID  8		//8bit width size
    `define CF_GEN_SN_BYTE_END  16'h8013//8bit width addr

//Firmware Version ,compile date
    `define CF_GEN_FM_NUM       1
    `define CF_GEN_FM_BIT_WID   64
    `define CF_GEN_FM_ADDR      8197	//32bit width addr
    `define CF_GEN_FM_SIZE      2		//32bit width size
    `define CF_GEN_FM_END       8198	//32bit width addr
    `define CF_GEN_FM_BYTE_ADDR 16'h8014//8bit width addr
    `define CF_GEN_FM_BYTE_WID  8		//8bit width size
    `define CF_GEN_FM_BYTE_END  16'h801b//8bit width addr

//FPGA factory-programmed,read-onlyuniqueID
    `define CF_GEN_DNA_NUM       1
    `define CF_GEN_DNA_BIT_WID   57
    `define CF_GEN_DNA_ADDR      8199	//32bit width addr
    `define CF_GEN_DNA_SIZE      2		//32bit width size
    `define CF_GEN_DNA_END       8200	//32bit width addr
    `define CF_GEN_DNA_BYTE_ADDR 16'h801c//8bit width addr
    `define CF_GEN_DNA_BYTE_WID  8		//8bit width size
    `define CF_GEN_DNA_BYTE_END  16'h8023//8bit width addr

//Pass Word, for Safety and anti-cloning
    `define CF_GEN_PW_NUM       1
    `define CF_GEN_PW_BIT_WID   64
    `define CF_GEN_PW_ADDR      8201	//32bit width addr
    `define CF_GEN_PW_SIZE      2		//32bit width size
    `define CF_GEN_PW_END       8202	//32bit width addr
    `define CF_GEN_PW_BYTE_ADDR 16'h8024//8bit width addr
    `define CF_GEN_PW_BYTE_WID  8		//8bit width size
    `define CF_GEN_PW_BYTE_END  16'h802b//8bit width addr

//1 verified, 0 illegal
    `define CF_GEN_VF_NUM       1
    `define CF_GEN_VF_BIT_WID   1
    `define CF_GEN_VF_ADDR      8203	//32bit width addr
    `define CF_GEN_VF_SIZE      1		//32bit width size
    `define CF_GEN_VF_END       8203	//32bit width addr
    `define CF_GEN_VF_BYTE_ADDR 16'h802c//8bit width addr
    `define CF_GEN_VF_BYTE_WID  1		//8bit width size
    `define CF_GEN_VF_BYTE_END  16'h802c//8bit width addr

//FPGA Software Reset
    `define CF_GEN_RST_NUM       1
    `define CF_GEN_RST_BIT_WID   1
    `define CF_GEN_RST_ADDR      8204	//32bit width addr
    `define CF_GEN_RST_SIZE      1		//32bit width size
    `define CF_GEN_RST_END       8204	//32bit width addr
    `define CF_GEN_RST_BYTE_ADDR 16'h8030//8bit width addr
    `define CF_GEN_RST_BYTE_WID  1		//8bit width size
    `define CF_GEN_RST_BYTE_END  16'h8030//8bit width addr

//Reserved for future use		//reg_amp_vv1
    `define CF_GEN_RSV_NUM       1
    `define CF_GEN_RSV_BIT_WID   512
    `define CF_GEN_RSV_ADDR      8205	//32bit width addr
    `define CF_GEN_RSV_SIZE      16		//32bit width size
    `define CF_GEN_RSV_END       8220	//32bit width addr
    `define CF_GEN_RSV_BYTE_ADDR 16'h8034//8bit width addr
    `define CF_GEN_RSV_BYTE_WID  64		//8bit width size
    `define CF_GEN_RSV_BYTE_END  16'h8073//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier Chassis General
/////////////////////////////////////////////////////////////////////////////
//Led for communication
    `define AMP_LED_COM_NUM       1
    `define AMP_LED_COM_BIT_WID   1
    `define AMP_LED_COM_ADDR      8221	//32bit width addr
    `define AMP_LED_COM_SIZE      1		//32bit width size
    `define AMP_LED_COM_END       8221	//32bit width addr
    `define AMP_LED_COM_BYTE_ADDR 16'h8074//8bit width addr
    `define AMP_LED_COM_BYTE_WID  1		//8bit width size
    `define AMP_LED_COM_BYTE_END  16'h8074//8bit width addr

//Led for output enable
    `define AMP_LED_OUT_NUM       1
    `define AMP_LED_OUT_BIT_WID   1
    `define AMP_LED_OUT_ADDR      8222	//32bit width addr
    `define AMP_LED_OUT_SIZE      1		//32bit width size
    `define AMP_LED_OUT_END       8222	//32bit width addr
    `define AMP_LED_OUT_BYTE_ADDR 16'h8078//8bit width addr
    `define AMP_LED_OUT_BYTE_WID  1		//8bit width size
    `define AMP_LED_OUT_BYTE_END  16'h8078//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Inlet Air Temperature
/////////////////////////////////////////////////////////////////////////////
//1 reset, 0 work
    `define IN_AIR_RST_NUM       1
    `define IN_AIR_RST_BIT_WID   1
    `define IN_AIR_RST_ADDR      8223	//32bit width addr
    `define IN_AIR_RST_SIZE      1		//32bit width size
    `define IN_AIR_RST_END       8223	//32bit width addr
    `define IN_AIR_RST_BYTE_ADDR 16'h807c//8bit width addr
    `define IN_AIR_RST_BYTE_WID  1		//8bit width size
    `define IN_AIR_RST_BYTE_END  16'h807c//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Inlet Air Temperature
/////////////////////////////////////////////////////////////////////////////
//Tempreature limit, left to right= 0 to IN_AIR_NUM-1
    `define IN_AIR_TL_NUM       2
    `define IN_AIR_TL_BIT_WID   8
    `define IN_AIR_TL_ADDR      8224	//32bit width addr
    `define IN_AIR_TL_SIZE      1		//32bit width size
    `define IN_AIR_TL_END       8225	//32bit width addr
    `define IN_AIR_TL_BYTE_ADDR 16'h8080//8bit width addr
    `define IN_AIR_TL_BYTE_WID  1		//8bit width size
    `define IN_AIR_TL_BYTE_END  16'h8084//8bit width addr

//Temoerature value, left to right= 0 to IN_AIR_NUM-1
    `define IN_AIR_TV_NUM       2
    `define IN_AIR_TV_BIT_WID   8
    `define IN_AIR_TV_ADDR      8226	//32bit width addr
    `define IN_AIR_TV_SIZE      1		//32bit width size
    `define IN_AIR_TV_END       8227	//32bit width addr
    `define IN_AIR_TV_BYTE_ADDR 16'h8088//8bit width addr
    `define IN_AIR_TV_BYTE_WID  1		//8bit width size
    `define IN_AIR_TV_BYTE_END  16'h808c//8bit width addr

//Reserved for future use
    `define IN_AIR_RSV_NUM       2
    `define IN_AIR_RSV_BIT_WID   512
    `define IN_AIR_RSV_ADDR      8228	//32bit width addr
    `define IN_AIR_RSV_SIZE      16		//32bit width size
    `define IN_AIR_RSV_END       8259	//32bit width addr
    `define IN_AIR_RSV_BYTE_ADDR 16'h8090//8bit width addr
    `define IN_AIR_RSV_BYTE_WID  64		//8bit width size
    `define IN_AIR_RSV_BYTE_END  16'h810f//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Outlet Air Temperature
/////////////////////////////////////////////////////////////////////////////
//1 reset, 0 work
    `define OUT_AIR_RST_NUM       1
    `define OUT_AIR_RST_BIT_WID   1
    `define OUT_AIR_RST_ADDR      8260	//32bit width addr
    `define OUT_AIR_RST_SIZE      1		//32bit width size
    `define OUT_AIR_RST_END       8260	//32bit width addr
    `define OUT_AIR_RST_BYTE_ADDR 16'h8110//8bit width addr
    `define OUT_AIR_RST_BYTE_WID  1		//8bit width size
    `define OUT_AIR_RST_BYTE_END  16'h8110//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Outlet Air Temperature
/////////////////////////////////////////////////////////////////////////////
//Tempreature value, 0 left, OUT_AIR_NUM -1 right
    `define OUT_AIR_TL_NUM       4
    `define OUT_AIR_TL_BIT_WID   8
    `define OUT_AIR_TL_ADDR      8261	//32bit width addr
    `define OUT_AIR_TL_SIZE      1		//32bit width size
    `define OUT_AIR_TL_END       8264	//32bit width addr
    `define OUT_AIR_TL_BYTE_ADDR 16'h8114//8bit width addr
    `define OUT_AIR_TL_BYTE_WID  1		//8bit width size
    `define OUT_AIR_TL_BYTE_END  16'h8120//8bit width addr

//Temoerature limit, 0 left, OUT_AIR_NUM -1 right
    `define OUT_AIR_TV_NUM       4
    `define OUT_AIR_TV_BIT_WID   8
    `define OUT_AIR_TV_ADDR      8265	//32bit width addr
    `define OUT_AIR_TV_SIZE      1		//32bit width size
    `define OUT_AIR_TV_END       8268	//32bit width addr
    `define OUT_AIR_TV_BYTE_ADDR 16'h8124//8bit width addr
    `define OUT_AIR_TV_BYTE_WID  1		//8bit width size
    `define OUT_AIR_TV_BYTE_END  16'h8130//8bit width addr

//Reserved for future use
    `define OUT_AIR_RSV_NUM       4
    `define OUT_AIR_RSV_BIT_WID   512
    `define OUT_AIR_RSV_ADDR      8269	//32bit width addr
    `define OUT_AIR_RSV_SIZE      16		//32bit width size
    `define OUT_AIR_RSV_END       8332	//32bit width addr
    `define OUT_AIR_RSV_BYTE_ADDR 16'h8134//8bit width addr
    `define OUT_AIR_RSV_BYTE_WID  64		//8bit width size
    `define OUT_AIR_RSV_BYTE_END  16'h8233//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Fan control
/////////////////////////////////////////////////////////////////////////////
//1 reset, 0 work
    `define FAN_RST_NUM       1
    `define FAN_RST_BIT_WID   1
    `define FAN_RST_ADDR      8333	//32bit width addr
    `define FAN_RST_SIZE      1		//32bit width size
    `define FAN_RST_END       8333	//32bit width addr
    `define FAN_RST_BYTE_ADDR 16'h8234//8bit width addr
    `define FAN_RST_BYTE_WID  1		//8bit width size
    `define FAN_RST_BYTE_END  16'h8234//8bit width addr

//1 software manual, 0 hardware auto
    `define FAN_MODE_NUM       1
    `define FAN_MODE_BIT_WID   1
    `define FAN_MODE_ADDR      8334	//32bit width addr
    `define FAN_MODE_SIZE      1		//32bit width size
    `define FAN_MODE_END       8334	//32bit width addr
    `define FAN_MODE_BYTE_ADDR 16'h8238//8bit width addr
    `define FAN_MODE_BYTE_WID  1		//8bit width size
    `define FAN_MODE_BYTE_END  16'h8238//8bit width addr

//speed write, 0 stop  to 5 full
    `define FAN_SPEED_NUM       1
    `define FAN_SPEED_BIT_WID   4
    `define FAN_SPEED_ADDR      8335	//32bit width addr
    `define FAN_SPEED_SIZE      1		//32bit width size
    `define FAN_SPEED_END       8335	//32bit width addr
    `define FAN_SPEED_BYTE_ADDR 16'h823c//8bit width addr
    `define FAN_SPEED_BYTE_WID  1		//8bit width size
    `define FAN_SPEED_BYTE_END  16'h823c//8bit width addr

//speed read, rotate per minute, rpm
    `define FAN_RPM_NUM       1
    `define FAN_RPM_BIT_WID   16
    `define FAN_RPM_ADDR      8336	//32bit width addr
    `define FAN_RPM_SIZE      1		//32bit width size
    `define FAN_RPM_END       8336	//32bit width addr
    `define FAN_RPM_BYTE_ADDR 16'h8240//8bit width addr
    `define FAN_RPM_BYTE_WID  2		//8bit width size
    `define FAN_RPM_BYTE_END  16'h8241//8bit width addr

//Reserved for future use
    `define FAN_RSV_NUM       1
    `define FAN_RSV_BIT_WID   512
    `define FAN_RSV_ADDR      8337	//32bit width addr
    `define FAN_RSV_SIZE      16		//32bit width size
    `define FAN_RSV_END       8352	//32bit width addr
    `define FAN_RSV_BYTE_ADDR 16'h8244//8bit width addr
    `define FAN_RSV_BYTE_WID  64		//8bit width size
    `define FAN_RSV_BYTE_END  16'h8283//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Probe Pressent
/////////////////////////////////////////////////////////////////////////////
//0 present, 1 unconnected
    `define PROBE_PRES_NUM       1
    `define PROBE_PRES_BIT_WID   1
    `define PROBE_PRES_ADDR      8353	//32bit width addr
    `define PROBE_PRES_SIZE      1		//32bit width size
    `define PROBE_PRES_END       8353	//32bit width addr
    `define PROBE_PRES_BYTE_ADDR 16'h8284//8bit width addr
    `define PROBE_PRES_BYTE_WID  1		//8bit width size
    `define PROBE_PRES_BYTE_END  16'h8284//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier control
/////////////////////////////////////////////////////////////////////////////
//power switch, 0 on, 1 off
    `define AMP_PW_SW_NUM       64
    `define AMP_PW_SW_BIT_WID   1
    `define AMP_PW_SW_ADDR      8354	//32bit width addr
    `define AMP_PW_SW_SIZE      1		//32bit width size
    `define AMP_PW_SW_END       8417	//32bit width addr
    `define AMP_PW_SW_BYTE_ADDR 16'h8288//8bit width addr
    `define AMP_PW_SW_BYTE_WID  1		//8bit width size
    `define AMP_PW_SW_BYTE_END  16'h8384//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Amplifier control
/////////////////////////////////////////////////////////////////////////////
//Resistor value write
    `define AMP_RES_NUM       1
    `define AMP_RES_BIT_WID   512
    `define AMP_RES_ADDR      8418	//32bit width addr
    `define AMP_RES_SIZE      16		//32bit width size
    `define AMP_RES_END       8433	//32bit width addr
    `define AMP_RES_BYTE_ADDR 16'h8388//8bit width addr
    `define AMP_RES_BYTE_WID  64		//8bit width size
    `define AMP_RES_BYTE_END  16'h83c7//8bit width addr

//Resistor value read back
    `define AMP_RV_NUM       1
    `define AMP_RV_BIT_WID   512
    `define AMP_RV_ADDR      8434	//32bit width addr
    `define AMP_RV_SIZE      16		//32bit width size
    `define AMP_RV_END       8449	//32bit width addr
    `define AMP_RV_BYTE_ADDR 16'h83c8//8bit width addr
    `define AMP_RV_BYTE_WID  64		//8bit width size
    `define AMP_RV_BYTE_END  16'h8407//8bit width addr

//voltage read back value
    `define AMP_VV_NUM       1
    `define AMP_VV_BIT_WID   512
    `define AMP_VV_ADDR      8450	//32bit width addr
    `define AMP_VV_SIZE      16		//32bit width size
    `define AMP_VV_END       8465	//32bit width addr
    `define AMP_VV_BYTE_ADDR 16'h8408//8bit width addr
    `define AMP_VV_BYTE_WID  64		//8bit width size
    `define AMP_VV_BYTE_END  16'h8447//8bit width addr

//voltage limit
    `define AMP_VL_NUM       1
    `define AMP_VL_BIT_WID   512
    `define AMP_VL_ADDR      8466	//32bit width addr
    `define AMP_VL_SIZE      16		//32bit width size
    `define AMP_VL_END       8481	//32bit width addr
    `define AMP_VL_BYTE_ADDR 16'h8448//8bit width addr
    `define AMP_VL_BYTE_WID  64		//8bit width size
    `define AMP_VL_BYTE_END  16'h8487//8bit width addr

//current ampere read back value
    `define AMP_AV_NUM       1
    `define AMP_AV_BIT_WID   512
    `define AMP_AV_ADDR      8482	//32bit width addr
    `define AMP_AV_SIZE      16		//32bit width size
    `define AMP_AV_END       8497	//32bit width addr
    `define AMP_AV_BYTE_ADDR 16'h8488//8bit width addr
    `define AMP_AV_BYTE_WID  64		//8bit width size
    `define AMP_AV_BYTE_END  16'h84c7//8bit width addr

//current limit
    `define AMP_AL_NUM       1
    `define AMP_AL_BIT_WID   512
    `define AMP_AL_ADDR      8498	//32bit width addr
    `define AMP_AL_SIZE      16		//32bit width size
    `define AMP_AL_END       8513	//32bit width addr
    `define AMP_AL_BYTE_ADDR 16'h84c8//8bit width addr
    `define AMP_AL_BYTE_WID  64		//8bit width size
    `define AMP_AL_BYTE_END  16'h8507//8bit width addr

//Reserved for future use			//reg_amp_av1
    `define AMP_RSV_NUM       1
    `define AMP_RSV_BIT_WID   512
    `define AMP_RSV_ADDR      8514	//32bit width addr
    `define AMP_RSV_SIZE      16		//32bit width size
    `define AMP_RSV_END       8529	//32bit width addr
    `define AMP_RSV_BYTE_ADDR 16'h8508//8bit width addr
    `define AMP_RSV_BYTE_WID  64		//8bit width size
    `define AMP_RSV_BYTE_END  16'h8547//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA I2C CRC Interrupt status
/////////////////////////////////////////////////////////////////////////////
//I2C line CRC error
    `define IRQ_STA_CF_CRC_NUM       1
    `define IRQ_STA_CF_CRC_BIT_WID   1
    `define IRQ_STA_CF_CRC_ADDR      8530	//32bit width addr
    `define IRQ_STA_CF_CRC_SIZE      1		//32bit width size
    `define IRQ_STA_CF_CRC_END       8530	//32bit width addr
    `define IRQ_STA_CF_CRC_BYTE_ADDR 16'h8548//8bit width addr
    `define IRQ_STA_CF_CRC_BYTE_WID  1		//8bit width size
    `define IRQ_STA_CF_CRC_BYTE_END  16'h8548//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Transducer connector Interrupt status
/////////////////////////////////////////////////////////////////////////////
//Chassis Insert In
    `define IRQ_STA_TRAN_CII_NUM       1
    `define IRQ_STA_TRAN_CII_BIT_WID   1
    `define IRQ_STA_TRAN_CII_ADDR      8531	//32bit width addr
    `define IRQ_STA_TRAN_CII_SIZE      1		//32bit width size
    `define IRQ_STA_TRAN_CII_END       8531	//32bit width addr
    `define IRQ_STA_TRAN_CII_BYTE_ADDR 16'h854c//8bit width addr
    `define IRQ_STA_TRAN_CII_BYTE_WID  1		//8bit width size
    `define IRQ_STA_TRAN_CII_BYTE_END  16'h854c//8bit width addr

//Chassis Pull out
    `define IRQ_STA_TRAN_CPO_NUM       1
    `define IRQ_STA_TRAN_CPO_BIT_WID   1
    `define IRQ_STA_TRAN_CPO_ADDR      8532	//32bit width addr
    `define IRQ_STA_TRAN_CPO_SIZE      1		//32bit width size
    `define IRQ_STA_TRAN_CPO_END       8532	//32bit width addr
    `define IRQ_STA_TRAN_CPO_BYTE_ADDR 16'h8550//8bit width addr
    `define IRQ_STA_TRAN_CPO_BYTE_WID  1		//8bit width size
    `define IRQ_STA_TRAN_CPO_BYTE_END  16'h8550//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Inlet Air temperature Interrupt status
/////////////////////////////////////////////////////////////////////////////
//temperature over limit
    `define IRQ_STA_IN_TOL_NUM       2
    `define IRQ_STA_IN_TOL_BIT_WID   1
    `define IRQ_STA_IN_TOL_ADDR      8533	//32bit width addr
    `define IRQ_STA_IN_TOL_SIZE      1		//32bit width size
    `define IRQ_STA_IN_TOL_END       8534	//32bit width addr
    `define IRQ_STA_IN_TOL_BYTE_ADDR 16'h8554//8bit width addr
    `define IRQ_STA_IN_TOL_BYTE_WID  1		//8bit width size
    `define IRQ_STA_IN_TOL_BYTE_END  16'h8558//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Outlet Air temperature Interrupt status
/////////////////////////////////////////////////////////////////////////////
//temperature over limit
    `define IRQ_STA_OUT_TOL_NUM       4
    `define IRQ_STA_OUT_TOL_BIT_WID   1
    `define IRQ_STA_OUT_TOL_ADDR      8535	//32bit width addr
    `define IRQ_STA_OUT_TOL_SIZE      1		//32bit width size
    `define IRQ_STA_OUT_TOL_END       8538	//32bit width addr
    `define IRQ_STA_OUT_TOL_BYTE_ADDR 16'h855c//8bit width addr
    `define IRQ_STA_OUT_TOL_BYTE_WID  1		//8bit width size
    `define IRQ_STA_OUT_TOL_BYTE_END  16'h8568//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Amplifier Interrupt status
/////////////////////////////////////////////////////////////////////////////
//Voltage over limit
    `define IRQ_STA_AMP_VOL_NUM       64
    `define IRQ_STA_AMP_VOL_BIT_WID   1
    `define IRQ_STA_AMP_VOL_ADDR      8539	//32bit width addr
    `define IRQ_STA_AMP_VOL_SIZE      1		//32bit width size
    `define IRQ_STA_AMP_VOL_END       8602	//32bit width addr
    `define IRQ_STA_AMP_VOL_BYTE_ADDR 16'h856c//8bit width addr
    `define IRQ_STA_AMP_VOL_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AMP_VOL_BYTE_END  16'h8668//8bit width addr

//Current over limit
    `define IRQ_STA_AMP_AOL_NUM       64
    `define IRQ_STA_AMP_AOL_BIT_WID   1
    `define IRQ_STA_AMP_AOL_ADDR      8603	//32bit width addr
    `define IRQ_STA_AMP_AOL_SIZE      1		//32bit width size
    `define IRQ_STA_AMP_AOL_END       8666	//32bit width addr
    `define IRQ_STA_AMP_AOL_BYTE_ADDR 16'h866c//8bit width addr
    `define IRQ_STA_AMP_AOL_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AMP_AOL_BYTE_END  16'h8768//8bit width addr

//auto read machine I2C error
    `define IRQ_STA_AMP_I2C_ERR_NUM       64
    `define IRQ_STA_AMP_I2C_ERR_BIT_WID   1
    `define IRQ_STA_AMP_I2C_ERR_ADDR      8667	//32bit width addr
    `define IRQ_STA_AMP_I2C_ERR_SIZE      1		//32bit width size
    `define IRQ_STA_AMP_I2C_ERR_END       8730	//32bit width addr
    `define IRQ_STA_AMP_I2C_ERR_BYTE_ADDR 16'h876c//8bit width addr
    `define IRQ_STA_AMP_I2C_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_STA_AMP_I2C_ERR_BYTE_END  16'h8868//8bit width addr

//Reserved for future use
    `define IRQ_STA_RSV_RSV_NUM       1
    `define IRQ_STA_RSV_RSV_BIT_WID   512
    `define IRQ_STA_RSV_RSV_ADDR      8731	//32bit width addr
    `define IRQ_STA_RSV_RSV_SIZE      16		//32bit width size
    `define IRQ_STA_RSV_RSV_END       8746	//32bit width addr
    `define IRQ_STA_RSV_RSV_BYTE_ADDR 16'h886c//8bit width addr
    `define IRQ_STA_RSV_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_STA_RSV_RSV_BYTE_END  16'h88ab//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA I2C CRC Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//I2C line CRC error
    `define IRQ_MASK_CF_CRC_NUM       1
    `define IRQ_MASK_CF_CRC_BIT_WID   1
    `define IRQ_MASK_CF_CRC_ADDR      8747	//32bit width addr
    `define IRQ_MASK_CF_CRC_SIZE      1		//32bit width size
    `define IRQ_MASK_CF_CRC_END       8747	//32bit width addr
    `define IRQ_MASK_CF_CRC_BYTE_ADDR 16'h88ac//8bit width addr
    `define IRQ_MASK_CF_CRC_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_CF_CRC_BYTE_END  16'h88ac//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Transducer connector Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//Chassis Insert In
    `define IRQ_MASK_TRAN_CII_NUM       1
    `define IRQ_MASK_TRAN_CII_BIT_WID   1
    `define IRQ_MASK_TRAN_CII_ADDR      8748	//32bit width addr
    `define IRQ_MASK_TRAN_CII_SIZE      1		//32bit width size
    `define IRQ_MASK_TRAN_CII_END       8748	//32bit width addr
    `define IRQ_MASK_TRAN_CII_BYTE_ADDR 16'h88b0//8bit width addr
    `define IRQ_MASK_TRAN_CII_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_TRAN_CII_BYTE_END  16'h88b0//8bit width addr

//Chassis Pull out
    `define IRQ_MASK_TRAN_CPO_NUM       1
    `define IRQ_MASK_TRAN_CPO_BIT_WID   1
    `define IRQ_MASK_TRAN_CPO_ADDR      8749	//32bit width addr
    `define IRQ_MASK_TRAN_CPO_SIZE      1		//32bit width size
    `define IRQ_MASK_TRAN_CPO_END       8749	//32bit width addr
    `define IRQ_MASK_TRAN_CPO_BYTE_ADDR 16'h88b4//8bit width addr
    `define IRQ_MASK_TRAN_CPO_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_TRAN_CPO_BYTE_END  16'h88b4//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Inlet Air temperature Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//temperature over limit
    `define IRQ_MASK_IN_TOL_NUM       2
    `define IRQ_MASK_IN_TOL_BIT_WID   1
    `define IRQ_MASK_IN_TOL_ADDR      8750	//32bit width addr
    `define IRQ_MASK_IN_TOL_SIZE      1		//32bit width size
    `define IRQ_MASK_IN_TOL_END       8751	//32bit width addr
    `define IRQ_MASK_IN_TOL_BYTE_ADDR 16'h88b8//8bit width addr
    `define IRQ_MASK_IN_TOL_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_IN_TOL_BYTE_END  16'h88bc//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Outlet Air temperature Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//temperature over limit
    `define IRQ_MASK_OUT_TOL_NUM       4
    `define IRQ_MASK_OUT_TOL_BIT_WID   1
    `define IRQ_MASK_OUT_TOL_ADDR      8752	//32bit width addr
    `define IRQ_MASK_OUT_TOL_SIZE      1		//32bit width size
    `define IRQ_MASK_OUT_TOL_END       8755	//32bit width addr
    `define IRQ_MASK_OUT_TOL_BYTE_ADDR 16'h88c0//8bit width addr
    `define IRQ_MASK_OUT_TOL_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_OUT_TOL_BYTE_END  16'h88cc//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Control FPGA Amplifier Interrupt Mask
/////////////////////////////////////////////////////////////////////////////
//Voltage over limit
    `define IRQ_MASK_AMP_VOL_NUM       64
    `define IRQ_MASK_AMP_VOL_BIT_WID   1
    `define IRQ_MASK_AMP_VOL_ADDR      8756	//32bit width addr
    `define IRQ_MASK_AMP_VOL_SIZE      1		//32bit width size
    `define IRQ_MASK_AMP_VOL_END       8819	//32bit width addr
    `define IRQ_MASK_AMP_VOL_BYTE_ADDR 16'h88d0//8bit width addr
    `define IRQ_MASK_AMP_VOL_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AMP_VOL_BYTE_END  16'h89cc//8bit width addr

//Current over limit
    `define IRQ_MASK_AMP_AOL_NUM       64
    `define IRQ_MASK_AMP_AOL_BIT_WID   1
    `define IRQ_MASK_AMP_AOL_ADDR      8820	//32bit width addr
    `define IRQ_MASK_AMP_AOL_SIZE      1		//32bit width size
    `define IRQ_MASK_AMP_AOL_END       8883	//32bit width addr
    `define IRQ_MASK_AMP_AOL_BYTE_ADDR 16'h89d0//8bit width addr
    `define IRQ_MASK_AMP_AOL_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AMP_AOL_BYTE_END  16'h8acc//8bit width addr

//auto read machine I2C error
    `define IRQ_MASK_AMP_I2C_ERR_NUM       64
    `define IRQ_MASK_AMP_I2C_ERR_BIT_WID   1
    `define IRQ_MASK_AMP_I2C_ERR_ADDR      8884	//32bit width addr
    `define IRQ_MASK_AMP_I2C_ERR_SIZE      1		//32bit width size
    `define IRQ_MASK_AMP_I2C_ERR_END       8947	//32bit width addr
    `define IRQ_MASK_AMP_I2C_ERR_BYTE_ADDR 16'h8ad0//8bit width addr
    `define IRQ_MASK_AMP_I2C_ERR_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_AMP_I2C_ERR_BYTE_END  16'h8bcc//8bit width addr

//Reserved for future use
    `define IRQ_MASK_RSV_RSV_NUM       1
    `define IRQ_MASK_RSV_RSV_BIT_WID   512
    `define IRQ_MASK_RSV_RSV_ADDR      8948	//32bit width addr
    `define IRQ_MASK_RSV_RSV_SIZE      16		//32bit width size
    `define IRQ_MASK_RSV_RSV_END       8963	//32bit width addr
    `define IRQ_MASK_RSV_RSV_BYTE_ADDR 16'h8bd0//8bit width addr
    `define IRQ_MASK_RSV_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_MASK_RSV_RSV_BYTE_END  16'h8c0f//8bit width addr

`endif

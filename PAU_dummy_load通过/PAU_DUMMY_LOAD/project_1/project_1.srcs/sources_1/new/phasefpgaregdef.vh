`ifndef PHASEFPGAREGDEF__V__
    `define PHASEFPGAREGDEF__V__

    

/////////////////////////////////////////////////////////////////////////////
//Phase FPGA General
/////////////////////////////////////////////////////////////////////////////
//Scratch Register, for read and write test
    `define PF_GEN_SCR_NUM       1
    `define PF_GEN_SCR_BIT_WID   8
    `define PF_GEN_SCR_ADDR      4096	//32bit width addr
    `define PF_GEN_SCR_SIZE      1		//32bit width size
    `define PF_GEN_SCR_END       4096	//32bit width addr
    `define PF_GEN_SCR_BYTE_ADDR 16'h4000//8bit width addr
    `define PF_GEN_SCR_BYTE_WID  1		//8bit width size
    `define PF_GEN_SCR_BYTE_END  16'h4000//8bit width addr

//ShendeMT = Shende Medical Technology
    `define PF_GEN_ID_NUM       1
    `define PF_GEN_ID_BIT_WID   64
    `define PF_GEN_ID_ADDR      4097	//32bit width addr
    `define PF_GEN_ID_SIZE      2		//32bit width size
    `define PF_GEN_ID_END       4098	//32bit width addr
    `define PF_GEN_ID_BYTE_ADDR 16'h4004//8bit width addr
    `define PF_GEN_ID_BYTE_WID  8		//8bit width size
    `define PF_GEN_ID_BYTE_END  16'h400b//8bit width addr

//Phase Card, Serial Number, for Manufacturing
    `define PF_GEN_SN_NUM       1
    `define PF_GEN_SN_BIT_WID   64
    `define PF_GEN_SN_ADDR      4099	//32bit width addr
    `define PF_GEN_SN_SIZE      2		//32bit width size
    `define PF_GEN_SN_END       4100	//32bit width addr
    `define PF_GEN_SN_BYTE_ADDR 16'h400c//8bit width addr
    `define PF_GEN_SN_BYTE_WID  8		//8bit width size
    `define PF_GEN_SN_BYTE_END  16'h4013//8bit width addr

//Firmware Version ,compile date
    `define PF_GEN_FM_NUM       1
    `define PF_GEN_FM_BIT_WID   64
    `define PF_GEN_FM_ADDR      4101	//32bit width addr
    `define PF_GEN_FM_SIZE      2		//32bit width size
    `define PF_GEN_FM_END       4102	//32bit width addr
    `define PF_GEN_FM_BYTE_ADDR 16'h4014//8bit width addr
    `define PF_GEN_FM_BYTE_WID  8		//8bit width size
    `define PF_GEN_FM_BYTE_END  16'h401b//8bit width addr

//FPGA factory-programmed,read-onlyuniqueID
    `define PF_GEN_DNA_NUM       1
    `define PF_GEN_DNA_BIT_WID   57
    `define PF_GEN_DNA_ADDR      4103	//32bit width addr
    `define PF_GEN_DNA_SIZE      2		//32bit width size
    `define PF_GEN_DNA_END       4104	//32bit width addr
    `define PF_GEN_DNA_BYTE_ADDR 16'h401c//8bit width addr
    `define PF_GEN_DNA_BYTE_WID  8		//8bit width size
    `define PF_GEN_DNA_BYTE_END  16'h4023//8bit width addr

//Pass Word, for Safety and anti-cloning
    `define PF_GEN_PW_NUM       1
    `define PF_GEN_PW_BIT_WID   64
    `define PF_GEN_PW_ADDR      4105	//32bit width addr
    `define PF_GEN_PW_SIZE      2		//32bit width size
    `define PF_GEN_PW_END       4106	//32bit width addr
    `define PF_GEN_PW_BYTE_ADDR 16'h4024//8bit width addr
    `define PF_GEN_PW_BYTE_WID  8		//8bit width size
    `define PF_GEN_PW_BYTE_END  16'h402b//8bit width addr

//1 verified, 0 illegal
    `define PF_GEN_VF_NUM       1
    `define PF_GEN_VF_BIT_WID   1
    `define PF_GEN_VF_ADDR      4107	//32bit width addr
    `define PF_GEN_VF_SIZE      1		//32bit width size
    `define PF_GEN_VF_END       4107	//32bit width addr
    `define PF_GEN_VF_BYTE_ADDR 16'h402c//8bit width addr
    `define PF_GEN_VF_BYTE_WID  1		//8bit width size
    `define PF_GEN_VF_BYTE_END  16'h402c//8bit width addr

//FPGA Software Reset
    `define PF_GEN_RST_NUM       1
    `define PF_GEN_RST_BIT_WID   1
    `define PF_GEN_RST_ADDR      4108	//32bit width addr
    `define PF_GEN_RST_SIZE      1		//32bit width size
    `define PF_GEN_RST_END       4108	//32bit width addr
    `define PF_GEN_RST_BYTE_ADDR 16'h4030//8bit width addr
    `define PF_GEN_RST_BYTE_WID  1		//8bit width size
    `define PF_GEN_RST_BYTE_END  16'h4030//8bit width addr

//Reserved for future use
    `define PF_GEN_RSV_NUM       1
    `define PF_GEN_RSV_BIT_WID   512
    `define PF_GEN_RSV_ADDR      4109	//32bit width addr
    `define PF_GEN_RSV_SIZE      16		//32bit width size
    `define PF_GEN_RSV_END       4124	//32bit width addr
    `define PF_GEN_RSV_BYTE_ADDR 16'h4034//8bit width addr
    `define PF_GEN_RSV_BYTE_WID  64		//8bit width size
    `define PF_GEN_RSV_BYTE_END  16'h4073//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase deadtime
/////////////////////////////////////////////////////////////////////////////
//Deadtime select for hardware use only
    `define PF_PHS_DT_NUM       1
    `define PF_PHS_DT_BIT_WID   4
    `define PF_PHS_DT_ADDR      4125	//32bit width addr
    `define PF_PHS_DT_SIZE      1		//32bit width size
    `define PF_PHS_DT_END       4125	//32bit width addr
    `define PF_PHS_DT_BYTE_ADDR 16'h4074//8bit width addr
    `define PF_PHS_DT_BYTE_WID  1		//8bit width size
    `define PF_PHS_DT_BYTE_END  16'h4074//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Switch
/////////////////////////////////////////////////////////////////////////////
//phase global switch, 1 open, 0 close, default open
    `define PF_SW_GLB_NUM       1
    `define PF_SW_GLB_BIT_WID   1
    `define PF_SW_GLB_ADDR      4126	//32bit width addr
    `define PF_SW_GLB_SIZE      1		//32bit width size
    `define PF_SW_GLB_END       4126	//32bit width addr
    `define PF_SW_GLB_BYTE_ADDR 16'h4078//8bit width addr
    `define PF_SW_GLB_BYTE_WID  1		//8bit width size
    `define PF_SW_GLB_BYTE_END  16'h4078//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Switch
/////////////////////////////////////////////////////////////////////////////
//phase channel switch, 1 open, 0 close, default open
    `define PF_SW_CHN_NUM       64
    `define PF_SW_CHN_BIT_WID   1
    `define PF_SW_CHN_ADDR      4127	//32bit width addr
    `define PF_SW_CHN_SIZE      1		//32bit width size
    `define PF_SW_CHN_END       4190	//32bit width addr
    `define PF_SW_CHN_BYTE_ADDR 16'h407c//8bit width addr
    `define PF_SW_CHN_BYTE_WID  1		//8bit width size
    `define PF_SW_CHN_BYTE_END  16'h4178//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase Driect
/////////////////////////////////////////////////////////////////////////////
//Driect write phase, from cpu to phase fpga register
    `define PF_PHS_DIR_NUM       1
    `define PF_PHS_DIR_BIT_WID   512
    `define PF_PHS_DIR_ADDR      4191	//32bit width addr
    `define PF_PHS_DIR_SIZE      16		//32bit width size
    `define PF_PHS_DIR_END       4206	//32bit width addr
    `define PF_PHS_DIR_BYTE_ADDR 16'h417c//8bit width addr
    `define PF_PHS_DIR_BYTE_WID  64		//8bit width size
    `define PF_PHS_DIR_BYTE_END  16'h41bb//8bit width addr

//0:use Driect, 1:use treatment plan
    `define PF_PHS_MUX_NUM       1
    `define PF_PHS_MUX_BIT_WID   1
    `define PF_PHS_MUX_ADDR      4207	//32bit width addr
    `define PF_PHS_MUX_SIZE      1		//32bit width size
    `define PF_PHS_MUX_END       4207	//32bit width addr
    `define PF_PHS_MUX_BYTE_ADDR 16'h41bc//8bit width addr
    `define PF_PHS_MUX_BYTE_WID  1		//8bit width size
    `define PF_PHS_MUX_BYTE_END  16'h41bc//8bit width addr

//Current treatment plan index, from 0 to 31
    `define PF_PHS_TP_IND_NUM       1
    `define PF_PHS_TP_IND_BIT_WID   5
    `define PF_PHS_TP_IND_ADDR      4208	//32bit width addr
    `define PF_PHS_TP_IND_SIZE      1		//32bit width size
    `define PF_PHS_TP_IND_END       4208	//32bit width addr
    `define PF_PHS_TP_IND_BYTE_ADDR 16'h41c0//8bit width addr
    `define PF_PHS_TP_IND_BYTE_WID  1		//8bit width size
    `define PF_PHS_TP_IND_BYTE_END  16'h41c0//8bit width addr

//ASCII of string 'HEAT' indicates heating, 'IDLE' indicates cooling, others indicates system error
    `define PF_PHS_HEATING_NUM       1
    `define PF_PHS_HEATING_BIT_WID   32
    `define PF_PHS_HEATING_ADDR      4209	//32bit width addr
    `define PF_PHS_HEATING_SIZE      1		//32bit width size
    `define PF_PHS_HEATING_END       4209	//32bit width addr
    `define PF_PHS_HEATING_BYTE_ADDR 16'h41c4//8bit width addr
    `define PF_PHS_HEATING_BYTE_WID  4		//8bit width size
    `define PF_PHS_HEATING_BYTE_END  16'h41c7//8bit width addr

//Reserved for future use
    `define PF_PHS_RSV_NUM       1
    `define PF_PHS_RSV_BIT_WID   512
    `define PF_PHS_RSV_ADDR      4210	//32bit width addr
    `define PF_PHS_RSV_SIZE      16		//32bit width size
    `define PF_PHS_RSV_END       4225	//32bit width addr
    `define PF_PHS_RSV_BYTE_ADDR 16'h41c8//8bit width addr
    `define PF_PHS_RSV_BYTE_WID  64		//8bit width size
    `define PF_PHS_RSV_BYTE_END  16'h4207//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Treatment plan
/////////////////////////////////////////////////////////////////////////////
//Heat time, Unit 10ns, from 0 to max 3 hours
    `define PF_TP_HT_NUM       6
    `define PF_TP_HT_BIT_WID   32
    `define PF_TP_HT_ADDR      4226	//32bit width addr
    `define PF_TP_HT_SIZE      1		//32bit width size
    `define PF_TP_HT_END       4231	//32bit width addr
    `define PF_TP_HT_BYTE_ADDR 16'h4208//8bit width addr
    `define PF_TP_HT_BYTE_WID  4		//8bit width size
    `define PF_TP_HT_BYTE_END  16'h421f//8bit width addr

//Cool time, Unit 10ns, from 0 to max 3 hours
    `define PF_TP_CT_NUM       6
    `define PF_TP_CT_BIT_WID   32
    `define PF_TP_CT_ADDR      4232	//32bit width addr
    `define PF_TP_CT_SIZE      1		//32bit width size
    `define PF_TP_CT_END       4237	//32bit width addr
    `define PF_TP_CT_BYTE_ADDR 16'h4220//8bit width addr
    `define PF_TP_CT_BYTE_WID  4		//8bit width size
    `define PF_TP_CT_BYTE_END  16'h4237//8bit width addr

//Repeat time, from 0 to 255
    `define PF_TP_RPT_NUM       6
    `define PF_TP_RPT_BIT_WID   32
    `define PF_TP_RPT_ADDR      4238	//32bit width addr
    `define PF_TP_RPT_SIZE      1		//32bit width size
    `define PF_TP_RPT_END       4243	//32bit width addr
    `define PF_TP_RPT_BYTE_ADDR 16'h4238//8bit width addr
    `define PF_TP_RPT_BYTE_WID  4		//8bit width size
    `define PF_TP_RPT_BYTE_END  16'h424f//8bit width addr

//Phase
    `define PF_TP_PHS_NUM       6
    `define PF_TP_PHS_BIT_WID   512
    `define PF_TP_PHS_ADDR      4244	//32bit width addr
    `define PF_TP_PHS_SIZE      16		//32bit width size
    `define PF_TP_PHS_END       4339	//32bit width addr
    `define PF_TP_PHS_BYTE_ADDR 16'h4250//8bit width addr
    `define PF_TP_PHS_BYTE_WID  64		//8bit width size
    `define PF_TP_PHS_BYTE_END  16'h43cf//8bit width addr

//Reserved for future use
    `define PF_TP_RSV_NUM       6
    `define PF_TP_RSV_BIT_WID   512
    `define PF_TP_RSV_ADDR      4340	//32bit width addr
    `define PF_TP_RSV_SIZE      16		//32bit width size
    `define PF_TP_RSV_END       4435	//32bit width addr
    `define PF_TP_RSV_BYTE_ADDR 16'h43d0//8bit width addr
    `define PF_TP_RSV_BYTE_WID  64		//8bit width size
    `define PF_TP_RSV_BYTE_END  16'h454f//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase FPGA I2C CRC Interrupt status
/////////////////////////////////////////////////////////////////////////////
//I2C line CRC error
    `define IRQ_STA_PF_CRC_NUM       1
    `define IRQ_STA_PF_CRC_BIT_WID   1
    `define IRQ_STA_PF_CRC_ADDR      4436	//32bit width addr
    `define IRQ_STA_PF_CRC_SIZE      1		//32bit width size
    `define IRQ_STA_PF_CRC_END       4436	//32bit width addr
    `define IRQ_STA_PF_CRC_BYTE_ADDR 16'h4550//8bit width addr
    `define IRQ_STA_PF_CRC_BYTE_WID  1		//8bit width size
    `define IRQ_STA_PF_CRC_BYTE_END  16'h4550//8bit width addr

//Reserved for future use
    `define IRQ_STA_PF_RSV_NUM       1
    `define IRQ_STA_PF_RSV_BIT_WID   512
    `define IRQ_STA_PF_RSV_ADDR      4437	//32bit width addr
    `define IRQ_STA_PF_RSV_SIZE      16		//32bit width size
    `define IRQ_STA_PF_RSV_END       4452	//32bit width addr
    `define IRQ_STA_PF_RSV_BYTE_ADDR 16'h4554//8bit width addr
    `define IRQ_STA_PF_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_STA_PF_RSV_BYTE_END  16'h4593//8bit width addr


/////////////////////////////////////////////////////////////////////////////
//Phase FPGA I2C CRC Interrupt mask
/////////////////////////////////////////////////////////////////////////////
//I2C line CRC error
    `define IRQ_MASK_PF_CRC_NUM       1
    `define IRQ_MASK_PF_CRC_BIT_WID   1
    `define IRQ_MASK_PF_CRC_ADDR      4453	//32bit width addr
    `define IRQ_MASK_PF_CRC_SIZE      1		//32bit width size
    `define IRQ_MASK_PF_CRC_END       4453	//32bit width addr
    `define IRQ_MASK_PF_CRC_BYTE_ADDR 16'h4594//8bit width addr
    `define IRQ_MASK_PF_CRC_BYTE_WID  1		//8bit width size
    `define IRQ_MASK_PF_CRC_BYTE_END  16'h4594//8bit width addr

//Reserved for future use
    `define IRQ_MASK_PF_RSV_NUM       1
    `define IRQ_MASK_PF_RSV_BIT_WID   512
    `define IRQ_MASK_PF_RSV_ADDR      4454	//32bit width addr
    `define IRQ_MASK_PF_RSV_SIZE      16		//32bit width size
    `define IRQ_MASK_PF_RSV_END       4469	//32bit width addr
    `define IRQ_MASK_PF_RSV_BYTE_ADDR 16'h4598//8bit width addr
    `define IRQ_MASK_PF_RSV_BYTE_WID  64		//8bit width size
    `define IRQ_MASK_PF_RSV_BYTE_END  16'h45d7//8bit width addr

`endif

这是用fpga虚拟的整体功放箱PAU，可用于主控板功能测试。

该文件夹下有两个工程：
1、VIVADO工程虚拟整个功放箱负载；
2、DEVC++工程用于测试该VIVADO工程；

测试准备：
1、将该vivado工程打开，生成artix-7100t器件的bit文件并烧写

2、fpga板的switch1-7，ON为1，OFF为0。功能分别是：1,2设置进口温度，3,4设置出口温度，5,6设置电压，7模拟pfpga中断，8模拟cfpga中断
switch初始可设置：00000000；
其他值：11111100含义：根据进口温度={4'b0111,switch_in_sync[0],2'b11,switch_in_sync[1]},因此进口温度为0x7f。同理出口温度={4'b0111,switch_in_sync[2],2'b11,switch_in_sync[3]}。电压=

3、fan_speed输出到LED[1]，speed为0.1.2时闪烁频率2s，speed为3,4,5时闪烁温度为1s，这里由于温度设置范围有限，只能输出speed为0,可通过mantual模式调整speed.

4、连接好ginkgo的sda到cfpga_sda在开发板的c7,连接好ginkgo的scl到cfpga_scl在开发板的c8,以及共GND，同理pfpga_sda和pfpga_scl分别在开发板c12和c16.

5、打开DEVC++工程运行，按照function list选择测试功能即可



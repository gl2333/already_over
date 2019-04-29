//lwjiee@Shende
//2017-3-15 17:58:17
module dna #(
    parameter DNA_PORT_START_CNT=10,
    parameter DNA_PORT_BYTE_WIDTH=57
)
(
    input clk,
    input rst,
    output reg [DNA_PORT_BYTE_WIDTH-1:0] dna_out,
    output reg dna_valid
);  
  reg [7:0] cnt;
  
  always@(posedge clk)begin
    if(rst||dna_valid)cnt <= 0;
    else cnt <= cnt + 1;
  end
  
  wire dna_port_dout; 
  wire dan_port_read  = (cnt == DNA_PORT_START_CNT);
  wire dna_port_shift = (cnt >= DNA_PORT_START_CNT+1)&&(cnt < DNA_PORT_START_CNT + DNA_PORT_BYTE_WIDTH + 1);

  
  always@(posedge clk)
 if(rst) dna_valid <= 0;
 else if(cnt == DNA_PORT_START_CNT + DNA_PORT_BYTE_WIDTH + 1)
  dna_valid <= 1;
 
  always@(posedge clk)
   if(rst)
      dna_out <= 0;
   else if(dan_port_read||dna_port_shift)
     dna_out <= {dna_out[DNA_PORT_BYTE_WIDTH-2:0],dna_port_dout};
   
  DNA_PORT u_dna_port(
    .DOUT(dna_port_dout),  // 1-bit output: DNA output data.
    .CLK(clk),   // 1-bit input: Clock input.
    .DIN(1'b0),    // 1-bit input: User data input pin.
    .READ(dan_port_read),  // 1-bit input: Active high load DNA, active low read input.
    .SHIFT(dna_port_shift)  // 1-bit input: Active high shift enable input.
  );
endmodule
 
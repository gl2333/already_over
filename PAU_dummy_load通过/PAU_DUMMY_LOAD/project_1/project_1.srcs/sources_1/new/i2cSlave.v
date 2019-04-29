`timescale 1ns / 1ps
`include "i2cSlave_define.vh"
module i2cSlave(
 input    clk,
 input    rst,
 input    scl,
 input    sdaIn,
 output   sdaOut,
 output [(I2C_ADDR_BYTE_WIDTH*8-1):0] addr,  
 output   writeEn, 
 output      readEn,
 output [7:0]writeData,
 input  [7:0]readData
 );

 parameter I2C_ADDRESS = 7'b0;
 parameter I2C_ADDR_BYTE_WIDTH = 1;
 
 // local wires and regs
reg sdaDeb;
reg sclDeb;
reg [`DEB_I2C_LEN-1:0] sdaPipe;
reg [`DEB_I2C_LEN-1:0] sclPipe;

reg [`SCL_DEL_LEN-1:0] sclDelayed;
reg [`SDA_DEL_LEN-1:0] sdaDelayed;
reg [1:0] startStopDetState;
wire clearStartStopDet;
reg startEdgeDet;


// debounce sda and scl
always @(posedge clk) begin
  if (rst == 1'b1) begin
    sdaPipe <= {`DEB_I2C_LEN{1'b1}};
    sdaDeb <= 1'b1;
    sclPipe <= {`DEB_I2C_LEN{1'b1}};
    sclDeb <= 1'b1;
  end
  else begin
    sdaPipe <= {sdaPipe[`DEB_I2C_LEN-2:0], sdaIn};
    sclPipe <= {sclPipe[`DEB_I2C_LEN-2:0], scl};
    if (&sclPipe[`DEB_I2C_LEN-1:1] == 1'b1)
      sclDeb <= 1'b1;
    else if (|sclPipe[`DEB_I2C_LEN-1:1] == 1'b0)
      sclDeb <= 1'b0;
    if (&sdaPipe[`DEB_I2C_LEN-1:1] == 1'b1)
      sdaDeb <= 1'b1;
    else if (|sdaPipe[`DEB_I2C_LEN-1:1] == 1'b0)
      sdaDeb <= 1'b0;
  end
end


// delay scl and sda
// sclDelayed is used as a delayed sampling clock
// sdaDelayed is only used for start stop detection
// Because sda hold time from scl falling is 0nS
// sda must be delayed with respect to scl to avoid incorrect
// detection of start/stop at scl falling edge. 
always @(posedge clk) begin
  if (rst == 1'b1) begin
    sclDelayed <= {`SCL_DEL_LEN{1'b1}};
    sdaDelayed <= {`SDA_DEL_LEN{1'b1}};
  end
  else begin
    sclDelayed <= {sclDelayed[`SCL_DEL_LEN-2:0], sclDeb};
    sdaDelayed <= {sdaDelayed[`SDA_DEL_LEN-2:0], sdaDeb};
  end
end

// start stop detection
always @(posedge clk) begin
  if (rst == 1'b1) begin
    startStopDetState <= `NULL_DET;
    startEdgeDet <= 1'b0;
  end
  else begin
    if (sclDeb == 1'b1 && sdaDelayed[`SDA_DEL_LEN-2] == 1'b0 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b1)
      startEdgeDet <= 1'b1;
    else
      startEdgeDet <= 1'b0;
    if (clearStartStopDet == 1'b1)
      startStopDetState <= `NULL_DET;
    else if (sclDeb == 1'b1) begin
      if (sdaDelayed[`SDA_DEL_LEN-2] == 1'b1 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b0) 
        startStopDetState <= `STOP_DET;
      else if (sdaDelayed[`SDA_DEL_LEN-2] == 1'b0 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b1)
        startStopDetState <= `START_DET;
    end
  end
end

serialInterface #(.I2C_ADDRESS(I2C_ADDRESS),
.I2C_ADDR_BYTE_WIDTH(I2C_ADDR_BYTE_WIDTH))
 u_serialInterface (
  .clk  (clk), 
  .rst  (rst | startEdgeDet), 
  .dataIn (readData), 
  .dataOut (writeData), 
  .writeEn (writeEn),
  .readEn   (readEn),
  .regAddr (addr), 
  .scl  (sclDelayed[`SCL_DEL_LEN-1]), 
  .sdaIn (sdaDeb), 
  .sdaOut (sdaOut), 
  .startStopDetState(startStopDetState),
  .CurrState_SISt(CurrState_SISt),
  .clearStartStopDet(clearStartStopDet) 
);
endmodule


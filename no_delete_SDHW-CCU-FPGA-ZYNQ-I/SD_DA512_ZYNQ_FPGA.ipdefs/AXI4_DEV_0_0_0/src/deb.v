module deb(
	input clk,
	input rstn,
	input in,
	input shift,
	output reg out
);
  parameter RST_VAL = 1'b1;
  parameter DEB_LEN = 10;
  parameter DLY_LEN = 2;

  reg [DEB_LEN+DLY_LEN-1:0]pipe;
	
always @(posedge clk) begin
  if (!rstn) begin
    out <= RST_VAL;
    pipe <= {(DEB_LEN+DLY_LEN){RST_VAL}};
  end
  else begin
	if(shift) pipe <= {pipe[DEB_LEN+DLY_LEN-2:0], in};
    
	if (&pipe[DEB_LEN+DLY_LEN-1:DLY_LEN])
      out <= 1'b1;
    else if (!(|pipe[DEB_LEN+DLY_LEN-1:DLY_LEN]))
      out <= 1'b0;
  end 
end
endmodule
module switchPC 
				 (input logic [31:0] address, 
              input logic [31:0] memoryRead,
				  input logic switch,
				  output logic [31:0] Output);
				  
  assign Output = (address == 32'd262148)? {31'd0, switch}:memoryRead;
  
endmodule 

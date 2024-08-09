
module binary_to_bcd(
		input logic[3:0] binary,
      output logic [7:0]  bcd, 
      output logic [6:0] seg
);
		
			
  always_comb 
   case(binary)     
    4'b0000: bcd = 8'b00000000; //0 en BCD
    4'b0001: bcd = 8'b00000001; //1 en BCD
    4'b0010: bcd = 8'b00000010; //2 en BCD
    4'b0011: bcd = 8'b00000011; //3 en BCD
    4'b0100: bcd = 8'b00000100; //4 en BCD  
    4'b0101: bcd = 8'b00000101; //5 en BCD
    4'b0110: bcd = 8'b00000110; //6 en BCD
    4'b0111: bcd = 8'b00000111; //7 en BCD
    4'b1000: bcd = 8'b00001000; //8 en BCD
    4'b1001: bcd = 8'b00001001; //9 en BCD

    default: bcd = 6'b110000;
   endcase
	
 bcdFPGA BCDFPGA_inst(
    .bcd(bcd),
    .seg(seg)
     );

endmodule




module binary_to_bcd(
		input logic[3:0] binary,
      output logic [5:0]  bcd
		//output logic [6:0] seg
);
		
			
  always_comb 
   case(binary)     
    4'b0000: bcd = 6'b000000; //0 en BCD
    4'b0001: bcd = 6'b000001; //1 en BCD
    4'b0010: bcd = 6'b000010; //2 en BCD
    4'b0011: bcd = 6'b000011; //3 en BCD
    4'b0100: bcd = 6'b000100; //4 en BCD  
    4'b0101: bcd = 6'b000101; //5 en BCD
    4'b0110: bcd = 6'b000110; //6 en BCD
    4'b0111: bcd = 6'b000111; //7 en BCD
    4'b1000: bcd = 6'b001000; //8 en BCD
    4'b1001: bcd = 6'b001001; //9 en BCD
    4'b1010: bcd = 6'b010000; //10 en BCD
    4'b1011: bcd = 6'b010001; //11 en BCD
    4'b1100: bcd = 6'b010010; //12 en BCD
    4'b1101: bcd = 6'b010011; //13 en BCD
    4'b1110: bcd = 6'b010100; //14 en BCD
    4'b1111: bcd = 6'b010101; //15 en BCD

    default: bcd = 6'b110000;
   endcase
	
endmodule

	
	
	// Instancia del módulo decoderFPGA y conexión
   //decoderFPGA decoderFPGA_inst(
    //.bcd(bcd),
    //.seg(seg)
     //);


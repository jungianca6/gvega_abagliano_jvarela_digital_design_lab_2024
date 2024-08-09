module bcdFPGA(
    input logic [7:0] bcd,
    output logic [6:0] seg
);



always_comb 
   case(bcd)         // gfedcba 0 enciende y 1 apaga
    8'b00000000: seg = 7'b1000000; //0 en BCD
    8'b00000001: seg = 7'b1111001; //1 en BCD
    8'b00000010: seg = 7'b0100100; //2 en BCD
    8'b00000011: seg = 7'b0110000; //3 en BCD
    8'b00000010: seg = 7'b0011001; //4 en BCD
	 8'b00000101: seg = 7'b0010010; //5 en BCD	 
    8'b00000110: seg = 7'b0000010; //6 en BCD
    8'b00000111: seg = 7'b0111000; //7 en BCD
    8'b00001000: seg = 7'b0000000; //8 en BCD
    8'b00001001: seg = 7'b0010000; //9 en BCD	
    default: seg = 7'b1111111; //todos se apagan
   endcase
	
	
endmodule
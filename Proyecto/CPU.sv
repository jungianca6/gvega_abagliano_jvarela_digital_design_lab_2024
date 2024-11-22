module CPU(input logic clk, reset, enable,
			  output logic [31:0] WriteData, DataAdr, ReadData,
			  output logic MemWrite,
			  output logic [31:0] ins, PC
);

	//logic [31:0] Instr, PC;
	
		
	//instantiate processor and memories
	arm arm(clk,reset,PC,ins,MemWrite,DataAdr,
			  WriteData,ReadData);
	ROM ROM(PC[7:0],clk,ins);
	//dmem dmem(clk,MemWrite,DataAdr,WriteData,ReadData);
	RAM RAM(DataAdr[7:0],clk,WriteData,MemWrite,ReadData);
	
	
	
	

endmodule

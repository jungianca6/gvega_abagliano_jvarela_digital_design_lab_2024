module arm
(
	input logic clk, rst,
	input logic [31:0] address,
	output logic [7:0] q_b

);
			  
	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc, MemWrite;
	logic [1:0] RegSrc, ImmSrc, ALUControl;
	logic [31:0] PC, Instr, ReadData;
	logic [31:0] ALUResult, WriteData;

	controller controlUnit (
		clk, rst, 
		Instr[31:12], 
		ALUFlags,
		RegSrc, RegWrite, 
		ImmSrc, ALUSrc, ALUControl,
		MemWrite, MemtoReg, PCSrc
	);
	
	datapath dpUnit (
		clk, rst,
		RegSrc, RegWrite, ImmSrc,
		ALUSrc, ALUControl,
		MemtoReg, PCSrc,
		ALUFlags, PC, Instr,
		ALUResult, WriteData, ReadData
	);
	
		
	ROM ROM(PC[7:0],clk,Instr);
	//dmem dmem(clk,MemWrite,DataAdr,WriteData,ReadData);
	RAM RAM(ALUResult,address,clk,WriteData,
	8'b0,MemWrite,1'b0,ReadData,q_b);
	

endmodule
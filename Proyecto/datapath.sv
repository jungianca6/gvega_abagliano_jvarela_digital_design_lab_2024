module datapath(

	 input logic clk,rst,
	 input logic [1:0] RegSrc,
	 input logic RegWrite,
	 input logic [1:0] ImmSrc,
	 input logic ALUSrc,
	 input logic [1:0] ALUControl,
	 input logic MemtoReg,
	 input logic PCSrc,
	 input logic [31:0] ReadData,
	 input logic [31:0] Instr,
	 output logic [3:0] ALUFlags,
	 output logic [31:0] PC,
	 output logic [31:0] ALUResult,WriteData
);
	 
	 logic [31:0] PCNext,PCPlus4,PCPlus8;
	 logic [31:0] ExtImm,SrcA,SrcB,Result;
	 logic [3:0] RA1,RA2;
	 
	 //nextPClogic
	 mux2 #(32) pcmux(PCPlus4,Result-32'b1,PCSrc,PCNext);
	 flopr #(32) pcreg(clk,rst,PCNext,PC);
	 adder #(32) pcadd1(PC,32'b100,PCPlus4);
	 adder #(32) pcadd2(PCPlus4,32'b100,PCPlus8);
	 //registerfilelogic
	 
	 mux2 #(4) ra1mux(Instr[19:16],4'b1111,RegSrc[0],RA1);
	 mux2 #(4) ra2mux(Instr[3:0],Instr[15:12],RegSrc[1],RA2);
	 
	 
	 regfile rf(
	 .clk(clk), 
	 .we3(RegWrite), 
	 .ra1(RA1), 
	 .ra2(RA2),
	 .wa3(Instr[15:12]), 
	 .wd3(Result), 
	 .r15(PCPlus8),
	 .rd1(SrcA), 
	 .rd2(WriteData)
	);
	 
	 mux2 #(32)resmux(ALUResult,ReadData,MemtoReg,Result);
 
	 extend ext(
	 .Instr(Instr[23:0]),
	 .ImmSrc(ImmSrc), 
	 .ExtImm(ExtImm)
	);

	 
	 //ALUlogic
	 mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
	 
ALU #(32) alu(
	.a(SrcA),
	.b(SrcB),
	.ALUControl(ALUControl),
	.ALUResult(ALUResult),
	.ALUFlags(ALUFlags)
	);
	
endmodule 
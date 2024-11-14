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

	
	controller controlUnit(
	.clk(clk),
	.rst(rst),
	.Instr(Instr[31:12]),
	.ALUFlags(ALUFlags),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.ImmSrc(ImmSrc),
	.ALUSrc(ALUSrc),
	.ALUControl(ALUControl),
	.MemWrite(MemWrite),
	.MemtoReg(MemtoReg),
	.PCSrc(PCSrc)
	);
	
	datapath dpUnit(
	.clk(clk),
	.rst(rst),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.ImmSrc(ImmSrc),
	.ALUSrc(ALUSrc),
	.ALUControl(ALUControl),
	.MemtoReg(MemtoReg),
	.PCSrc(PCSrc),
	.ALUFlags(ALUFlags),
	.PC(PC),
	.Instr(Instr),
	.ALUResult(ALUResult),
	.WriteData(WriteData),
	.ReadData(ReadData)
	);
	
	ROM ROM(
	.address(PC),
	.clock(clk),
	.q(Instr)
	);
	
	RAM RAM(
	.address_a(ALUResult),
	.address_b(address),
	.clock(clk),
	.data_a(WriteData),
	.data_b(8'b0),
	.wren_a(MemWrite),
	.wren_b(1'b0),
	.q_a(ReadData),
	.q_b(q_b)
	);

endmodule
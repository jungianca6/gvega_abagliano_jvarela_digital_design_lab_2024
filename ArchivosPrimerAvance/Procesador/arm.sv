module arm(
    input logic clk, reset,
    output logic [31:0] PC,
    input logic [31:0] Instr,
    output logic MemWrite,
    output logic [31:0] ALUResult, WriteData,
    input logic [31:0] ReadData
);

    // Internal signals
    logic [3:0] ALUFlags;
    logic RegWrite, ALUSrc, MemtoReg, PCSrc;
    logic [1:0] RegSrc, ImmSrc, ALUControl;

    // Controller instance
    controller c(clk, reset, Instr[31:12], ALUFlags,RegSrc, RegWrite, ImmSrc,ALUSrc, ALUControl,MemWrite, MemtoReg, PCSrc);

    // Datapath instance
    datapath dp(clk, reset,RegSrc, RegWrite, ImmSrc,ALUSrc, ALUControl,MemtoReg, PCSrc,ALUFlags, PC, Instr,ALUResult, WriteData, ReadData);

endmodule

`timescale 1ns/1ps

module CPU_tb();
	logic clk = 0;
	logic reset = 1;
	logic [31:0] WriteData, DataAdr, ReadData;
	logic MemWrite;
	logic [31:0] ins,pc;
	
	CPU CPU_inst(
		.clk(clk), 
		.reset(reset), 
		.WriteData(WriteData), 
		.DataAdr(DataAdr), 
		.ReadData(ReadData), 
		.MemWrite(MemWrite),
		.ins(ins),
		.PC(pc)
	);
	
	
	// Clock generation
	always begin
		clk <= ~clk; 
		#5;
	end
	
	// Continuous display
	always @(negedge clk) begin
		reset = 0;
		$display("----------------------------------------------------");
		$display("WriteData = %d", WriteData);
		$display("DataAdr = %d", DataAdr);
		$display("MemWrite = %d", MemWrite);
		$display("ReadData = %d", ReadData);
		$display("ins = %b", ins);
		$display("pc = %b", pc);
		$display("----------------------------------------------------");
	end
	
	initial begin
		// Terminate simulation after a certain time
		#90 $finish;  // Ajusta el tiempo total según tus necesidades
	end
endmodule

	
	
	
	
	
	
	
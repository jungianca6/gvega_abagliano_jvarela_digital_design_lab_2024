module imem(input logic [31:0] a,
				output logic [31:0] rd);
				
	
	logic [31:0] INST_RAM[127:0];
	initial
		$readmemh("D:/TEC/2Semestre2024/TallerDD/Proyecto/ProyectoPrueba/sfallas_digital_design_lab_2023-main/PruebaProyecto/memfile.dat",INST_RAM);
	
	assign rd = INST_RAM[a[31:2]]; // word aligned
	
endmodule
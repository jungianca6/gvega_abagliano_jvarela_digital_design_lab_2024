module imem(
    input logic [31:0] a,
    output logic [31:0] rd
);

    logic [31:0] RAM [63:0];

    // Load memory contents from file at simulation start
    initial
        $readmemh("D:/TEC/2Semestre2024/TallerDD/Proyecto/Procesador/output_files/AvanceHEX.dat", RAM);

    // Word aligned memory read
    assign rd = RAM[a[31:2]]; 

endmodule

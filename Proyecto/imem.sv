module imem(
    input logic [31:0] a,
    output logic [31:0] rd
);

    // Adjust the depth of the RAM to match the MIF file
    logic [31:0] RAM[221:0];   
	 
	 //en otro lado decia 63. por que 221?

    // Initialize the memory with the contents of the MIF file
    initial
        //$readmemh("memfile.mif", RAM);

    // Perform word-aligned read
    assign rd = RAM[a[31:2]];

endmodule 
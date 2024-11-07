module dmem(
    input logic clk, we,
    input logic [31:0] a, wd,
    output logic [31:0] rd
);

    logic [31:0] RAM [63:0];

    // Word aligned memory read
    assign rd = RAM[a[31:2]]; 

    // Memory write on rising edge of clock
    always_ff @(posedge clk) 
        if (we) RAM[a[31:2]] <= wd;

endmodule

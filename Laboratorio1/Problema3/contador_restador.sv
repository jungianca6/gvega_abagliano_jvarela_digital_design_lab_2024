module contador_restador #(
    parameter N = 6
)(
    input logic clk,
    input logic reset,
    input logic run,
    input logic [N-1:0] a,
    output logic [N-1:0] z
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        z <= a; // Resetea el restador a 'a' cuando el reset es activo
    end else if (run) begin
        if (z != 0) begin // Asegura que el restador no llegue a un valor negativo
            z <= z - 1; // Decrementa el restador en cada flanco de subida del reloj
        end
    end
end

contadorFPGA #(.N(N)) contadorFPGA_inst(
	 .reset(reset),
    .clk(clk),
    .run(run),
    .a(z),
	 .digit0(digit0),
    .digit1(digit1)
);

endmodule



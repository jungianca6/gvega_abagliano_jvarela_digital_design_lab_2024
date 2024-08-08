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

endmodule



/*
Implementación para la FPGA
*/
/*

module counter #(
    parameter N = 6
)(
    input logic reset,
    input logic clk,
    input logic run,
    input reg [N-1:0] a,
	 output logic[N-1:0] z,
    output reg [6:0] digit0,
    output reg [6:0] digit1
);
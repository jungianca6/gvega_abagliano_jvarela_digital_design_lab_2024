module contador_restador #(
    parameter N = 6
)(
    input logic clk,
    input logic reset,
    input logic run,
    input logic [N-1:0] a,
    output logic [N-1:0] z,
	 output reg [6:0] digit0,
    output reg [6:0] digit1
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


	 reg[31:0] counter = 0;
	 //reg [N-1:0] z;
	 
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            z <= a; // Resetea el contador a 'a' cuando el reset es activo
				counter <= 0;
				
        end else begin
            if (!run && (z != 0)) begin // Asegura que el contador no llegue a un valor negativo
					if(counter == 15_000_000) begin
						z <= z - 1; // Decrementa el contador en cada flanco de bajada del reloj
						counter <= 0;
					end else begin
						counter <= counter +1;
					end
					 
            end
        end
    end

    always @* begin
        case(z[3:0])
            4'b0000: digit0 = 7'b1000000; // 0
            4'b0001: digit0 = 7'b1111001; // 1
            4'b0010: digit0 = 7'b0100100; // 2
            4'b0011: digit0 = 7'b0110000; // 3
            4'b0100: digit0 = 7'b0011001; // 4
            4'b0101: digit0 = 7'b0010010; // 5
            4'b0110: digit0 = 7'b0000010; // 6
            4'b0111: digit0 = 7'b1111000; // 7
            4'b1000: digit0 = 7'b0000000; // 8
            4'b1001: digit0 = 7'b0010000; // 9
            4'b1010: digit0 = 7'b0001000; // A
            4'b1011: digit0 = 7'b0000011; // b
            4'b1100: digit0 = 7'b1000110; // C
            4'b1101: digit0 = 7'b0100001; // d
            4'b1110: digit0 = 7'b0000110; // E
            4'b1111: digit0 = 7'b0001110; // F
            default: digit0 = 7'b1111111; // Si la entrada no es válida, todos los segmentos se apagan
        endcase

        case(z[5:4])
            2'b00: digit1 = 7'b1000000; // 0
            2'b01: digit1 = 7'b1111001; // 1
            2'b10: digit1 = 7'b0100100; // 2
            2'b11: digit1 = 7'b0110000; // 3
            default: digit1 = 7'b1111111; // Si la entrada no es válida, todos los segmentos se apagan
        endcase
    end

endmodule

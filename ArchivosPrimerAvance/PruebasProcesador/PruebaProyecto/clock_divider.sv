module clock_divider(
    input logic clk_in,       // Reloj de entrada (50 MHz)
    input logic reset,        // Reset
    output logic clk_out      // Reloj de salida (lento)
);
    parameter DIV_FACTOR = 25_000_000; // Dividir 50 MHz para obtener 1 Hz
    logic [31:0] counter;

    always_ff @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == DIV_FACTOR - 1) begin
                clk_out <= ~clk_out; // Cambia el estado del reloj de salida
                counter <= 0;        // Reinicia el contador
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

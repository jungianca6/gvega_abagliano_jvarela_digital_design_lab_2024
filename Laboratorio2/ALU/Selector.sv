module selector #(parameter MAX_VALUE = 9)(
    input wire clk,                  // Reloj
    input wire reset,                // Reset global
    input wire btn_increment,        // Botón para incrementar la variable

    output logic [3:0] variable      // Variable de 4 bits
);

    reg [3:0] contador;              // Contador interno para rastrear la variable

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // Resetear el contador y la variable a cero
            contador <= 4'b0;
            variable <= 4'b0;
        end else begin
            if (btn_increment) begin
                // Incrementar la variable cuando se presiona el botón
                if (contador < MAX_VALUE) begin
                    contador <= contador + 1; // Incrementar el contador
                end else begin
                    contador <= 4'b0;        // Reiniciar el contador si alcanza el valor máximo
                    variable <= variable + 1; // Incrementar la variable
                end
            end
        end
    end

endmodule

module counter(
    input logic clk,       // Entrada de reloj: controla el incremento del contador
    input logic reset,     // Entrada de reinicio: fuerza el contador a 0
    output int q           // Salida del contador: un número entero que representa el conteo actual
);

    // Bloque secuencial activado en el flanco positivo del reloj
    always_ff @(posedge clk)
        if (reset) begin 
            q <= 0;          // Si reset está activo, reinicia el contador a 0
        end
        else begin 
            q <= q + 1;      // Si reset no está activo, incrementa el contador en 1
        end

endmodule

module CountdownTimer (
    input logic clk,
    input logic Reset,
    input logic playerMoved,         // Señal que indica que un jugador ha realizado un movimiento
    output logic [3:0] count,        // Contador de 4 bits para la cuenta regresiva
    output logic timeout             // Señal que indica que el temporizador ha expirado
);
    logic [3:0] next_count;
    logic ticking;                   // Estado del temporizador

    always_ff @(posedge clk or posedge Reset) begin
        if (Reset) begin
            count <= 15;            // Inicializa el contador a 15 (15 segundos)
            timeout <= 0;
            ticking <= 1;           // Inicia el temporizador
        end else if (ticking) begin
            count <= next_count;
            if (next_count == 0) begin
                timeout <= 1;       // Indica que el temporizador ha expirado
                ticking <= 0;       // Detener el temporizador
            end else begin
                timeout <= 0;       // Reiniciar la señal de tiempo
            end
        end
    end

    always_comb begin
        next_count = count;
        if (ticking) begin
            next_count = count - 1; // Decrementar el contador
        end
    end

    // Reinicia el temporizador cuando un jugador realiza un movimiento
    always_ff @(posedge playerMoved) begin
        if (ticking) begin
            count <= 15;            // Reinicia el contador a 15 cuando un jugador mueve
        end
    end
endmodule

module VictoryConditions(
    input logic [17:0] Cells, // Representación del tablero (18 bits)
    output logic X_wins,
    output logic O_wins,
    output logic draw
);

    // Combinaciones ganadoras
    logic [17:0] WINNING_COMBINATIONS[0:7];

    initial begin
        // Definición de combinaciones ganadoras
        WINNING_COMBINATIONS[0] = 18'b000000000000000011; // Fila 1
        WINNING_COMBINATIONS[1] = 18'b000000000000110000; // Fila 2
        WINNING_COMBINATIONS[2] = 18'b000000000011000000; // Fila 3
        WINNING_COMBINATIONS[3] = 18'b000000110000000000; // Columna 1
        WINNING_COMBINATIONS[4] = 18'b000110000000000000; // Columna 2
        WINNING_COMBINATIONS[5] = 18'b011000000000000000; // Columna 3
        WINNING_COMBINATIONS[6] = 18'b001001000000000000; // Diagonal \
        WINNING_COMBINATIONS[7] = 18'b000100100000000000; // Diagonal /
    end

    always_comb begin
        X_wins = 0;
        O_wins = 0;
        draw = 0;

        // Verificar combinaciones ganadoras
        for (int i = 0; i < 8; i++) begin
            if ((Cells & WINNING_COMBINATIONS[i]) == WINNING_COMBINATIONS[i]) begin
                // Suponiendo que 'X' ocupa las primeras celdas
                if (i < 4) 
                    X_wins = 1; // Fila o columna ganadora para 'X'
                else 
                    O_wins = 1; // Diagonales para 'O'
            end
        end

        // Verificar condiciones de empate
        if (!X_wins && !O_wins) begin
            // Comprobar si todas las celdas están ocupadas (sin espacios vacíos)
            if (Cells == 18'b111111111111111111) // Todas las celdas ocupadas
                draw = 1; // Declara empate
        end
    end
endmodule


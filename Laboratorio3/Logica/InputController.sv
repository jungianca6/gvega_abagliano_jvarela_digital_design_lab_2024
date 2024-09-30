module InputController (
    input logic clk,
    input logic Reset,
    input logic [8:0] switches,      // 9 switches para las 9 celdas
    input logic playerMove,           // Señal para indicar un movimiento del jugador
    output logic [17:0] Cells         // Tablero actualizado (18 bits)
);
    logic [8:0] currentCells; // Almacena las celdas actuales para comprobación

    always_ff @(posedge clk or posedge Reset) begin
        if (Reset) begin
            Cells <= 0; // Reiniciar el tablero
            currentCells <= 0; // Reiniciar las celdas actuales
        end
        else if (playerMove) begin
            for (int i = 0; i < 9; i++) begin
                if (switches[i] && !currentCells[i]) begin // Solo actualizar si la celda está vacía
                    Cells[i] <= 1; // Establecer la celda correspondiente a 1
                    currentCells[i] <= 1; // Marcar que esta celda ahora está ocupada
                end
            end
        end
    end
endmodule

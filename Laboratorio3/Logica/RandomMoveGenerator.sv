module RandomMoveGenerator (
    input logic clk,
    input logic Reset,
    input logic timeout,             // Señal que indica que el temporizador ha expirado
    input logic [17:0] Cells,        // Estado actual de las celdas
    output logic [3:0] move          // Movimiento aleatorio (4 bits para 16 posibles movimientos)
);
    always_ff @(posedge clk or posedge Reset) begin
        if (Reset) begin
            move <= 4'b0000;        // Inicializa el movimiento
        end else if (timeout) begin
            // Lógica para seleccionar un movimiento aleatorio
            // Asegurarse de que la celda esté vacía antes de elegir
            logic [3:0] temp_move = $urandom_range(0, 8); // Generar un número aleatorio entre 0 y 8
            if (Cells[temp_move] == 0) begin
                move <= temp_move;   // Asignar el movimiento aleatorio
            end else begin
                move <= move;        // Si la celda no está vacía, mantener el movimiento
            end
        end
    end
endmodule

`timescale 1ns / 1ps

module FSM_TicTacToe_Tb;

    // Señales de prueba
    logic Reset;
    logic clk;
    logic [17:0] Cells; // Celdas del juego
    logic winState;
    logic drawState;
    logic [8:0] Color;

    // Instanciar el módulo FSM_TicTacToe
    FSM_TicTacToe uut (
        .Reset(Reset),
        .clk(clk),
        .Cells(Cells),
        .winState(winState),
        .drawState(drawState),
        .Color(Color)
    );

    // Generación de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generar un reloj de 100 MHz
    end

    // Secuencia de prueba
    initial begin
        // Inicializar señales
        Reset = 1; // Iniciar en estado de reset
        Cells = 18'b000000000000000000; // Inicializar las celdas vacías
        #10; // Esperar 10 ns
        Reset = 0; // Desactivar el reset
        
        // Test 1: X gana horizontalmente (celdas 0, 1, 2)
        Cells = 18'b000000000000000011; // Las primeras tres celdas ocupadas por X
        #10; // Esperar un ciclo de reloj
        
        // Verificar el resultado
        #1; // Un pequeño delay para asegurar la lectura del resultado
        if (winState !== 1'b1) begin
            $display("Error: X debería haber ganado.");
        end else begin
            $display("Test 1: X ganó correctamente.");
        end
        
        // Test 2: O gana verticalmente (celdas 0, 3, 6)
        Cells = 18'b000000000000001100; // Las celdas ocupadas por O
        #10; // Esperar un ciclo de reloj

        // Verificar el resultado
        #1; // Un pequeño delay para asegurar la lectura del resultado
        if (winState !== 1'b1) begin
            $display("Error: O debería haber ganado.");
        end else begin
            $display("Test 2: O ganó correctamente.");
        end

        // Test 3: Empate (todas las celdas ocupadas sin ganador)
        Cells = 18'b111111111111111111; // Todas las celdas ocupadas
        #10; // Esperar un ciclo de reloj
        
        // Verificar el resultado
        #1; // Un pequeño delay para asegurar la lectura del resultado
        if (drawState !== 1'b1) begin
            $display("Error: Debería haber empate.");
        end else begin
            $display("Test 3: Empate detectado correctamente.");
        end

        // Finalizar la simulación
        $stop;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time: %0t | Reset: %b | Cells: %b | winState: %b | drawState: %b | Color: %b", 
                  $time, Reset, Cells, winState, drawState, Color);
    end

endmodule


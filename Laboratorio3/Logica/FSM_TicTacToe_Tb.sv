`timescale 1ns / 1ps

module gameState_tb;

    // Señales de prueba
    logic Reset;
    logic clk;
    logic [17:0] Cells; // Celdas del juego
    logic winState;
    logic [8:0] Color;

    // Instanciar el módulo gameState
    gameState uut (
        .Reset(Reset),
        .clk(clk),
        .Cells(Cells),
        .winState(winState),
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
        if (winState !== 1'b1) begin
            $display("Error: X debería haber ganado.");
        end
        
        // Test 2: O gana verticalmente (celdas 0, 3, 6)
        Cells = 18'b000000000000001100; // Las celdas ocupadas por O
        #10; // Esperar un ciclo de reloj

        // Verificar el resultado
        if (winState !== 1'b1) begin
            $display("Error: O debería haber ganado.");
        end

        // Test 3: X gana diagonalmente (celdas 0, 4, 8)
        Cells = 18'b000000000000010100; // Las celdas ocupadas por X
        #10; // Esperar un ciclo de reloj
        
        // Verificar el resultado
        if (winState !== 1'b1) begin
            $display("Error: X debería haber ganado.");
        end

        // Test 4: No hay ganador
        Cells = 18'b000000000000000000; // Inicializar nuevamente
        #10; // Esperar un ciclo de reloj
        Cells = 18'b000000000000000000; // Sin ganadores
        #10; // Esperar un ciclo de reloj

        // Verificar que winState sigue siendo 0
        if (winState !== 1'b0) begin
            $display("Error: No debería haber ganador.");
        end

        // Finalizar la simulación
        $stop;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time: %0t | Reset: %b | Cells: %b | winState: %b | Color: %b", 
                  $time, Reset, Cells, winState, Color);
    end

endmodule

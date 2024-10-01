module tb_fsm();

    // Señales del DUT (Design Under Test)
    logic clk;
    logic rst;
    logic select;
    logic orden;
    logic cant_player;
    logic end_attack_p1;
    logic end_attack_p2;
    logic timeout;
    logic [1:0] winner;
    logic [1:0] current_player;
    logic [3:0] temp_state;
    logic en_attack_p1;
    logic en_attack_p2;
    logic en_attack_random;
    logic en_check;

    // Instancia del DUT
    fsm uut (
        .clk(clk),
        .rst(rst),
        .select(select),
        .orden(orden),
        .cant_player(cant_player),
        .end_attack_p1(end_attack_p1),
        .end_attack_p2(end_attack_p2),
        .timeout(timeout),
        .winner(winner),
        .current_player(current_player),
        .temp_state(temp_state),
        .en_attack_p1(en_attack_p1),
        .en_attack_p2(en_attack_p2),
        .en_attack_random(en_attack_random),
        .en_check(en_check)
    );

    // Generación del reloj
    always #5 clk = ~clk;  // Periodo de reloj de 10 unidades de tiempo

    // Estímulos de prueba
    initial begin
        // Inicialización de señales
        clk = 0;
        rst = 0;
        select = 0;
        orden = 0;
        cant_player = 0;
        end_attack_p1 = 0;
        end_attack_p2 = 0;
        timeout = 0;
        winner = 2'b00;
        current_player = 2'b00;

        // Reset del sistema
        rst = 1;
        #10;
        rst = 0;

        // Caso 1: Transición inicial, se selecciona el juego
        select = 1;
        #10;
        select = 0;

        // Caso 2: Selección de orden de juego
        #20;
        select = 1;
        orden = 1; // Juega jugador 1
        #10;
        select = 0;

        // Caso 3: Ataque del jugador 1 y transición a chequeo de estado
        #20;
        end_attack_p1 = 1;  // Jugador 1 termina su ataque
        #10;
        end_attack_p1 = 0;

        // Caso 4: Ataque del jugador 2
        #20;
        current_player = 2'b10; // Es turno del jugador 2
        cant_player = 1; // Hay dos jugadores
        end_attack_p2 = 1;
        #10;
        end_attack_p2 = 0;

        // Caso 5: Chequeo de timeout y activación de ataque aleatorio
        #30;
        timeout = 1; // Se activa el timeout
        #10;
        timeout = 0;

        // Caso 6: Gana el jugador 1
        #40;
        winner = 2'b01; // Jugador 1 gana
        #10;

        // Caso 7: Reseteo del sistema
        rst = 1;
        #10;
        rst = 0;

        // Termina la simulación
        #50;
        $finish;
    end

    // Monitoreo de las señales
    initial begin
        $monitor("Time=%0t | state=%b | en_attack_p1=%b | en_attack_p2=%b | en_attack_random=%b | en_check=%b | winner=%b | current_player=%b",
                 $time, temp_state, en_attack_p1, en_attack_p2, en_attack_random, en_check, winner, current_player);
    end
endmodule

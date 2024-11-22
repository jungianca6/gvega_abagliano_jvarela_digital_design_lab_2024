`timescale 1 ns / 1 ns

module arm_tb_fpga();
    logic clk = 0;
    logic reset;
    logic [31:0] WriteData, DataAdrA, DataAdrB;
    logic MemWriteEnable;

    logic [31:0] PC = 32'd_0;
    logic [31:0] Instr, ReadDataA, ReadDataB;

    // Señales para los LEDs
    logic [7:0] LED; // LEDs principales (7:0)
    logic LED_Write; // LED 8

    // Instancia del procesador ARM
    arm arm(
        clk,          // Señal de reloj
        reset,        // Señal de reset
        PC,           // Contador de programa
        Instr,        // Instrucción actual
        MemWriteEnable, // Habilitación de escritura en memoria
        DataAdrA,     // Dirección de memoria A
        WriteData,    // Datos a escribir
        ReadDataA     // Datos leídos de la memoria
    );

    // Instancia de la memoria de datos
    dmem dmem(
        clk,          // Señal de reloj
        DataAdrA,     // Dirección de memoria A
        DataAdrB,     // Dirección de memoria B
        WriteData,    // Datos a escribir
        MemWriteEnable, // Habilitación de escritura
        ReadDataA,    // Datos leídos de la memoria A
        ReadDataB     // Datos leídos de la memoria B
    );

    // Generación del reloj
    always #5 clk = ~clk;

    // Mapeo de las señales a los LEDs
    always_comb begin
        LED = PC[7:0];          // LEDs muestran los 8 bits menos significativos de PC
        LED_Write = MemWriteEnable; // LED 8 indica escritura activa
    end

    // Carga de instrucciones
    logic [31:0] instruction_memory [0:127];
    integer i;

    initial begin
        // Inicialización del reset
        reset = 1;
        #22;
        reset = 0;

        // Carga de instrucciones desde el archivo
        $readmemh("memfile.dat", instruction_memory);

        // Monitor para verificar las señales
        $monitor("Tiempo: %0t | PC: 0x%h | LED[7:0]: %b | LED_Write: %b",
                 $time, PC, LED, LED_Write);

        // Ejecución de las instrucciones
        for (i = 0; i < 128; i = i + 1) begin
            Instr = instruction_memory[i];
            @(posedge clk); // Espera al siguiente ciclo de reloj
        end

        // Finalización de la simulación
        $display("Demostración del procesador ARM completa.");
        $stop; // Termina la simulación
    end
endmodule

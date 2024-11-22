module arm_demo(
    input logic clk_50Mhz,    // Reloj rápido de entrada
    input logic reset,        // Reset manual
    output logic [7:0] LED,   // LEDs para el PC
    output logic LED_Write    // LED para MemWriteEnable
);
    // Señales internas
    logic clk_slow;           // Reloj lento
    logic [31:0] PC;          // Contador de programa
    logic [31:0] Instr;       // Instrucción actual
    logic MemWriteEnable;     // Señal de escritura en memoria
    logic [31:0] WriteData;   // Datos escritos en memoria
    logic [31:0] DataAdrA;    // Dirección de memoria A

    // Instancia del divisor de frecuencia
    clock_divider #(.DIV_FACTOR(25_000_000)) slow_clk_gen(
        .clk_in(clk_50Mhz),
        .reset(reset),
        .clk_out(clk_slow)
    );

    // Instancia del procesador ARM
    arm arm_inst(
        clk_slow,     // Usa el reloj lento
        reset,        // Reset
        PC,           // Contador de programa
        Instr,        // Instrucción
        MemWriteEnable, // Habilitación de escritura
        DataAdrA,     // Dirección de memoria A
        WriteData     // Datos escritos
    );

    // Mapeo de LEDs
    always_comb begin
        LED = PC[7:0];            // LEDs muestran los 8 bits menos significativos del PC
        LED_Write = MemWriteEnable; // LED indica escritura activa
    end
endmodule

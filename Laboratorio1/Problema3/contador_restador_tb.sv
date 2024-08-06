module contador_restador_tb #(
    parameter N = 6 // Tamaño del contador por defecto
);

    // Puertos del testbench
    logic clk;
    logic reset;
    logic run;
    logic [N-1:0] a;
    logic [N-1:0] z;
	 
	 
    // Instancia del contador
    contador_restador #(.N(N)) dut (
        .clk(clk),
        .reset(reset),
        .run(run),
        .a(a),
        .z(z)
    );

    // Generación de clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Genera un pulso de reloj cada 5 unidades de tiempo
    end

    // Inicia la secuencia de prueba
    initial begin
        $monitor("Time: %0t | reset: %b | run: %b | a: %d | z: %d", $time, reset, run, a, z);
        
        // Prueba para 2 bits
        $display("TestBench para 2 bits");
        a = 2'b11;
        reset = 1;
        run = 0;
        #10 reset = 0;
        #10 run = 1;
        #50 run = 0;
        
        // Prueba para 4 bits
        $display("TestBench para 4 bits");
        a = 4'b1111;
        reset = 1;
        run = 0;
        #10 reset = 0;
        #10 run = 1;
        #100 run = 0;

        // Prueba para 6 bits
        $display("TestBench para 6 bits");
        a = 6'b111111;
        reset = 1;
        run = 0;
        #10 reset = 0;
        #10 run = 1;
        #200 run = 0;

        #10 $finish; // Termina la simulación
    end
endmodule
module testbench;

    logic clk;
    logic reset;
    logic [31:0] WriteData, DataAdr;
    logic MemWrite;

    // Instantiate device to be tested
    top dut (clk, reset, WriteData, DataAdr, MemWrite);

    // Initialize test
    initial begin
        reset <= 1;
        #22;
        reset <= 0;
    end

    // Generate clock to sequence tests
    always begin
        clk <= 1;
        #5;
        clk <= 0;
        #5;
    end
    
    // Add a display for the loaded memory contents (readmemh debug)
    initial begin
        // Verifica si el archivo .dat se carga correctamente en la memoria
        $readmemh("AvanceHEX.dat", dut.imem.RAM);  // Asumiendo que la memoria está en imem
        $display("Archivo AvanceHEX.dat cargado en memoria.");
    end

    // Monitorear la señal Instr para ver qué está leyendo del archivo .dat
    always @(posedge clk) begin
        $display("PC = %h, Instr = %h", dut.PC, dut.Instr);
    end


endmodule

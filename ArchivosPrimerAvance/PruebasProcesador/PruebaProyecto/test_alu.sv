`timescale 1 ns / 1 ns
module test_alu;

  // Parámetros y señales
  parameter N = 32;
  logic [N-1:0] a, b;          // Operandos de la ALU
  logic [2:0] ALUControl;      // Control de la ALU
  logic [4:0] Shamt;           // Shift amount
  logic [1:0] ShiftType;       // Tipo de Shift
  logic [N-1:0] Result;        // Resultado de la ALU
  logic [3:0] ALUFlags;        // Flags de la ALU

  // Instancia de la ALU
  alu #(N) alu_inst (
    a, 
    b, 
    ALUControl, 
    Shamt, 
    ShiftType, 
    Result, 
    ALUFlags
  );

  // Test vector
  initial begin
    // Test de MUL
    $display("Test de multiplicación (MUL)");
    a = 32'd15;     // Primer operando
    b = 32'd3;      // Segundo operando
    ALUControl = 3'b101;  // Operación MUL
    #10;  // Espera de 10 unidades de tiempo
    $display("Resultado de MUL: %d", Result);
    if (Result !== 32'd45) begin
      $display("ERROR: Resultado esperado 45, pero se obtuvo %d", Result);
    end else begin
      $display("MUL correcto.");
    end
    
    // Test de MOV
    $display("\nTest de MOV");
    a = 32'd100;     // Primer operando
    b = 32'd0;       // Segundo operando (no usado en MOV)
    ALUControl = 3'b110;  // Operación MOV
    #10;  // Espera de 10 unidades de tiempo
    $display("Resultado de MOV: %d", Result);
    if (Result !== 32'd100) begin
      $display("ERROR: Resultado esperado 100, pero se obtuvo %d", Result);
    end else begin
      $display("MOV correcto.");
    end
    
    $finish;  // Termina la simulación
  end

endmodule

module extend(
    input logic [23:0] Instr,               // Parte relevante de la instrucción (24 bits) para decodificar el inmediato
    input logic [1:0] ImmSrc,               // Control para seleccionar el tipo de inmediato a generar
    output logic [31:0] ExtImm              // Salida: Inmediato extendido a 32 bits
);
				  
  // Bloque combinacional para generar el inmediato extendido
  always_comb
    case (ImmSrc)
        // Caso 1: Inmediato sin signo de 8 bits
        2'b00: ExtImm = {24'b0, Instr[7:0]}; 
        // Extensión: Los 8 bits menos significativos de `Instr` son concatenados con 24 ceros en los bits más altos.
        // Ejemplo: Si Instr[7:0] = 8'b10101010, ExtImm será 32'b00000000_00000000_00000000_10101010.

        // Caso 2: Inmediato sin signo de 12 bits
        2'b01: ExtImm = {20'b0, Instr[11:0]}; 
        // Extensión: Los 12 bits menos significativos de `Instr` se concatenan con 20 ceros en los bits más altos.
        // Ejemplo: Si Instr[11:0] = 12'b111100001111, ExtImm será 32'b00000000_00000000_11110000_1111.

        // Caso 3: Desplazamiento para instrucciones de salto (24 bits, complemento a dos)
        2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00}; 
        // Extensión: 
        // - Se toman los 24 bits más significativos de `Instr`.
        // - Los 6 bits más altos de `ExtImm` se llenan con el bit de signo (Instr[23]) para extender en complemento a dos.
        // - Los 2 bits menos significativos de `ExtImm` son ceros (desplazamiento lógico a la izquierda por 2).
        // Ejemplo: Si Instr = 24'b10000000_00000000_00000000 (número negativo en complemento a dos), 
        // ExtImm será 32'b11111110_00000000_00000000_00000000.

        // Caso predeterminado: Inmediato indefinido
        default: ExtImm = 32'bx; 
        // Si ImmSrc no coincide con ningún caso, el inmediato es indefinido (generalmente para evitar comportamiento no esperado).
    endcase
endmodule

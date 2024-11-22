module alu #(parameter WIDTH = 8) (
    input logic [WIDTH-1:0] a, b, // Operandos
    input logic [1:0] control,    // Control de operación
    output logic [WIDTH-1:0] y,   // Resultado
    output logic zero,            // Bandera de cero
    output logic carry_out,       // Bandera de acarreo
    output logic negative,        // Bandera negativa
    output logic overflow         // Bandera de desbordamiento
);
    always_comb begin
        case (control)
            2'b00: y = a + b;                // ADD
            2'b01: y = a - b;                // SUB
            2'b10: y = a & b;                // AND
            2'b11: y = a | b;                // OR
            default: y = 0;
        endcase

        // Definir banderas
        zero = (y == 0);
        carry_out = (control == 2'b00) && (a + b < a); // Caso de acarreo
        negative = (y[WIDTH-1] == 1);  // Si el bit más significativo es 1, es negativo
        overflow = (control == 2'b00 && (a[WIDTH-1] == b[WIDTH-1]) && (y[WIDTH-1] != a[WIDTH-1])); // Overflow para suma
    end
endmodule

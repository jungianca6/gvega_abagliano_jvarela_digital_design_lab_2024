module ALU #(parameter n = 4)(
    input logic [n-1:0] a, b,      // Operandos de entrada
    input logic [3:0] Operator,    // Código de la operación a realizar
    output logic [2*n-1:0] Result, // Resultado de la operación
    output logic [6:0] display1,
    output logic [6:0] display2,
    output logic [6:0] display3,
    output logic N, Z, C, V        // Banderas de estado
);

    // Variables internas
    logic [2*n-1:0] extended_result = {2*n{1'b0}}; // Inicialización del resultado extendido a "0"
    wire [n-1:0] adder_result, subtractor_result, multiplier_result;
    wire adder_cout, subtractor_cout;
    wire [n-1:0] multiplier_Overf;

    // Códigos de operación
    localparam ADD = 4'b0000, SUB = 4'b0001, MUL = 4'b0010, DIV = 4'b0011, 
               MOD = 4'b0100, AND = 4'b0101, OR  = 4'b0110, XOR = 4'b0111, 
               SHL = 4'b1000, SHR = 4'b1001;

    // Instancia del sumador de n bits
    full_adder_nb #(n) adder_inst (
        .a(a), 
        .b(b), 
        .Cin(1'b0),  // Acarreo de entrada asumido como cero
        .Sum(adder_result), 
        .Cout(adder_cout)
    );

    // Instancia del restador de n bits
    full_subtractor_nb #(n) subtractor_inst (
        .a(a), 
        .b(b), 
        .Cin(1'b0),  // Acarreo de entrada asumido como cero
        .Result(subtractor_result), 
        .Cout(subtractor_cout)
    );

    // Instancia del multiplicador de n bits
    multiplier_nb #(n) multiplier_inst (
        .a(a), 
        .b(b), 
        .Overf(multiplier_Overf), 
        .Result(multiplier_result)
    );

    // Instancia del decodificador
    Decoder decoder_inst (
        .bin1(Result[7:4]), 
        .bin2(Result[3:0]), 
        .bin3(Operator), 
        .hex_result1(display1), 
        .hex_result2(display2), 
        .hex_result3(display3)
    );

    // Lógica combinacional para la ALU
    always_comb begin
        {N, Z, C, V} = 4'b0000; // Inicialización de las banderas

        case(Operator)
            ADD: begin
                Result = adder_result; // Realizar suma
                C = adder_cout;
                V = (a[n-1] ^ adder_result[n-1]) & (a[n-1] ~^ b[n-1]);
            end
            SUB: begin
                Result = subtractor_result; // Realizar resta
                C = subtractor_cout;
                V = (a[n-1] ^ subtractor_result[n-1]) & (a[n-1] ^ b[n-1]);
            end
            MUL: Result = {multiplier_Overf, multiplier_result}; // Realizar multiplicación
            DIV: Result = a / b;  // Realizar división
            MOD: Result = a % b;  // Calcular módulo
            AND: Result = a & b;  // Operación AND
            OR:  Result = a | b;  // Operación OR
            XOR: Result = a ^ b;  // Operación XOR
            SHL: Result = a << b; // Desplazamiento a la izquierda
            SHR: Result = a >> b; // Desplazamiento a la derecha
            default: Result = {n{1'b0}}; // Operación por defecto
        endcase

        // Actualización de banderas
        N = Result[n-1];
        Z = (Result == {n{1'b0}});
    end

endmodule

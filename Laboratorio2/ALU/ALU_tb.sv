module ALU_tb();

    parameter n = 4; // Número de bits

    // Declaración de señales
    reg [n-1:0] a, b;
    reg [3:0] Operator;
    wire [2*n-1:0] Result;
    wire N, Z, C, V;

    // Instanciar la ALU
    ALU #(n) uut (
        .a(a),
        .b(b),
        .Operator(Operator),
        .Result(Result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );

    initial begin
        // Inicializar entradas
        a = 0; b = 0; Operator = 0;

        // Esperar un breve momento antes de comenzar las pruebas
        #10;

        // --------------------------- OPERACIÓN: ADD ---------------------------
        // Ejemplo 1 de suma
        a = 4'b1000;
        b = 4'b0001;
        Operator = 4'b0000;
        #10;
        $display("ADD Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("ADD Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1000 + 4'b0001), 1'b1, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de suma
        a = 4'b1001;
        b = 4'b1010;
        Operator = 4'b0000;
        #10;
        $display("ADD Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("ADD Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1001 + 4'b1010), 1'b0, 1'b0, 1'b1, 1'b1);

        // --------------------------- OPERACIÓN: SUB ---------------------------
        // Ejemplo 1 de resta
        a = 4'b1111;
        b = 4'b1111;
        Operator = 4'b0001;
        #10;
        $display("SUB Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("SUB Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 - 8'b1111), 1'b0, 1'b1, 1'b0, 1'b0);

        // Ejemplo 2 de resta
        a = 4'b1101;
        b = 4'b1001;
        Operator = 4'b0001;
        #10;
        $display("SUB Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("SUB Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1101 - 8'b1001), 1'b0, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: MUL ---------------------------
        // Ejemplo 1 de multiplicación
        a = 4'b1111;
        b = 4'b1111;
        Operator = 4'b0010;
        #10;
        $display("MUL Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("MUL Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 * 8'b1111), 1'b0, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de multiplicación
        a = 4'b1101;
        b = 4'b0000;
        Operator = 4'b0010;
        #10;
        $display("MUL Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("MUL Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1101 * 8'b0000), 1'b0, 1'b1, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: DIV ---------------------------
        // Ejemplo 1 de división
        a = 4'b1110;
        b = 4'b1000;
        Operator = 4'b0011;
        #10;
        $display("DIV Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("DIV Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1110 / 8'b1000), 1'b0, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de división
        a = 4'b1101;
        b = 4'b0010;
        Operator = 4'b0011;
        #10;
        $display("DIV Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("DIV Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1101 / 8'b0010), 1'b0, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: MOD ---------------------------
        // Ejemplo 1 de módulo
        a = 4'b1110;
        b = 4'b0010;
        Operator = 4'b0100;
        #10;
        $display("MOD Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("MOD Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1110 % 4'b0010), 1'b0, 1'b1, 1'b0, 1'b0);

        // Ejemplo 2 de módulo
        a = 4'b1001;
        b = 4'b0110;
        Operator = 4'b0100;
        #10;
        $display("MOD Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("MOD Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1001 % 8'b0110), 1'b0, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: AND ---------------------------
        // Ejemplo 1 de AND
        a = 4'b1100;
        b = 4'b1010;
        Operator = 4'b0101;
        #10;
        $display("AND Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("AND Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1100 & 8'b1010), 1'b1, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de AND
        a = 4'b1111;
        b = 4'b0000;
        Operator = 4'b0101;
        #10;
        $display("AND Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("AND Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 & 8'b0000), 1'b0, 1'b1, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: OR ---------------------------
        // Ejemplo 1 de OR
        a = 4'b1100;
        b = 4'b1010;
        Operator = 4'b0110;
        #10;
        $display("OR Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("OR Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1100 | 4'b1010), 1'b1, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de OR
        a = 4'b1111;
        b = 4'b0000;
        Operator = 4'b0110;
        #10;
        $display("OR Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("OR Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1111 | 4'b0000), 1'b1, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: XOR ---------------------------
        // Ejemplo 1 de XOR
        a = 4'b1100;
        b = 4'b1010;
        Operator = 4'b0111;
        #10;
        $display("XOR Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("XOR Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1100 ^ 4'b1010), 1'b0, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de XOR
        a = 4'b1111;
        b = 4'b0000;
        Operator = 4'b0111;
        #10;
        $display("XOR Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("XOR Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1111 ^ 4'b0000), 1'b1, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: Shift left ---------------------------
        // Ejemplo 1 de desplazamiento a la izquierda
        a = 4'b0010;
        b = 4'b0011;
        Operator = 4'b1000;
        #10;
        $display("Shift left Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("Shift left Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b0010 << 8'b0011), 1'b0, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de desplazamiento a la izquierda
        a = 4'b1111;
        b = 4'b0111;
        Operator = 4'b1000;
        #10;
        $display("Shift left Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("Shift left Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 << 8'b0111), 1'b0, 1'b0, 1'b0, 1'b0);

        // --------------------------- OPERACIÓN: Shift right ---------------------------
        // Ejemplo 1 de desplazamiento a la derecha
        a = 4'b0100;
        b = 4'b0010;
        Operator = 4'b1001;
        #10;
        $display("Shift right Example 1 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("Shift right Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b0100 >> 8'b0010), 1'b0, 1'b0, 1'b0, 1'b0);

        // Ejemplo 2 de desplazamiento a la derecha
        a = 4'b1111;
        b = 4'b0011;
        Operator = 4'b1001;
        #10;
        $display("Shift right Example 2 ---> Result: %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
        $display("Shift right Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 >> 8'b0011), 1'b0, 1'b0, 1'b0, 1'b0);

        // Terminar la simulación
        $finish;
    end

endmodule


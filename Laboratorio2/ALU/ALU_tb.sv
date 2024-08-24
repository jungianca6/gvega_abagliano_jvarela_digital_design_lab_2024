module ALU_tb();

parameter n = 4; // numero de bits

// Instanciar parametros de entrada y salida de la ALU
reg [n-1:0] a, b;
reg [3:0] Operator;
reg [2*n-1:0] Result;
reg N, Z, C, V;

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
    
    #10;
	 
	 // ------------------------------------------- OPERACION: ADD ---------------------------------------------------------------
    
	 // Operacion ADD: Ejemplo 1
    a = 4'b1000; 
    b = 4'b0001;
    Operator = 4'b0000;
    
    #10;
    
    $display("ADD operation Example 1 --->  result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("ADD operation Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1000 + 4'b0001), 1'b1, 1'b0, 1'b0, 1'b0);
    
	 // Operacion ADD: Ejemplo 2
    a = 4'b1001; 
    b = 4'b1010;
    Operator = 4'b0000;
    
    #10;
    
    $display("ADD operation Example 2 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("ADD operation Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b \n", (4'b1001 + 4'b1010), 1'b0, 1'b0, 1'b1, 1'b1);

	 // ------------------------------------------- OPERACION: SUB ---------------------------------------------------------------
	 
	 // Operacion SUB: Ejemplo 1
    a = 4'b1110; 
    b = 4'b0011;
    Operator = 4'b0001;
    
    #10;
    
    $display("SUB operation Example 1 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("SUB operation Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 - 8'b1111), 1'b0, 1'b1, 1'b0, 1'b0);
    
	 // Operacion SUB: Ejemplo 2
    a = 4'b1101; 
    b = 4'b1001;
    Operator = 4'b0001;
    
    #10;
    
    $display("SUB operation Example 2 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("SUB operation Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b \n", (8'b1101 - 8'b1001), 1'b0, 1'b0, 1'b0, 1'b0);
	 
	 // ------------------------------------------- OPERACION: MUL ---------------------------------------------------------------
	 
	 // Operacion MUL: Ejemplo 1
    a = 4'b0101; 
    b = 4'b0101;
    Operator = 4'b0010;
    
    #10;
    
    $display("MUL operation Example 1 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("MUL operation Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1111 * 8'b1111), 1'b0, 1'b0, 1'b0, 1'b0);
    
	 // Operacion MUL: Ejemplo 2
    a = 4'b0101; 
    b = 4'b0010;
    Operator = 4'b0010;
    
    #10;
    
    $display("MUL operation Example 2 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("MUL operation Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b \n", (8'b1101 * 8'b0000), 1'b0, 1'b1, 1'b0, 1'b0);
	 
	 
	 //-------------------------------------------- OPERACION: DIV -----------------------------------------------------------------
	 
	 //Operacion DIV : Ejemplo 1
	 
	 a = 4'b1110; 
    b = 4'b1000;
    Operator = 4'b0011;
    
    #10;
    
    $display("DIV operation Example 1 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("DIV operation Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (8'b1110 / 8'b1000), 1'b0, 1'b0, 1'b0, 1'b0);
    
	 // Operacion DIV: Ejemplo 2
    a = 4'b1101; 
    b = 4'b0010;
    Operator = 4'b0011;
    
    #10;
    
    $display("DIV operation Example 2 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("DIV operation Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b \n", (8'b1101 / 8'b0010), 1'b0, 1'b0, 1'b0, 1'b0);
	 
	  
	 // ------------------------------------------- OPERACION: MOD ---------------------------------------------------------------
	 
	 // Operacion MOD: Ejemplo 1
    a = 4'b1110; 
    b = 4'b0010;
    Operator = 4'b0100;
    
    #10;
    
    $display("MOD operation Example 1 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("MOD operation Example 1 ---> Expected: %b N: %b Z: %b C: %b V: %b\n", (4'b1110 % 4'b0010), 1'b0, 1'b1, 1'b0, 1'b0);
    
	 // Operacion M0D: Ejemplo 2
    a = 4'b1001; 
    b = 4'b0110;
    Operator = 4'b0100;
    
    #10;
    
    $display("MOD operation Example 2 ---> result: 		%b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("MOD operation Example 2 ---> Expected: %b N: %b Z: %b C: %b V: %b \n", (8'b1001 % 8'b0110), 1'b0, 1'b0, 1'b0, 1'b0);
	 
	 
	 
	   
	 // ------------------------------------------- OPERACION: AND ---------------------------------------------------------------
	 
	 // Operacion AND: Ejemplo 1
 
    a = 4'b1100; 
    b = 4'b1010;
    Operator = 4'b0101;
    
    #10;
    
    
    $display("AND operation Example 1 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("AND operation Example 1 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b1100 & 8'b1010), 1'b1, 1'b0, 1'b0, 1'b0);
    
    // Operacion AND: Ejemplo 2
    a = 4'b1111; 
    b = 4'b0000;
    Operator = 4'b0101;
    
	 
	 #10
	 
	 $display("AND operation Example 2 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("AND operation Example 2 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b1111 & 8'b0000), 1'b0, 1'b1, 1'b0, 1'b0);
	 
	  // ------------------------------------------- OPERACION: OR ---------------------------------------------------------------
	 
	 // Operacion OR: Ejemplo 1
 
    a = 4'b1100; 
    b = 4'b1010;
    Operator = 4'b0110;
    
    #10;
    
    
    $display("OR operation Example 1 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("OR operation Example 1 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (4'b1100 | 4'b1010), 1'b1, 1'b0, 1'b0, 1'b0);
    
    // Operacion OR: Ejemplo 2
    a = 4'b1111; 
    b = 4'b0000;
    Operator = 4'b0110;
    
	 
	 #10
	 
	 $display("OR operation Example 2 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("OR operation Example 2 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (4'b1111 | 4'b0000), 1'b1, 1'b0, 1'b0, 1'b0);
	 
	 
	 
	  // ------------------------------------------- OPERACION: XOR ---------------------------------------------------------------
	 
	 // Operacion XOR: Ejemplo 1
 
    a = 4'b1100; 
    b = 4'b1010;
    Operator = 4'b0111;
    
    #10;
    
    
    $display("XOR operation Example 1 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("XOR operation Example 1 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (4'b1100 ^ 4'b1010), 1'b0, 1'b0, 1'b0, 1'b0);
    
    // Operacion XOR: Ejemplo 2
    a = 4'b1111; 
    b = 4'b0000;
    Operator = 4'b0111;
    
	 
	 #10
	 
	 $display("XOR operation Example 2 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("XOR operation Example 2 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (4'b1111 ^ 4'b0000), 1'b1, 1'b0, 1'b0, 1'b0);
	 
	 
	 
	 
	 
	  // ------------------------------------------- OPERACION: Shift left---------------------------------------------------------------
	 
	 // Operacion Shift left: Ejemplo 1
 
    a = 4'b0010; 
    b = 4'b0011;
    Operator = 4'b1000;
    
    #10;
    
    
    $display("Shift left operation Example 1 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("Shift left operation Example 1 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b0010 << 8'b0011), 1'b0, 1'b0, 1'b0, 1'b0);
    
    // Operacion Shift left: Ejemplo 2
    a = 4'b1111; 
    b = 4'b0111;
    Operator = 4'b1000;
    
	 
	 #10
	 
	 $display("Shift left operation Example 2 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("Shift left operation Example 2 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b1111 << 8'b0111), 1'b0, 1'b0, 1'b0, 1'b0);
	 
	 
	  // ------------------------------------------- OPERACION: Shift right ---------------------------------------------------------------
	 
	 // Operacion Shift right : Ejemplo 1
 
    a = 4'b0100; 
    b = 4'b0010;
    Operator = 4'b1001;
    
    #10;
    
    
    $display("Shift right  operation Example 1 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("Shift right  operation Example 1 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b0100 >> 8'b0010), 1'b0, 1'b0, 1'b0, 1'b0);
    
    // Operacion Shift lright : Ejemplo 2
    a = 4'b1111; 
    b = 4'b0011;
    Operator = 4'b1001;
    
	 
	 #10
	 
	 $display("Shift right  operation Example 2 ---> result:       %b N: %b Z: %b C: %b V: %b", Result, N, Z, C, V);
    $display("Shift right  operation Example 2 ---> Expected:     %b N: %b Z: %b C: %b V: %b\n", (8'b1111 >> 8'b0011), 1'b0, 1'b0, 1'b0, 1'b0);
    
    
	 end

endmodule

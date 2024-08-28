module multiplier_nb_tb();

parameter n = 4; // numero de bits

// Instanciar parametros de entrada y salida de la ALU
logic [n-1:0] a, b;
//logic [2*n-1:0] Result;
logic [n-1:0] Result, Overf; 
	

// Instanciar la ALU
multiplier_nb #(n) uut (
    .a(a),
    .b(b),
	 .Overf(Overf),
    .Result(Result)
);

initial begin
	// Inicializar entradas
   a = 0; b = 0;
	
	#10
	
	a = 4'b1111;
	b = 4'b1111;
    
   #10;
    
	$display("MUL operation Example 1 ---> result: %b",Result);
   $display("MUL operation Example 1 ---> Expected: %b", (8'b1111 * 8'b1111));
	
end
	
endmodule

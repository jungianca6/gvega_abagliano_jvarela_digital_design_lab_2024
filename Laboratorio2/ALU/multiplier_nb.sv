/*module multiplier_nb#(
		parameter n = 4 // numero de bits del multiplicador
)(
    input logic [n-1:0] a,
    input logic [n-1:0] b, 
    output logic [2*n-1:0] Result // salida de tamano 2n-bit
);
	// declaracion de variables temporales
	logic [n-1:0] ax;
	logic [n-1:0] bx;

   int i, j; 

   always_comb begin
		// asignar los inputs a variables temporales (para el for)
		ax = a; 
		bx = b;
		j = bx;

		Result = 0; // Reinicia el resultado en cada ciclo

		for (i = 0; i < j; i++) begin : Itera
			Result = Result + ax; // resultado anterior mas el a (se realiza b veces)	 
		end         
    end 
endmodule */

module multiplier_nb
    #(parameter n = 4)(
    input logic [n-1:0] a,
    input logic [n-1:0] b,
    output logic [n-1:0] Overf,
	 output logic [n-1:0] Result
);
	
	
	 
	
	 
	 //Se crea la matriz llena de ceros, y se opera el primer producto a por b con AND, agregando el bit al principio
	 
    logic [2*n-1:0] products[n-1:0];
	 assign products[0] = { {(2*n-1)-n+1{1'b0}}, a & {n{b[0]}} };  

	 
	 //Las salidas se asignan con la ultima linea de la matriz que es el resultado de la suma de los productos
	 //Result para la salida N bits, Overf para lo que se desborda de N bits. 
	 
	 assign Overf = products[n-1][(2*n)-1:n];
	 assign Result = products[n-1][n-1:0]; 
	 
	 genvar i;
	 
	 generate
		for(i=1; i<n ; i++) begin: Sumproducts
			
			 if (i+1<n) begin
			 //Se reordena la matriz de productos agregando un bit o varios sucesivamente
				assign products[i][2*n-1:n+i+1] = {(n-i){1'b0}};
			 end
			
			full_adder_nb#(n+i) adder(
			.a(products[i-1][n+i-1:0]),
			.b({ a & {n{b[i]}} , {i{1'b0}} }),//Producto parcial nuevo
			.Cin(1'b0),
			.Sum(products[i][n+i-1:0]),
			.Cout(products[i][n+i])
			);
		end
	 endgenerate
endmodule


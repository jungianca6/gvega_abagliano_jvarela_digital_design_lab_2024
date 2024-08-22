module full_adder_nb_tb;
	// escoger el numero de bits
	parameter n = 4;  

	// cables de entrada
	reg [n-1:0] a, b;
	reg Cin;
	// cables de salida
	reg [n-1:0] Sum;
	reg Cout;

	// instanciar el sumador de n bits
	full_adder_nb #(
		.n(n)
	) uut (
		.a(a),
		.b(b),
		.Cin(Cin),
		.Sum(Sum),
		.Cout(Cout)
	);
	
	// testbench
	
	initial begin
	
		$display("Testbench para full_adder_nb");
      a = 4'b1001;
      b = 4'b1111;
		// setear el Cin inicial en 0 (equivalente a tierra)
		Cin = 1'b0;

      #40;
      $display("Input: a = %b, b = %b, Cin = %b", a, b, Cin);

      #40;
      $display("Output: Sum = %b, Cout = %b", Sum, Cout);
		
		$stop;
		
	end
	
endmodule 
module ALU # (parameter n = 2)(
	input logic [n-1:0] a, b,   	// entradas u operandos
	input logic [1:0] ALUControl, 	// codigo para la operacion
	output logic [n-1:0] ALUResult,// resultado de la operacion
	output logic [3:0] ALUFlags	
);

	//logic [n-1:0] extended_result; // resultado extendido para operaciones como MUL y DIV

	// definición de códigos de operación
	localparam [1:0] ADD = 2'b00,
						  SUB = 2'b01,
						  AND = 2'b10,
						  OR  = 2'b11;
						  
	logic N, Z, C, V;

	// Instancia del full_adder_nb
	wire [n-1:0] adder_result;
	wire adder_cout;
	full_adder_nb #(n) adder_inst (
		 .a(a),
		 .b(b),
		 .Cin(1'b0), // Asumiendo una suma sin acarreo de entrada
		 .Sum(adder_result),
		 .Cout(adder_cout)
	);

	// Instancia del full_subtract_nb
	wire [n-1:0] subtractor_result;
	wire subtractor_cout;
	full_subtractor_nb #(n) subtractor_inst (
		 .a(a),
		 .b(b),
		 .Cin(1'b0), // Asumiendo una resta sin acarreo de entrada
		 .Result(subtractor_result),
		 .Cout(subtractor_cout)
	);

	// Instancia del multiplier
	wire [n-1:0] multiplier_result;
	wire [n-1:0] multiplier_Overf;
	multiplier_nb #(n) multiplier_inst (
		 .a(a),
		 .b(b),
		 .Overf(multiplier_Overf),
		 .Result(multiplier_result)
	);
						  
	always_comb begin
		{N, Z, C, V} = 4'b0000; // inicializacion de las banderas en "0000"
	
		case(ALUControl)
			ADD: begin
				  ALUResult = adder_result; // suma
				  C = adder_cout;
				  V = (a[n-1] == b[n-1]) && (adder_result[n-1] != a[n-1]);
				  N = ALUResult[n-1];
			end
			
			SUB: begin
				  ALUResult = subtractor_result; // Resta
				  C = subtractor_cout;
				  V = (a[n-1] ^ subtractor_result[n-1]) & (a[n-1] ^ b[n-1]);
				  N = ALUResult[n-1];
			end
		
			AND: begin
				  ALUResult = a & b; // AND
				  {N, C, V} = 3'b000;
			end
			
			OR: begin
				  ALUResult = a | b; // OR
				 {N, C, V} = 3'b000;
			end		
			
			default: ALUResult = {n{1'b0}}; // En caso de operación desconocida
		
		endcase
		
		Z = (ALUResult == {n{1'b0}});	
		
	end
	assign ALUFlags = {N,Z,C,V};
	
endmodule
module adder #(parameter WIDTH = 8) (
    input logic [WIDTH-1:0] a, b,
    output logic [WIDTH-1:0] y
);

    // Add a and b, output the result in y
    assign y = a + b;

endmodule

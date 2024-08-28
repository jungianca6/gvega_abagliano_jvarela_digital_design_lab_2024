module full_subtractor_nb_tb;
    // escoger el numero de bits
    parameter n = 4;  

    // cables de entrada
    reg [n-1:0] a, b;
    reg Cin;
    // cables de salida
    reg [n-1:0] Result;
    reg Cout;

    // instanciar el restador de n bits
    full_subtractor_nb #(
        .n(n)
    ) uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .Result(Result),
        .Cout(Cout)
    );
    
    // testbench
    
    initial begin
    
        $display("Testbench para full_subtractor_nb");
        a = 4'b1001;
        b = 4'b1111;
        // setear el Cin inicial en 0 (equivalente a tierra)
        Cin = 1'b0;

        #40;
        $display("Input: a = %b, b = %b, Cin = %b", a, b, Cin);

        #40;
        $display("Output: Result = %b, Cout = %b", Result, Cout);
        
        $stop;
        
    end
    
endmodule

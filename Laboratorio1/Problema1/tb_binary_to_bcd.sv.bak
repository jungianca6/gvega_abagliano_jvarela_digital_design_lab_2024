module tb_binary_to_bcd;
    reg [3:0] binary;
    wire [7:0] bcd;

    binary_to_bcd uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin
        $monitor("binary = %b, bcd = %b", binary, bcd);
        
        // Pruebas con 8 valores diferentes
        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0010; #10;
        binary = 4'b0011; #10;
        binary = 4'b0100; #10;
        binary = 4'b0101; #10;
        binary = 4'b0110; #10;
        binary = 4'b0111; #10;
        
        $finish;
    end
endmodule

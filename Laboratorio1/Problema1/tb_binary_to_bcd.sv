module tb_binary_to_bcd;
    logic [3:0] binary;
    logic [7:0] bcd;

    binary_to_bcd uut (
        .binary(binary),
        .bcd(bcd)
    );

    initial begin
        #50
        // Pruebas con 8 valores diferentes
        binary = 4'b0000; #15;
        binary = 4'b0001; #15;
        binary = 4'b0010; #15;
        binary = 4'b0011; #15;
        binary = 4'b0100; #15;
        binary = 4'b0101; #15;
        binary = 4'b0110; #15;
        binary = 4'b0111; #15;
        
    end
endmodule

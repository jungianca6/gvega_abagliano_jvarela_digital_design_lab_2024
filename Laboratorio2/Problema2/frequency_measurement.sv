module frequency_measurement #(parameter N = 32) (
    input logic clk,
    input logic reset,
    input logic [N-1:0] A_num,
    input logic [N-1:0] B_num,
    input logic [3:0] operations_buttons,
    input logic [1:0] change_mode,
    output logic [6:0] seg1,
    output logic [6:0] seg2,
    output logic [6:0] result_seg,
    output logic [6:0] flags_seg
);

    // Señales internas
    logic [N-1:0] Output_A_num;
    logic [N-1:0] Output_B_num;
    logic [3:0] Output_operations_buttons;
    logic [1:0] Output_change_mode;
    logic [N-1:0] alu_result;
    logic [N-1:0] alu_binaryResult;
    logic [6:0] alu_display1;
    logic [6:0] alu_display2;
    logic alu_N, alu_Z, alu_C, alu_V;
    
    // Instancia del Flip-Flop 1
    FlipFlop1 #(N) ff1 (
        .clk(clk),
        .reset(reset),
        .A_numf1(A_num),
        .B_numf1(B_num),
        .operations_buttonsf1(operations_buttons),
        .change_modef1(change_mode),
        .Output_A_numf1(Output_A_num),
        .Output_B_numf1(Output_B_num),
        .Output_operations_buttonsf1(Output_operations_buttons),
        .Output_change_modef1(Output_change_mode)
    );

    // Instancia de la ALU
    ALU #(N) my_alu (
        .a(Output_A_num),
        .b(Output_B_num),
        .Operator(Output_operations_buttons),
        .Result(alu_result),
        .binaryResult(alu_binaryResult),
        .display1(alu_display1),
        .display2(alu_display2),
        .N(alu_N),
        .Z(alu_Z),
        .C(alu_C),
        .V(alu_V)
    );

    // Instancia del Flip-Flop 2 7bits
    FlipFlop2 #(N) ff2 (
        .clk(clk),																																																																																																																																																																																																														
        .reset(reset),
        .seg1f2(alu_display1),
        .seg2f2(alu_display2),
        .result_segf2(alu_result),
        .flags_segf2({alu_N, alu_Z, alu_C, alu_V}),
        .Output_seg1f2(seg1),
        .Output_seg2f2(seg2),
        .Output_result_segf2(result_seg),																																																																																																			
        .Output_flags_segf2(flags_seg)
    );

endmodule

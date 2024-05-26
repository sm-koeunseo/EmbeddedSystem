`timescale 1ns / 1ns

module Beh_Add4(A, B, Ci, S, Co);

    parameter WIDTH = 4;
    input [(WIDTH - 1):0] A, B; // 길이 변경에 유연한 대처
    input Ci;
    output [3:0] S;
    reg [3:0] S;
    output Co;
    reg Co;

    reg [4:0] A5, B5, S5;

    always @(A, B, Ci) begin
        {Co, S} <= A + B + Ci;
    end

endmodule
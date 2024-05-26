`timescale 1ns / 1ns

module Beh_Add4(A, B, Ci, S, Co);

    input [3:0] A, B;
    input Ci;
    output [3:0] S;
    reg [3:0] S;
    output Co;
    reg Co;

    reg [4:0] A5, B5, S5;

    always @(A, B, Ci) begin
        // 한줄로 단축
        {Co, S} <= A + B + Ci;       // 최상단비트는 올림수, 나머지는 결과값
    end

endmodule
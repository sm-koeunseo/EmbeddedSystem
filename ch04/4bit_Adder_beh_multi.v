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
        A5 = {1'b0, A}; B5 = {1'b0, B}; // 비트 확장 (최상단에 1비트(0) 추가)
        S5 = A5 + B5 + Ci;              // 2진수 덧셈
        S <= S5[3:0];                   // 결과값
        Co <= S5[4];                    // 올림
    end

endmodule
`include "define.h"

module Beh_Add4(A, B, Ci, S, Co);

    input [(`WIDTH - 1):0] A, B;
    input Ci;
    output [(`WIDTH - 1):0] S;
    reg [(`WIDTH - 1):0] S;
    output Co;
    reg Co;

    always @(A, B, Ci) begin
        {Co, S} <= A + B + Ci;
    end

endmodule
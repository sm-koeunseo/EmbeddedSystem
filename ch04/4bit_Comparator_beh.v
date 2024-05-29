`include "define.h"

module Beh_Comp(A, B, Gt, Eq, Lt);

    input signed [(`WIDTH-1):0] A;
    input signed [(`WIDTH-1):0] B;
    output Gt, Eq, Lt;
    reg Gt, Eq, Lt;

    always @(A,B) begin
        if (A < B) begin    // $signed(A) 가능
            Gt <= 1'b0; Eq <= 1'b0; Lt <= 1'b1;
        end
        else 
        if (A > B) begin
            Gt <= 1'b1; Eq <= 1'b0; Lt <= 1'b0;
        end
        else begin
            Gt <= 1'b0; Eq <= 1'b1; Lt <= 1'b0;
        end
    end

endmodule
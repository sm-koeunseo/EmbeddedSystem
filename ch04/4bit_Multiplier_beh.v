`include "define.h"

module Mult(A, B, C);

    input signed [(`WIDTH-1):0] A, B;
    output [(`WIDTH*2-1):0] C;

    assign C = A * B;   // 한 줄은 always begin 구분 필요 x

endmodule
`include "define.h"

module BSR8(BS, D_IN, D_OUT);

    input BS;
    input [`IWIDTH-1:0] D_IN;
    output reg [`IWIDTH-1:0] D_OUT;

    always @(BS, D_IN) begin
        if (BS)
            D_OUT <= {{8{D_IN[`IWIDTH-1]}}, D_IN[`IWIDTH-1:8]};
        else
            D_OUT <= D_IN;
    end
    

endmodule
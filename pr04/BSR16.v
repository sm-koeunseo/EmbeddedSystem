`include "define.h"

module BSR16(BS, D_IN, D_OUT);

    input BS;
    input [`IWIDTH-1:0] D_IN;
    output reg [`IWIDTH-1:0] D_OUT;

    always @(BS, D_IN) begin
        if (BS)
            D_OUT <= {{16{D_IN[`IWIDTH-1]}}, D_IN[`IWIDTH-1:16]};
        else
            D_OUT <= D_IN;
    end
    

endmodule
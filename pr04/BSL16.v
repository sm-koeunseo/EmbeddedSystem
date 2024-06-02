`include "define.h"

module BSL16(BS, D_IN, D_OUT);

    input BS;
    input [`IWIDTH-1:0] D_IN;
    output reg [`IWIDTH-1:0] D_OUT;

    always @(BS, D_IN) begin
        if (BS)
            D_OUT <= {D_IN[`IWIDTH-17:0], 16'b0};
        else
            D_OUT <= D_IN;
    end

endmodule
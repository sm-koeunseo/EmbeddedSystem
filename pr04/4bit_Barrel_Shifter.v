`include "define.h"

module Barrel_Shifter(BS_DIR, BS_AMT, D_IN, D_OUT);

    input BS_DIR;
    input [`SWIDTH-1:0] BS_AMT;
    input [`IWIDTH-1:0] D_IN;
    output reg [`IWIDTH-1:0] D_OUT;

    reg [`SWIDTH-1:0] BSR_AMT;
    reg [`SWIDTH-1:0] BSL_AMT;

    wire [`IWIDTH-1:0] D_RIHGT;
    wire [`IWIDTH-1:0] D_LEFT;

    BSL bsl(BS_AMT, D_IN, D_LEFT);
    BSR bsr(BS_AMT, D_IN, D_RIHGT);

    always @(BS_DIR, BS_AMT, D_IN, D_RIHGT, D_LEFT) begin
        if (BS_DIR) begin
            BSR_AMT <= BS_AMT;
            BSL_AMT <= {(`SWIDTH){1'b0}};
            D_OUT <= D_RIHGT;
        end
        else begin
            BSR_AMT <= {(`SWIDTH){1'b0}};
            BSL_AMT <= BS_AMT;
            D_OUT <= D_LEFT;
        end
    end

endmodule
`include "define.h"

module BSL(BS_AMT, D_IN, D_OUT);

    input [`SWIDTH-1:0] BS_AMT;
    input [`IWIDTH-1:0] D_IN;
    output [`IWIDTH-1:0] D_OUT;
    wire [`IWIDTH-1:0] D_TMP;

    BSL2 bsl2(BS_AMT[1], D_IN, D_TMP);
    BSL1 bsl1(BS_AMT[0], D_TMP, D_OUT);

endmodule
`include "define.h"

module BSR(BS_AMT, D_IN, D_OUT);

    input  [`SWIDTH-1:0] BS_AMT;
    input  [`IWIDTH-1:0] D_IN;
    output [`IWIDTH-1:0] D_OUT;
    wire   [`IWIDTH-1:0] D_TMP [0:`SWIDTH-2];

    BSR16 bsr16 (BS_AMT[`SWIDTH-1], D_IN,     D_TMP[0]);
    BSR8  bsr8  (BS_AMT[`SWIDTH-2], D_TMP[0], D_TMP[1]);
    BSR4  bsr4  (BS_AMT[`SWIDTH-3], D_TMP[1], D_TMP[2]);
    BSR2  bsr2  (BS_AMT[`SWIDTH-4], D_TMP[2], D_TMP[3]);
    BSR1  bsr1  (BS_AMT[`SWIDTH-5], D_TMP[3], D_OUT);

endmodule
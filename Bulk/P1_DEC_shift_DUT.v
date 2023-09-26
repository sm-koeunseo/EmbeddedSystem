module P1_DEC_LLS(
    output      [4:0]   out,
    input       [2:0]   in,
    input               en
);

    assign  out = (en == 1'b1) ? (5'b10100 << in) : 5'd0;

endmodule

module P1_DEC_RLS(
    output      [4:0]   out,
    input       [2:0]   in,
    input               en
);

    assign  out = (en == 1'b1) ? (5'b10100 >> in) : 5'd0;

endmodule

module P1_DEC_LAS(
    output signed     [4:0]   out,
    input       [2:0]   in,
    input               en
);

    assign  out = (en == 1'b1) ? (5'b10100 <<< in) : 5'd0;

endmodule

module P1_DEC_RAS(
    output signed     [4:0]   out,
    input       [2:0]   in,
    input               en
);

    assign  out = (en == 1'b1) ? (5'b10100 >>> in) : 5'd0;

endmodule
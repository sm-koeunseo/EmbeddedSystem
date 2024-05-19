// 2:4 Decoder using Dataflow

module P1_DEC_dataflow(
    output      [3:0]   out,
    input       [1:0]   in,
    input               en
);

    assign  out = (en == 1'b1) ? (4'd1 << in) : 4'd0;

endmodule
// 1-bit Full Adder (Description: Dataflow 2)

module P1_FA_dataflow2(
    output          s,   // sum
    output          co,  // carry out
    input           a,   // input a
    input           b,   // input b
    input           ci   // carry in
);

    assign          {co, s} = a + b + ci;

endmodule
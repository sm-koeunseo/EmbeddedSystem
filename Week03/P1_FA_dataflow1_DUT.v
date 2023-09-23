// 1-bit Full Adder (Description: Dataflow 1)

module P1_FA_dataflow1(
    output          s,   // sum
    output          co,  // carry out
    input           a,   // input a
    input           b,   // input b
    input           ci   // carry in
);

    assign          s   = (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
    assign          co  = (a & b) + (b & ci) + (a & ci);

endmodule
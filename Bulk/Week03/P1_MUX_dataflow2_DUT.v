// 2:1 Multiplexer multibit (Description: dataflow)

module P1_MUX_dataflow2(
    output  [3:0]   y,      // sum
    input   [3:0]   d0,     // input D0
    input   [3:0]   d1,     // input D1
    input           s       // select
);

    assign          y = s ? d1 : d0;

endmodule
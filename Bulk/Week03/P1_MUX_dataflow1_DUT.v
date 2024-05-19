// 2:1 Multiplexer (Description: dataflow)

module P1_MUX_dataflow1(
    output          y,      // sum
    input           d0,     // input D0
    input           d1,     // input D1
    input           s       // select
);

    assign          y = s ? d1 : d0;

endmodule
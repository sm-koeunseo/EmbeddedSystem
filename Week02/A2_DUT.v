module A2_DUT #(
)(
    output  y   ,
    input   s1  ,
    input   s0  ,
    input   d0  ,
    input   d1  ,
    input   d2  ,
    input   d3
);

    wire    wS1n;   // s1의 인버터 적용 후
    wire    wS0n;   // s0의 인버터 적용 후
    wire    wA0;    // AND_U0 gate 거친 후
    wire    wA1;    // AND_U1 gate 거친 후
    wire    wA2;    // AND_U2 gate 거친 후
    wire    wA3;    // AND_U3 gate 거친 후

    not     NOT_U0(wS1n, s1);
    not     NOT_U1(wS0n, s0);
    and     AND_U0(wA0, d0, wS1n, wS0n);
    and     AND_U1(wA1, d1, wS1n, s0);
    and     AND_U2(wA2, d2, s1, wS0n);
    and     AND_U3(wA3, d3, s1, s0);
    or      OR_U0(y, wA0, wA1, wA2, wA3);

endmodule
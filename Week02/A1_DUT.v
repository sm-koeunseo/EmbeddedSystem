// 2:1 MUX

module A1_DUT #(
)(
    output  y   ,
    input   s   ,
    input   d1  ,
    input   d0
);

    wire    wSn;    // s의 인버터 적용 후
    wire    wA0;    // AND_U0 gate 거친 후
    wire    wA1;    // AND_U1 gate 거친 후

    // A1_DUT를 활용하여 test해 보기
    not     NOT_U0(wSn, s);
    and     AND_U0(wA0, d0, wSn);
    and     AND_U1(wA1, s, d1);
    or      OR_U0(y, wA0, wA1);

endmodule
module A1_DUT #(
)(  // A1_DUT를 활용하여 test해 보기
    output  y   ,
    input   s   ,
    input   d1  ,
    input   d0
);

    // A1_DUT를 활용하여 test해 보기
    wire    wSn;    // s의 인버터 적용 후
    wire    wA0;
    wire    wA1;

    // A1_DUT를 활용하여 test해 보기
    not     NOT_U0(wSn, s);
    and     AND_U0(wA0, d0, wSn);
    and     AND_U1(wA1, s, d1);
    or      OR_U0(y, wA0, wA1);

endmodule
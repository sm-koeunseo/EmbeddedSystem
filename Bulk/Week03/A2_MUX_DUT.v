// 4:1 MUX using 3 of 2:1 MUX

// 메인 MUX의 부품으로서 활용될 2:1 MUX
module MUX2(
    output      y,
    input       d0,
    input       d1,
    input       s
);

    assign  y = s ? d1 : d0;

endmodule


// 메인 MUX, 3개의 2:1 MUX를 멤버로 활용
module MUX4(
    output  [2:0]   y,
    input   [3:0]   d,
    input   [1:0]   s
);

    // d0, d1, s0
    MUX2 mux2_1(
        .y      (y[0]   ),
        .d0     (d[0]   ),
        .d1     (d[1]   ),
        .s      (s[0]   )
    );

    // d2, d3, s0
    MUX2 mux2_2(
        .y      (y[1]   ),
        .d0     (d[2]   ),
        .d1     (d[3]   ),
        .s      (s[0]   )
    );

    // s1
    MUX2 mux2_3(
        .y      (y[2]   ),
        .d0     (y[0]   ),
        .d1     (y[1]   ),
        .s      (s[1]   )
    );

endmodule
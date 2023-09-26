module A3_FA(
    output          s,   // sum
    output          co,  // carry out
    input           a,   // input a
    input           b,   // input b
    input           ci   // carry in
);

    assign          s   = (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
    assign          co  = (a & b) + (b & ci) + (a & ci);

endmodule

module A3_RCA8(
    output      [7:0]   s,
    output              co,
    input       [7:0]   a,
    input       [7:0]   b,
    input               ci
);

    wire        [6:0]   carry;

    A3_FA fa_u0(
        .s      (s[0]       ),
        .co     (carry[0]   ),
        .a      (a[0]       ),
        .b      (b[0]       ),
        .ci     (ci         )
    );

    A3_FA fa_u1(
        .s      (s[1]       ),
        .co     (carry[1]   ),
        .a      (a[1]       ),
        .b      (b[1]       ),
        .ci     (carry[0]   )
    );

    A3_FA fa_u2(
        .s      (s[2]       ),
        .co     (carry[2]   ),
        .a      (a[2]       ),
        .b      (b[2]       ),
        .ci     (carry[1]   )
    );

    A3_FA fa_u3(
        .s      (s[3]       ),
        .co     (carry[3]   ),
        .a      (a[3]       ),
        .b      (b[3]       ),
        .ci     (carry[2]   )
    );

    A3_FA fa_u4(
        .s      (s[4]       ),
        .co     (carry[4]   ),
        .a      (a[4]       ),
        .b      (b[4]       ),
        .ci     (carry[3]   )
    );

    A3_FA fa_u5(
        .s      (s[5]       ),
        .co     (carry[5]   ),
        .a      (a[5]       ),
        .b      (b[5]       ),
        .ci     (carry[4]   )
    );

    A3_FA fa_u6(
        .s      (s[6]       ),
        .co     (carry[6]   ),
        .a      (a[6]       ),
        .b      (b[6]       ),
        .ci     (carry[5]   )
    );

    A3_FA fa_u7(
        .s      (s[7]       ),
        .co     (co         ),
        .a      (a[7]       ),
        .b      (b[7]       ),
        .ci     (carry[6]   )
    );

endmodule
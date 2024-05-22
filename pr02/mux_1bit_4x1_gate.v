`timescale 1ns / 1ns

module Mux4x1 (I3, I2, I1, I0, S1, S0, D);

    input I3, I2, I1, I0;
    input S1, S0;
    output D;

    wire N0, N1;
    wire N2, N3, N4, N5;

    Inv Inv_1 (S1, N1); // S1의 반전 값
    Inv Inv_2 (S0, N0); // S0의 반전 값

    And3 And3_1 (I3, N1, N0, N2);   // 00일 때, I3 선택
    And3 And3_2 (I2, N1, S0, N3);
    And3 And3_3 (I1, S1, N0, N4);
    And3 And3_4 (I0, S1, S0, N5);
    Or4 Or4_1 (N2, N3, N4, N5, D);

endmodule
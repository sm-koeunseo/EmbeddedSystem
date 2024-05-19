`timescale  1ns / 1ns

module BeltWarn(K, P, S, W);

    input K, P, S;  
    output W;

    wire N1, N2;

    And2 And2_1(K, P, N1);
    Inv Inv_1(S, N2);
    And2 And2_2(N1, N2, W);

endmodule
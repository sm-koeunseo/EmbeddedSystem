`timescale 1ns / 1ns

module Mux4x2(A1, A0, B1, B0,
                C1, C0, D1, D0, 
                S1, S0, E1, E0);

    input A1, A0, B1, B0, C1, C0, D1, D0;
    input S1, S0;
    output E1, E0;

    Mux4x1 Mux4x1_1(D1, C1, B1, A1, S1, S0, E1);
    Mux4x1 Mux4x1_2(D0, C0, B0, A0, S1, S0, E0);

endmodule
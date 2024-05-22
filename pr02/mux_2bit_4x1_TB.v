`timescale 1ns / 1ns

module Testbench();

    reg S1, S0;

    reg A1_0, A0_0, B1_0, B0_0,
        C1_0, C0_0, D1_0, D0_0;
    wire E1_0, E0_0;

    reg A1_1, A0_1, B1_1, B0_1,
        C1_1, C0_1, D1_1, D0_1;
    wire E1_1, E0_1;

    Mux4_2b Test_bh(A1_0, A0_0, B1_0, B0_0, C1_0, C0_0, D1_0, D0_0, S1, S0, E1_0, E0_0);
    Mux4x2 Test_st(A1_1, A0_1, B1_1, B0_1, C1_1, C0_1, D1_1, D0_1, S1, S0, E1_1, E0_1);

    initial begin
        A1_0 <= 0; A0_0 <= 0; B1_0 <= 0; B0_0 <= 1; C1_0 <= 1; C0_0 <= 0; D1_0 <= 1; D0_0 <= 1;
        A1_1 <= 0; A0_1 <= 0; B1_1 <= 0; B0_1 <= 1; C1_1 <= 1; C0_1 <= 0; D1_1 <= 1; D0_1 <= 1;
        S1 <= 0; S0 <= 0; #10;
        S1 <= 0; S0 <= 1; #10;
        S1 <= 1; S0 <= 0; #10;
        S1 <= 1; S0 <= 1; #10;

    end
endmodule
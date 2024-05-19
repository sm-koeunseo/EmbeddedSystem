`timescale 1ns / 1ns

module Testbench();

    reg A3_s, A2_s, A1_s, A0_s;
    reg B3_s, B2_s, B1_s, B0_s;
    reg S0_s;
    wire C3_s, C2_s, C1_s, C0_s;

    Mux2_4b CompToTest(A3_s, A2_s, A1_s, A0_s,
                        B3_s, B2_s, B1_s, B0_s,
                        S0_s,
                        C3_s, C2_s, C1_s, C0_s);

    initial begin
        A3_s <= 0; A2_s <= 0; A1_s <= 0; A0_s <= 0;
        B3_s <= 1; B2_s <= 1; B1_s <= 1; B0_s <= 1;
        S0_s <= 0; #10;
        S0_s <= 1; #10;
    end
endmodule
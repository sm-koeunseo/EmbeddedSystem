`timescale 1ns / 1ns

module Testbench();

    reg I0_s, I1_s, S0_s;
    wire D_s;

    Mux2 CompToTest(I0_s, I1_s, S0_s, D_s);

    initial begin
        I0_s <= 0; I1_s <= 0; S0_s <= 0; #10;
        I0_s <= 0; I1_s <= 0; S0_s <= 1; #10;
        I0_s <= 0; I1_s <= 1; S0_s <= 0; #10;
        I0_s <= 0; I1_s <= 1; S0_s <= 1; #10;
        I0_s <= 1; I1_s <= 0; S0_s <= 0; #10;
        I0_s <= 1; I1_s <= 0; S0_s <= 1; #10;
        I0_s <= 1; I1_s <= 1; S0_s <= 0; #10;
        I0_s <= 1; I1_s <= 1; S0_s <= 1; #10;
    end
endmodule
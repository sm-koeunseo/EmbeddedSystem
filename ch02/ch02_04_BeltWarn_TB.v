`timescale 1ns / 1ns

module Testbench();

    reg K_s, P_s, S_s;
    wire W_s;

    BeltWarn CompToTest(K_s, P_s, S_s, W_s);

    initial begin
        K_s <= 0; P_s <= 0; S_s <= 0; #10;
        K_s <= 0; P_s <= 1; S_s <= 0; #10;
        K_s <= 1; P_s <= 1; S_s <= 0; #10;
        K_s <= 1; P_s <= 1; S_s <= 1; #10;
    end
endmodule
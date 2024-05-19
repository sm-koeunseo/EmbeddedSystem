`timescale 1ns / 1ns

module Testbench();

    reg I1_s, I0_s;
    wire D3_s, D2_s, D1_s, D0_s;

    Dcd2x4 CompToTest(I1_s, I0_s, D3_s, D2_s, D1_s, D0_s);

    initial begin
       I1_s <= 0; I0_s <= 0; #10;
       I1_s <= 0; I0_s <= 1; #10;
       I1_s <= 1; I0_s <= 0; #10;
       I1_s <= 1; I0_s <= 1; #10;
    end
endmodule
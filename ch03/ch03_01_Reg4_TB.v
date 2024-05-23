`timescale 1ns/1ns

module Testbench();

    reg [3:0] I_s;
    reg Clk_s, Rst_s;
    wire [3:0] Q_s;

    Reg4 CompToTest(I_s, Q_s, Clk_s, Rst_s);

    // Clock Procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end // Note: Procedure repeats

    // Vector Procedure
    initial begin
        Rst_s <= 1;
        I_s <= 4'b0000;
        @(posedge Clk_s);
        #5 Rst_s <= 0;
        @(posedge Clk_s);
        #5;
        I_s <= 4'b1010;
        @(posedge Clk_s);
        #5;
        I_s <= 4'b1111;
        @(posedge Clk_s);
        #10;
        $stop;
    end

endmodule
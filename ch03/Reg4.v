`timescale 1ns/1ns

module Reg4(I, Q, Clk, Rst);

    input [3:0] I;
    output [3:0] Q;
    reg [3:0] Q;
    input Clk, Rst;

    always @(posedge Clk) begin
        if (Rst == 1)
            Q <= 4'b0000;
        else
            Q <= I;
        
    end

endmodule
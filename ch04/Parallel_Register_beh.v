`timescale 1ns/1ns

module Preg4(I, Q, Load, Clk, Rst);
    
    input [3:0] I;
    output [3:0] Q; // why without Reg?
    input Load, Clk, Rst;
    reg [3:0] R, R_Next;

    always @(I, Load, R) begin
        if (Load == 1'b1)
            R_Next <= I;
        else
            R_Next <= R;
    end

    always @(posedge Clk) begin
        if (Rst == 1)
            R <= 4'b0000;
        else
            R <= R_Next;
    end

    assign Q = R;   // R  

endmodule
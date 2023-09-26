//

`timescale 1ns/1ps

module P2_RCA4_hier_TB;

    wire    [3:0]   s;
    wire            co;
    reg     [3:0]   a;
    reg     [3:0]   b;
    reg             ci;

    P2_RCA4_hier rca4(
        .s      (s  ),
        .co     (co ),
        .a      (a  ),
        .b      (b  ),
        .ci     (ci )
    );

    initial begin
        $display("4-bit Ripple Carry Adder");
        #100    {ci, a, b} = 9'b000001111;    #100    $display("%4b + %4b = %4b, %1b", a, b, s, co);
        #100    {ci, a, b} = 9'b010100101;    #100    $display("%4b + %4b = %4b, %1b", a, b, s, co);
        #100    {ci, a, b} = 9'b011110001;    #100    $display("%4b + %4b = %4b, %1b", a, b, s, co);
        #100    {ci, a, b} = 9'b011101001;    #100    $display("%4b + %4b = %4b, %1b", a, b, s, co);
        #100    $finish;
    end

endmodule
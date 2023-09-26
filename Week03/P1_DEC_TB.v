// 2:4 Decoder using Dataflow

`timescale 1ns/1ps

module P1_DEC_TB;

    wire    [3:0]   out;
    reg     [1:0]   in;
    reg             en;

P1_DEC_dataflow dec(
    .out    (out    ),
    .in     (in     ),
    .en     (en     )
);

initial begin
        $display("2:4 Decoder using Dataflow");
        #100    {en, in} = 3'b100;    #100    $display(" Expected:0001, H/W Output: %b", out);
        #100    {en, in} = 3'b101;    #100    $display(" Expected:0010, H/W Output: %b", out);
        #100    {en, in} = 3'b110;    #100    $display(" Expected:0100, H/W Output: %b", out);
        #100    {en, in} = 3'b111;    #100    $display(" Expected:1000, H/W Output: %b", out);
        #100    {en, in} = 3'b000;    #100    $display(" Expected:0000, H/W Output: %b", out);
        #100    {en, in} = 3'b001;    #100    $display(" Expected:0000, H/W Output: %b", out);
        #100    {en, in} = 3'b010;    #100    $display(" Expected:0000, H/W Output: %b", out);
        #100    {en, in} = 3'b011;    #100    $display(" Expected:0000, H/W Output: %b", out);
        #100    $finish;
    end

endmodule
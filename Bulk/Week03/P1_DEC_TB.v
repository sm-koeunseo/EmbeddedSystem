// 2:4 Decoder using Dataflow

`timescale 1ns/1ps

module P1_DEC_TB;

    wire    [3:0]   out_df;
    reg     [1:0]   in_df;
    reg             en_df;

    wire    [3:0]   out_bh;
    reg     [1:0]   in_bh;
    reg             en_bh;

    P1_DEC_dataflow dec_df(
        .out    (out_df ),
        .in     (in_df  ),
        .en     (en_df  )
    );

    P1_DEC_behavior dec_bh(
        .out    (out_bh ),
        .in     (in_bh  ),
        .en     (en_bh  )
    );

initial begin
        $display("2:4 Decoder using Dataflow");
        #100    {en_df, in_df} = 3'b100;    #100    $display(" Expected:0001, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b101;    #100    $display(" Expected:0010, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b110;    #100    $display(" Expected:0100, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b111;    #100    $display(" Expected:1000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b000;    #100    $display(" Expected:0000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b001;    #100    $display(" Expected:0000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b010;    #100    $display(" Expected:0000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 3'b011;    #100    $display(" Expected:0000, H/W Output: %b", out_df);
        #100
        
        $display("2:4 Decoder using Behavior");
        #100    {en_bh, in_bh} = 3'b100;    #100    $display(" Expected:0001, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b101;    #100    $display(" Expected:0010, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b110;    #100    $display(" Expected:0100, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b111;    #100    $display(" Expected:1000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b000;    #100    $display(" Expected:0000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b001;    #100    $display(" Expected:0000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b010;    #100    $display(" Expected:0000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 3'b011;    #100    $display(" Expected:0000, H/W Output: %b", out_bh);
        #100    $finish;
    end

endmodule
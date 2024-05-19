// 3:8 Decoder using Dataflow and Behavior

`timescale 1ns/1ps

module A1_DEC_TB;

    // 테스트에 필요한 각 wire(output), reg(input) 선언
    wire    [7:0]   out_df;
    reg     [2:0]   in_df;
    reg             en_df;

    wire    [7:0]   out_bh;
    reg     [2:0]   in_bh;
    reg             en_bh;

    wire    [7:0]   out;
    reg     [2:0]   in;

    // 각 모듈 불러오기
    A1_DEC_dataflow dec_df(
        .out    (out_df ),
        .in     (in_df  ),
        .en     (en_df  )
    );

    A1_DEC_behavior dec_bh(
        .out    (out_bh ),
        .in     (in_bh  ),
        .en     (en_bh  )
    );

    A1_DEC dec(
        .out    (out ),
        .in     (in  )
    );

    // 테스트 방식 : enable 내림차순, input 오름차순으로 정렬
    initial begin
        $display("3:8 Decoder using Dataflow");
        #100    {en_df, in_df} = 4'b1000;    #100    $display(" Expected:00000001, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1001;    #100    $display(" Expected:00000010, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1010;    #100    $display(" Expected:00000100, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1011;    #100    $display(" Expected:00001000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1100;    #100    $display(" Expected:00010000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1101;    #100    $display(" Expected:00100000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1110;    #100    $display(" Expected:01000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b1111;    #100    $display(" Expected:10000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0000;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0001;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0010;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0011;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0100;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0101;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0110;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    {en_df, in_df} = 4'b0111;    #100    $display(" Expected:00000000, H/W Output: %b", out_df);
        #100    
        
        $display("3:8 Decoder using Behaivor");
        #100    {en_bh, in_bh} = 4'b1000;    #100    $display(" Expected:00000001, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1001;    #100    $display(" Expected:00000010, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1010;    #100    $display(" Expected:00000100, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1011;    #100    $display(" Expected:00001000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1100;    #100    $display(" Expected:00010000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1101;    #100    $display(" Expected:00100000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1110;    #100    $display(" Expected:01000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b1111;    #100    $display(" Expected:10000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0000;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0001;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0010;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0011;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0100;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0101;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0110;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100    {en_bh, in_bh} = 4'b0111;    #100    $display(" Expected:00000000, H/W Output: %b", out_bh);
        #100
        
        $display("3:8 Decoder except enable");
        #100    {in} = 3'b000;    #100    $display(" Expected:00000001, H/W Output: %b", out);
        #100    {in} = 3'b001;    #100    $display(" Expected:00000010, H/W Output: %b", out);
        #100    {in} = 3'b010;    #100    $display(" Expected:00000100, H/W Output: %b", out);
        #100    {in} = 3'b011;    #100    $display(" Expected:00001000, H/W Output: %b", out);
        #100    {in} = 3'b100;    #100    $display(" Expected:00010000, H/W Output: %b", out);
        #100    {in} = 3'b101;    #100    $display(" Expected:00100000, H/W Output: %b", out);
        #100    {in} = 3'b110;    #100    $display(" Expected:01000000, H/W Output: %b", out);
        #100    {in} = 3'b111;    #100    $display(" Expected:10000000, H/W Output: %b", out);
        #100    $finish;
    end

endmodule
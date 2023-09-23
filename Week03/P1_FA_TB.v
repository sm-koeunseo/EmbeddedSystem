//

`timescale 1ns/1ps

module P1_FullAdders_TB;

    wire        s_df1, s_df2, s_bh1, s_bh2;
    wire        co_df1, co_df2, co_bh1, co_bh2;

    reg         a, b, ci;

    P1_FA_dataflow1     fa_df1(
        .s          (s_df1  ),
        .co         (co_df1 ),
        .a          (a      ),
        .b          (b      ),
        .ci         (ci     )
    );

    P1_FA_dataflow2     fa_df2(
        .s          (s_df2  ),
        .co         (co_df2 ),
        .a          (a      ),
        .b          (b      ),
        .ci         (ci     )
    );

    P1_FA_behavior1     fa_bh1(
        .s          (s_bh1  ),
        .co         (co_bh1 ),
        .a          (a      ),
        .b          (b      ),
        .ci         (ci     )
    );

    P1_FA_behavior1     fa_bh2(
        .s          (s_bh2  ),
        .co         (co_bh2 ),
        .a          (a      ),
        .b          (b      ),
        .ci         (ci     )
    );

    initial begin
        $display("1-bit Full Adder");
        #100    {ci, a, b} = 3'b000;    #100    $display(" Expected:0/0, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b001;    #100    $display(" Expected:0/1, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b010;    #100    $display(" Expected:0/1, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b011;    #100    $display(" Expected:1/0, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b100;    #100    $display(" Expected:0/1, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b101;    #100    $display(" Expected:1/0, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b110;    #100    $display(" Expected:1/0, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    {ci, a, b} = 3'b111;    #100    $display(" Expected:1/1, H/W Output: %b/%b,%b/%b,%b/%b,%b/%b", co_df1, s_df1, co_df2, s_df2, co_bh1, s_bh1, co_bh2, s_bh2);
        #100    $finish;
    end

endmodule
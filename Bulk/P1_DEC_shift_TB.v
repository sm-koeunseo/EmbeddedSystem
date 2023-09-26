//

`timescale 1ns/1ps

module P1_DEC_shift_TB;

wire    [4:0]   out_lls;
reg     [2:0]   in_lls;
reg             en_lls;

wire    [4:0]   out_rls;
reg     [2:0]   in_rls;
reg             en_rls;

wire signed   [4:0]   out_las;
reg signed    [2:0]   in_las;
reg             en_las;

wire signed   [4:0]   out_ras;
reg signed    [2:0]   in_ras;
reg             en_ras;

P1_DEC_LLS LLS(
    .out        (out_lls    ),
    .in         (in_lls     ),
    .en         (en_lls     )
);
P1_DEC_RLS RLS(
    .out        (out_rls    ),
    .in         (in_rls     ),
    .en         (en_rls     )
);
P1_DEC_LAS LAS(
    .out        (out_las    ),
    .in         (in_las     ),
    .en         (en_las     )
);
P1_DEC_RAS RAS(
    .out        (out_ras    ),
    .in         (in_ras     ),
    .en         (en_ras     )
);

    initial begin
        $display("a = 5'b10100");

        $display("Left Logical Shifter");
        #100    {in_lls, en_lls} = 4'b0011;  #100    $display("a << 1 = %b", out_lls);
        #100    {in_lls, en_lls} = 4'b0101;  #100    $display("a << 2 = %b", out_lls);
        #100    {in_lls, en_lls} = 4'b0111;  #100    $display("a << 3 = %b", out_lls);
        #100    {in_lls, en_lls} = 4'b1001;  #100    $display("a << 4 = %b", out_lls);
        #100    {in_lls, en_lls} = 4'b1011;  #100    $display("a << 5 = %b", out_lls);
        
        $display("Right Logical Shifter");
        #100    {in_rls, en_rls} = 4'b0011;  #100    $display("a >> 1 = %b", out_rls);
        #100    {in_rls, en_rls} = 4'b0101;  #100    $display("a >> 2 = %b", out_rls);
        #100    {in_rls, en_rls} = 4'b0111;  #100    $display("a >> 3 = %b", out_rls);
        #100    {in_rls, en_rls} = 4'b1001;  #100    $display("a >> 4 = %b", out_rls);
        #100    {in_rls, en_rls} = 4'b1011;  #100    $display("a >> 5 = %b", out_rls);
        
        $display("Left Arithmetic Shifter");
        #100    {in_las, en_las} = 4'b0011;  #100    $display("a <<< 1 = %b", out_las);
        #100    {in_las, en_las} = 4'b0101;  #100    $display("a <<< 2 = %b", out_las);
        #100    {in_las, en_las} = 4'b0111;  #100    $display("a <<< 3 = %b", out_las);
        #100    {in_las, en_las} = 4'b1001;  #100    $display("a <<< 4 = %b", out_las);
        #100    {in_las, en_las} = 4'b1011;  #100    $display("a <<< 5 = %b", out_las);
        
        $display("Right Arithmetic Shifter");
        #100    {in_ras, en_ras} = 4'b0011;  #100    $display("a >>> 1 = %b", out_ras);
        #100    {in_ras, en_ras} = 4'b0101;  #100    $display("a >>> 2 = %b", out_ras);
        #100    {in_ras, en_ras} = 4'b0111;  #100    $display("a >>> 3 = %b", out_ras);
        #100    {in_ras, en_ras} = 4'b1001;  #100    $display("a >>> 4 = %b", out_ras);
        #100    {in_ras, en_ras} = 4'b1011;  #100    $display("a >>> 5 = %b", out_ras);
    end

endmodule
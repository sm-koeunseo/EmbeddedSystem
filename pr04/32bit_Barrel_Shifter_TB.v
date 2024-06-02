`include "define.h"

module TestBench32();

    reg                 BS_DIR;
    reg [`SWIDTH-1:0]   BS_AMT;
    reg [`IWIDTH-1:0]   D_IN;
    wire [`IWIDTH-1:0]  D_OUT;
    integer             index;

    Barrel_Shifter bs(BS_DIR, BS_AMT, D_IN, D_OUT);

    initial begin
        BS_DIR <= 1;
        $display("1. Shift-Right Operation Test with msb 0");
        D_IN <= 32'b0100_0000_0000_0000_0000_0000_0000_0000;

        for (index=6'b0; index<6'b100000; index=index+6'b000001) begin
            BS_AMT <= index[4:0];
            #10;
            $display("shift-right with amount %d is %b", BS_AMT, D_OUT);
        end
        
        $display("2. Shift-Right Operation Test with msb 1");
        D_IN <= 32'b1000_0000_0000_0000_0000_0000_0000_0000;

        for (index=6'b0; index<6'b100000; index=index+6'b000001) begin
            BS_AMT <= index[4:0];
            #10;
            $display("shift-right with amount %d is %b", BS_AMT, D_OUT);
        end

        
        BS_DIR <= 0;
        $display("1. Shift-Left Operation Test");
        D_IN <= 32'b0000_0000_0000_0000_0000_0000_0000_0001;

        for (index=6'b0; index<6'b100000; index=index+6'b000001) begin
            BS_AMT <= index[4:0];
            #10;
            $display("shift-left with amount %d is %b", BS_AMT, D_OUT);
        end

        $stop;
    end

endmodule
`include "define.h"

module TestBench4();

    reg BS_DIR;
    reg [`SWIDTH-1:0] BS_AMT;
    reg [`IWIDTH-1:0] D_IN;
    wire [`IWIDTH-1:0] D_OUT;

    Barrel_Shifter bs(BS_DIR, BS_AMT, D_IN, D_OUT);

    initial begin
        // left shift
        BS_DIR <= 0;
        D_IN <= 4'b1111;

        BS_AMT <= 2'b11;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b01;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b10;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;
        
        BS_AMT <= 2'b00;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        // right shift with 1
        BS_DIR <= 1;
        D_IN <= 4'b1011;

        BS_AMT <= 2'b11;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b01;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b10;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;
        
        BS_AMT <= 2'b00;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        // right shift with 0
        BS_DIR <= 1;
        D_IN <= 4'b0010;

        BS_AMT <= 2'b11;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b01;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        BS_AMT <= 2'b10;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;
        
        BS_AMT <= 2'b00;
        #5;
        $display("%b, %b", BS_AMT, D_OUT);
        #5;

        $stop;
    end

endmodule
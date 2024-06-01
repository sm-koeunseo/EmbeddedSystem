`include "define.h"

module TestBench();

    reg signed [(`WIDTH-1):0] A, B;
    wire [(`WIDTH*2-1):0] C;

    Mult CompToTest(A, B, C);

    reg signed [(`WIDTH-1):0] i, j;

    initial begin
        // for (i=-(2**(`WIDTH-1)); i<(2**(`WIDTH-1)); i=i+1) begin
        //     for (j=-(2**(`WIDTH-1)); j<(2**(`WIDTH-1)); j=j+1) begin
        //         A <= i;
        //         B <= j;
        //         #10;
        //         $display("%b * %b = %b", A, B, C);
        //     end
        // end
        for (i={(`WIDTH-1){1'b0}}; i<={(`WIDTH-1){1'b1}}; i=i+1'b1) begin
            for (j={(`WIDTH-1){1'b0}}; j+i<={(`WIDTH-1){1'b1}}; j=j+1'b1) begin
                A <= i;
                B <= j;
                #10;
                $display("%b * %b = %b", A, B, C);
            end
        end
    end

endmodule

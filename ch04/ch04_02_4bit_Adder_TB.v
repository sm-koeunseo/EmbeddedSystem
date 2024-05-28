`include "define.h"

module Ch04_02_Testbenth();

    reg [(`WIDTH-1):0] A;
    reg [(`WIDTH-1):0] B;
    reg Ci;
    wire [(`WIDTH-1):0] S;
    wire Co;

    reg [4:0] i, j;

    Beh_Add4 CompToTest(A, B, Ci, S, Co);

    initial begin
        for (i=4'b0000; i<=4'b1111; i=i+4'b0001) begin
            for (j=4'b0000; i+j<=4'b1111; j=j+4'b0001) begin
                A <= i;
                B <= j;
                Ci <= 0;
                $display("%b + %b + %b = %b", A, B, Ci, S);
                #10;
                Ci <= 1;
                $display("%b + %b + %b = %b", A, B, Ci, S);
                #10;
            end
        end
        $stop;
    end
endmodule
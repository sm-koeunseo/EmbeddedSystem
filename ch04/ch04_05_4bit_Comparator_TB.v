`include "define.h"

module Testbench();

    reg [(`WIDTH-1):0] A;
    reg [(`WIDTH-1):0] B;
    wire Gt, Eq, Lt;

    Beh_Comp CompToTest(A, B, Gt, Eq, Lt);

    initial begin
        // Both A and B are Positive
        A <= 4'b0010; B <= 4'b0001;     // A > B
        #10 A <= 4'b0001; B <= 4'b0010; // A < B
        #10 A <= 4'd3; B <= 4'd3;       // A == B
        
        // Both A and B are negative
        #10 A <= 4'b1111; B <= 4'b1110; // A > B
        #10 A <= 4'b1110; B <= 4'b1111; // A < B
        #10 A <= -4'd3; B <= -4'd3;     // A == B

        //A is positive and B is negative
        #10 A <= 4'b0001; B <= 4'b1111; // A > B

        // A is negative and A is positive
        #10 A <= 4'b1111; B <= 4'b0001; // A < B
    end

endmodule
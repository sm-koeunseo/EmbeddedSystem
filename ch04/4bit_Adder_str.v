`timescale 1ns / 1ns

module ST_Add4(A, B, Ci, S, Co);

    input [3:0] A, B;
    input Ci;
    output [3:0] S;
    output Co;

    wire N1, N2, N3;

    FA1 ADD4_0 (A[0], B[0], Ci, N1, S[0]);
    FA1 ADD4_1 (A[1], B[1], N1, N2, S[1]);
    FA1 ADD4_2 (A[2], B[2], N2, N3, S[2]);
    FA1 ADD4_3 (A[3], B[3], N3, Co, S[3]);

endmodule
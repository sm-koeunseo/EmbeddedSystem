`timescale 1ns / 1ns

module FA1(A, B, Ci, Co, S);

    input A, B, Ci;
    output Co, S;

    wire N1, N2, N3;

    xor Xor_1(S, A, B, Ci);
    and And_1(N1, A, Ci);
    and And_2(N2, B, Ci);
    and And_3(N3, A, B);
    or Or1(Co, N1, N2, N3);

endmodule
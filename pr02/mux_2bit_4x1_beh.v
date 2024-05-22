`timescale 1ns / 1ns

module Mux4_2b(A1, A0, B1, B0,
                C1, C0, D1, D0, 
                S1, S0, E1, E0);
    
    input A1, A0, B1, B0, C1, C0, D1, D0;
    input S1, S0;
    output E1, E0;
    reg E1, E0;

    always @* begin
        if (S1 == 0 && S0 == 0)
        begin
            E1 <= D1;
            E0 <= D0;
        end
        else if (S1 == 0 && S0 == 1)
        begin
            E1 <= C1;
            E0 <= C0;
        end
        else if (S1 == 1 && S0 == 0)
        begin
            E1 <= B1;
            E0 <= B0;
        end
        else
        begin
            E1 <= A1;
            E0 <= A0;
        end
    end

endmodule
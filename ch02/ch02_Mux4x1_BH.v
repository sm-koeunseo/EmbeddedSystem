`timescale 1ns / 1ns

module Mux4(I3, I2, I1, I0, S1, S0, D);
    
    input I3, I2, I1, I0;
    input S1, S0;
    output D;
    reg D;

    always @(I3, I2, I1, I0, S1, S0) begin  // @* => everything
        if (S1 == 0 && S0 == 0)
            D <= I0;
        else if (S1 == 0 && S0 == 1)
            D <= I1;
        else if (S1 == 1 && S0 == 0)
            D <= I2;
        else
            D <= I3;
    end

endmodule
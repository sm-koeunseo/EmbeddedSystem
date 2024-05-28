`timescale 1 ns/1 ns

module CodeDetector(S, R, G, B, U, Clk, Rst);

    input S;
    input R, G, B;
    output reg U;

    input Clk, Rst;

    // 각 state에 고유 번호 부여
    parameter S_Wait = 3'b000;
    parameter S_Start = 3'b001;
    parameter S_Red1 = 3'b010;
    parameter S_Blue = 3'b011;
    parameter S_Green = 3'b100;
    parameter S_Red2 = 3'b101;

    reg [2:0] State, StateNext;

    always @(posedge Clk) begin
        if (Rst == 1)
            State <= S_Wait;
        else
            State <= StateNext;
    end

    always @(State, S, R, G, B) begin
        case (State)
            S_Wait : begin
                U <= 0; // 생략?
                if (S == 1) // bit?
                    StateNext <= S_Start; // StateNext?
                else
                    StateNext <= S_Wait;
            end
            S_Start : begin
                U <= 0;
                if ((R&~B&~G) == 1)
                    StateNext <= S_Red1;
                else if ((B|G) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Start; // 생략?? 
            end
            S_Red1 : begin
                U <= 0;
                if ((~R&B&~G) == 1)
                    StateNext <= S_Blue;
                else if ((R|G) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Red1;
            end
            S_Blue : begin
                U <= 0;
                if (~R&~B&G == 1)
                    StateNext <= S_Green;
                else if (R|B == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Blue;
            end
            S_Green : begin
                U <= 0;
                if (R&~B&~G == 1)
                    StateNext <= S_Red2;
                else if (B|G == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Green;
            end
            S_Red2 : begin
                U <= 1;
                StateNext <= S_Wait;
            end
            default : begin
                U <= 1;
                StateNext <= S_Wait;
            end
        endcase
    end


endmodule
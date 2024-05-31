`timescale 1 ns/1 ns

module CodeDetector(S, R, G, B, U, Clk, Rst);

    input S, R, G, B;
    output reg U;

    input Clk, Rst;

    // 각 state에 고유 번호 부여
    parameter S_Wait = 3'b000,
              S_Start = 3'b001,
              S_Red1 = 3'b010,
              S_Blue = 3'b011,
              S_Green = 3'b100,
              S_Red2 = 3'b101;

    reg [2:0] State, StateNext;

    always @(posedge Clk) begin
        if (Rst == 1)
            State <= S_Wait;
        else
            State <= StateNext;
    end

    always @(State, S, R, G, B) begin
        U = 0;
        case (State)
            S_Wait : begin
                if (S == 1)
                    StateNext <= S_Start;
                else
                    StateNext <= S_Wait;
            end
            S_Start : begin
                if ((R&~B&~G) == 1)
                    StateNext <= S_Red1;
                else if ((B|G) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Start;
            end
            S_Red1 : begin
                if ((~R&B&~G) == 1)
                    StateNext <= S_Blue;
                else if ((R|G) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Red1;
            end
            S_Blue : begin
                if ((~R&~B&G) == 1)
                    StateNext <= S_Green;
                else if ((R|B) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Blue;
            end
            S_Green : begin
                if ((R&~B&~G) == 1)
                    StateNext <= S_Red2;
                else if ((B|G) == 1)
                    StateNext <= S_Wait;
                else
                    StateNext <= S_Green;
            end
            S_Red2 : begin
                U <= 1;
                StateNext <= S_Wait;
            end
            default : begin
                StateNext <= S_Wait;
            end
        endcase
    end


endmodule
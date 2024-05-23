`timescale 1ns/1ns

module LaserTimer (B, X, Clk, Rst);

        input B;
        output reg X;
        input Clk, Rst;

        // 숫자를 대신 해주는 파라미터 값 (constant와 가까움)
        parameter S_Off = 0, S_On1 = 1;
        parameter S_On2 = 2, S_On3 = 3;

        // 내부 변수 (input도 output도 아님)
        reg [1:0] State, StateNext;

        // StateReg
        always @(posedge Clk) begin
            if (Rst == 1)
                State <= S_Off;
            else
                State <= StateNext;
        end

        // ComLogic
        always @(State, B) begin
            case(State)
                S_Off: begin
                    X <= 0;
                    if (B == 0)
                        StateNext <= S_Off;
                    else
                        StateNext <= S_On1;
                end
                S_On1 : begin
                    X <= 1;
                    StateNext <= S_On2;
                end
                S_On2 : begin
                    X <= 1;
                    StateNext <= S_On3;
                end
                S_On3 : begin
                    X <= 1;
                    StateNext <= S_Off;
                end
            endcase
        end

        // Part Selection : boolean equation을 활용한 기법
        // always @(State, B) begin
        //     X <= State[1] | State[0];
        //     StateNext[1] <= (~State[1] & State[0]) | (State[1] & ~State[0]);
        //     StateNext[0] <= (~State[1] & ~State[0] & B) | (State[1] & ~State[0]);
        // end

endmodule
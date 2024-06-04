`timescale 1ns/1ns

module LaserTimer (B, X, Clk, Rst);

    input B, Clk, Rst;
    output reg X;
    parameter   S_Off = 1'b0,
                S_On = 1'b1;

    reg State;
    reg [1:0] Cnt;

    always @(posedge Clk) begin
        if (Rst == 1'b1) begin
            State <= S_Off;
            Cnt <= 2'b00;
        end
        else begin
            case (State)
                S_Off: begin
                    X <= 1'b0;
                    Cnt <= 2'b10;
                    if (B==1'b0)
                        State <= S_Off;
                    else
                        State <= S_On;
                end
                S_On: begin
                    X <= 1'b1;
                    if (Cnt == 2'b00)
                        State <= S_Off;
                    else begin
                        State <= S_On;
                        Cnt <= Cnt - 2'b01;
                    end
                end
            endcase
        end
    end

endmodule
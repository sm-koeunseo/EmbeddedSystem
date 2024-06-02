`include "define.h"

module SAD(Go, A_Addr, A_Data, B_Addr, B_Data, RW, En, Done, SAD_Out, Clk, Rst);

    input Go;                                   // testbench에서 시작을 알려주는 변수
    input [(`D_WIDTH-1):0] A_Data, B_Data;      // 값
    output reg [(`A_WIDTH-1):0] A_Addr, B_Addr; // 주소값
    output reg RW, En, Done;                    // R/W 구분, 활성화, testbench에서 끝을 알려주는 변수
    output reg [31:0] SAD_Out;                  // 결과값
    input Clk, Rst;

    // state 구분
    parameter S0 = 3'b000,  // wait
              S1 = 3'b001,  // start
              S2 = 3'b010,  // set address
              S3 = 3'b011,  // wait value load
              S3a = 3'b100, // get absdiff
              S4 = 3'b101;  // output value load

    reg [2:0] State;
    reg [31:0] Sum;
    integer I;

    // 차의 절대값 구하는 함수
    // 함수명이 곧 return 변수
    function [(`D_WIDTH-1):0] ABSDiff;
        input [(`D_WIDTH-1):0] A;
        input [(`D_WIDTH-1):0] B;
        if (A>B) ABSDiff = A-B;
        else ABSDiff = B-A;
    endfunction

    always @(posedge Clk) begin
        if (Rst==1'b1) begin
            A_Addr <= {`A_WIDTH{1'b0}}; // 초기화
            B_Addr <= {`A_WIDTH{1'b0}};
            RW <= 1'b0;
            En <= 1'b0;
            Done <= 1'b0;
            State <= S0;
            Sum <= 32'b0;
            SAD_Out <=32'b0;
            I <= 0;
        end
        else begin
            A_Addr <= {`A_WIDTH{1'b0}};
            B_Addr <= {`A_WIDTH{1'b0}};
            RW <= 1'b0;
            En <= 1'b0;
            Done <= 1'b0;
            SAD_Out <= 32'b0;

            case (State)
                S0 : begin
                    if (Go==1'b1)
                        State <= S1;
                    else
                        State <= S0;
                end
                S1 : begin
                    Sum <= 32'b0;
                    I <= 0;
                    State <= S2;
                end
                S2: begin
                    if (!(I==256)) begin
                        State <= S3a;
                        A_Addr <= I;
                        B_Addr <= I;
                        RW <= 1'b0;
                        En <= 1'b1;
                    end
                    else
                        State <= S4;
                end
                S3a:
                    State <= S3;
                S3: begin
                    Sum <= Sum + ABSDiff(A_Data, B_Data);
                    I <= I + 1;
                    State <= S2;
                end
                S4: begin
                    SAD_Out <= Sum;
                    Done <= 1'b1;
                    State <= S0;
                end
            endcase
        end
    end

endmodule
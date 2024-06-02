`include "define.h"

module testbench();

    reg Go;
    wire [(`D_WIDTH-1):0] A_Data, B_Data,
                          A_Di, B_Di;   // Sram에 input 없으니까 dumy data 생성
    wire [(`A_WIDTH-1):0] A_Addr, B_Addr;
    wire RW, En, Done;
    reg Clk, Rst_s, Rst_m;  // sram data reset 안하기 떄문에 rst 변수 두개로 나눔
    wire [31:0] SAD_Out;

    parameter ClkPeriod = 20;

    SAD sad(Go, A_Addr, A_Data, B_Addr, B_Data, RW, En, Done, SAD_Out, Clk, Rst_s);
    Sram sadMemA(A_Di, A_Data, A_Addr, RW, En, Clk, Rst_m); // Rst_m => reset enable 안하는 reset
    Sram sadMemB(B_Di, B_Data, B_Addr, RW, En, Clk, Rst_m);

    // Clock Procedure
    always begin
        Clk <= 1'b0;    #(ClkPeriod/2);
        Clk <= 1'b1;    #(ClkPeriod/2);
    end

    // Initailize Arrays h -> 16진수로 읽어옴 (띄어쓰기/개행으로 구분)
    // initial이 한줄이면 begin/end 생략
    initial $readmemh("MemA.txt", sadMemA.Memory);
    initial $readmemh("MemB.txt", sadMemB.Memory);

    initial begin
        Rst_m <= 1'b0; Rst_s <= 1'b1; Go <= 1'b0;
        @(posedge Clk);
        Rst_s <= 1'b0; Go <= 1'b1;
        @(posedge Clk);
        Go <= 1'b0;
        @(posedge Clk);
        while (Done != 1'b1)    // 종료 flag
            @(posedge Clk);
        if (SAD_Out != 4)
            $display("SAD Failed with %d -- should equal to 4", SAD_Out);
        else
            $display("SAD is %d!", SAD_Out);
        $stop;
    end

endmodule
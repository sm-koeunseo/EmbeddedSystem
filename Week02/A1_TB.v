`timescale 1ns/1ps

// A1_DUT를 활용하여 test해 보기
module A1_TB;
    
    reg     s;
    reg     d0;
    reg     d1;

    wire    y;

// A1_DUT를 호출하여 test bench 진행
A1_DUT            dut(
    .y      (y  ),
    .s      (s  ),
    .d1     (d1  ),
    .d0     (d0  ));

    initial begin
        // initial, 아래로 진리표 순서대로 적용하기
        s   = 1'b0;
        d1  = 1'b0;
        d0  = 1'b0;

        #100
        s   = 1'b0;
        d1  = 1'b0;
        d0  = 1'b1;

        #100
        s   = 1'b0;
        d1  = 1'b1;
        d0  = 1'b0;

        #100
        s   = 1'b0;
        d1  = 1'b1;
        d0  = 1'b1;

        #100
        s   = 1'b1;
        d1  = 1'b0;
        d0  = 1'b0;

        #100
        s   = 1'b1;
        d1  = 1'b0;
        d0  = 1'b1;

        #100
        s   = 1'b1;
        d1  = 1'b1;
        d0  = 1'b0;

        #100
        s   = 1'b1;
        d1  = 1'b1;
        d0  = 1'b1;

        #100
        $finish;
    end

endmodule
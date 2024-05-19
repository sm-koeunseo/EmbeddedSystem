`timescale 1ns/1ps  // 시간 설정, 추후에 나올 #~에 대해 ns 단위를 적용하고 wave에서는 ps 단위로 결과값을 나타냄

module P1_TB;

    // 테스트에서 활용할 input과 output 선언
    reg     Door;
    reg     Ignition;
    reg     SeatBelt;

    wire    Alarm;

// P1_DUT.v 파일의 P1_DUT를 호출한다. 이 때 각 input과 output에 대응하는 변수들을 대입
P1_DUT        dut(
    .Alarm          (Alarm      ),
    .Door           (Door       ),
    .Ignition       (Ignition   ),
    .SeatBelt       (SeatBelt   ));

    initial begin
        // Initial
        Door        = 1'b0;
        Ignition    = 1'b0;
        SeatBelt    = 1'b0;

        // Ignition
        #100;   // 100ns 대기
        Door        = 1'b0; // 1bit binary에 0 대입
        Ignition    = 1'b1; // 1bit binary에 1 대입
        SeatBelt    = 1'b0;

        // Ready to drive
        #100
        Door        = 1'b1;
        Ignition    = 1'b1;
        SeatBelt    = 1'b1;

        // Warning
        #100
        Door        = 1'b1;
        Ignition    = 1'b1;
        SeatBelt    = 1'b0;
        #100
        $finish;
    end

    // debug or display
    always @(posedge Alarm) begin
        if(dut.DoorOpened == 1) begin
            $display("====================\n");
            $display("[Warning] Door is opened!\n");
            $display("====================\n");
        end else if (dut.NoSeatBelt == 1) begin
            $display("====================\n");
            $display("[Warning] Please fasten your seatbelt!\n");
            $display("====================\n");
        end
    end

endmodule
`timescale 1ns/1ps

module P1_TB;

    reg     Door;
    reg     Ignition;
    reg     SeatBelt;

    wire    Alarm;

carWarningSystem        dut(
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
        #100;
        Door        = 1'b0;
        Ignition    = 1'b1;
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
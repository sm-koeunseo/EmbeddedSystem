`timescale 1ns/1ns

module Testbench();

    reg B, Clk, Rst;
    wire X;
    reg [2:0] Index;

    LaserTimer laserTimer(B, X, Clk, Rst);

    always begin
      Clk <= 1'b0;
      #5;
      Clk <= 1'b1;
      #5;
   end

    initial begin
        Rst <= 1;
        B <= 0;
        @(posedge Clk);
        #5 if (X != 0)
            $display("%t: Reset failed", $time);
        Rst <= 0;
        @(posedge Clk);
        #5 B <= 1;
        @(posedge Clk);
           B <= 0;
        for(Index=3'b001;Index<3'b100;Index=Index+3'b001)
        begin
            #5 if (X != 1)
                $display("%t: #%d X=1 failed", $time, Index);
            @(posedge Clk);
            #5;
        end
        if(X != 0)
            $display("%t: Final X=0 failed", $time);
        $stop;
    end

endmodule
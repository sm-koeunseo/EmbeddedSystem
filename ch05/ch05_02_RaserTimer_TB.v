`include "define.h"

module testbench();

    reg B, Clk, Rst;
    wire X;

    parameter ClkPeriod = 20;
    integer Index;

    LaserTimer laserTimer(B, X, Clk, Rst);

    always begin
        Clk <= 1'b0;    #(ClkPeriod/2);
        Clk <= 1'b1;    #(ClkPeriod/2);
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
        
        @(posedge Clk);
        for(Index=2; Index>-1; Index=Index-1)
        begin
            #5 if (X != 1)
                $display("%t: #%d X=1 failed", $time, Index);
            @(posedge Clk);
            #5;
        end

        @(posedge Clk);
        #5;

        if(X != 0)
            $display("%t: Final X=0 failed", $time);
        $stop;

    end

endmodule
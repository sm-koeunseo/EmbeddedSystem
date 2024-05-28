`timescale 1 ns/1 ns

module Testbench();

    reg S, R, G, B, Clk, Rst;
    wire U;
    reg [15:0] Index; // 들어갈 수 있는 경우의 수 
    reg [15:0] Key;
    integer i;

    CodeDetector codeDetector(S, R, G, B, U, Clk, Rst);

    // clock 생성
    always begin
        Clk <= 0;
        #10;
        Clk <= 1;
        #10;
    end
    
    initial begin
        for(Index=16'h0000;Index<16'h1000;Index=Index+16'h0001)
        begin // 4,096 cases
            Rst = 1;
            S = 0;
            R = 0;
            G = 0;
            B = 0;
            @(posedge Clk);

            Rst = 0;
            S = 1;
            #5;
            if (U == 1)
                $display("Output is 1 when wait state!");
            @(posedge Clk);

            // start -> red1 -> blue -> green -> 
            for (i=0;i<12;i=i+3)
            begin
                R = Index[i+2];
                G = Index[i+1];
                B = Index[i];
                #5;
                if (U == 1)
                case (i)
                    0 : $display("Output is 1 when start state!");
                    3 : $display("Output is 1 when red1 state!");
                    6 : $display("Output is 1 when blue state!");
                    9 : $display("Output is 1 when green state!");
                endcase
                @(posedge Clk);
            end

            // red2 (Index = red2, green, blue, red1)
            if (U == 1) begin
                if (Index == 16'b0000_100_010_001_100) begin
                    $display("#%d: %3b_%3b_%3b_%3b is correct!",Index, Index[11:9], Index[8:6], Index[5:3], Index[2:0]); 
	                Key <= Index;
                end
                else 
                     $display("#%d: Door opens with incorrect sequence - %3b_%3b_%3b_%3b",Index, Index[11:9], Index[8:6], Index[5:3], Index[2:0]);
            end
            else
                $display("#%d: %3b_%3b_%3b_%3b is incorrect!", Index, Index[11:9], Index[8:6], Index[5:3], Index[2:0]);
        
            @(posedge Clk);
        end

        $display("#%d: %3b_%3b_%3b_%3b is correct!",Key, Key[11:9], Key[8:6], Key[5:3], Key[2:0]); 
        $stop;
    end

endmodule
`timescale 1ns/1ps

module A2_TB;

    reg     s1;
    reg     s0;
    reg     d0;
    reg     d1;
    reg     d2;
    reg     d3;

    wire    y;


A2_DUT          dut(
    .y      (y  ),
    .s1     (s1 ),
    .s0     (s0 ),
    .d0     (d0 ),
    .d1     (d1 ),
    .d2     (d2 ),
    .d3     (d3 ));

    initial begin
        // initial
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D0 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b0;
        d0  = 1'b1;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D0 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b1;
        d0  = 1'b1;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D0 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b1;
        d0  = 1'b1;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D0 right
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b1;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D0 don't care
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b1;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b0;

        // D0 don't care
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b1;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b1;
        
        // D0 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b0;
        d0  = 1'b1;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D1 right
        #100
        s1  = 1'b0;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D1 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D1 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D1 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b1;
        d2  = 1'b0;
        d3  = 1'b0;
        
        // D2 right
        #100
        s1  = 1'b1;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b1;
        d3  = 1'b0;
        
        // D2 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b1;
        d3  = 1'b0;
        
        // D2 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b1;
        d3  = 1'b0;
        
        // D2 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b1;
        d3  = 1'b0;
        
        // D3 right
        #100
        s1  = 1'b1;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b1;
        
        // D3 wrong
        #100
        s1  = 1'b1;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b1;
        
        // D3 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b1;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b1;
        
        // D3 wrong
        #100
        s1  = 1'b0;
        s0  = 1'b0;
        d0  = 1'b0;
        d1  = 1'b0;
        d2  = 1'b0;
        d3  = 1'b1;

        #100
        $finish;
    end

endmodule
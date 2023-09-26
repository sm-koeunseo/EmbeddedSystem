// Test Bench for 4:1 MUXs

`timescale 1ns/1ps

module A2_MUX_TB;
    wire    [2:0]   y;
    reg     [3:0]   d;
    reg     [1:0]   s;

    MUX4 mux4(
        .y      (y  ),
        .d      (d  ),
        .s      (s  )
    );

    integer     i;
    initial begin
        $display("====================");
        $display("4:1 MUX using 2 of 2:1 MUX");
        $display("====================");

        for (i=0; i<4; i=i+1) begin
            #100
            s[1] = i / 2;
            s[0] = i % 2;

            $display("select value : %b", s);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b0111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
            #100    {d[3], d[2], d[1], d[0]} = 4'b1111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d[3], d[2], d[1], d[0], y[2]);
        end
    #100    $finish;
    end

endmodule
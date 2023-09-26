// Test Bench for 4:1 MUXs

`timescale 1ns/1ps

module P1_MUX4_TB;

    wire        y_if;
    reg         d0_if;
    reg         d1_if;
    reg         d2_if;
    reg         d3_if;
    reg [1:0]   s_if;

    wire        y_case;
    reg         d0_case;
    reg         d1_case;
    reg         d2_case;
    reg         d3_case;
    reg [1:0]   s_case;

    P1_MUX_if_DUT u0_mux4_if(
        .y          (y_if   ),
        .d0         (d0_if  ),
        .d1         (d1_if  ),
        .d2         (d2_if  ),
        .d3         (d3_if  ),
        .s          (s_if   )
    );

    P1_MUX_case_DUT u0_mux4_case(
        .y          (y_case ),
        .d0         (d0_case),
        .d1         (d1_case),
        .d2         (d2_case),
        .d3         (d3_case),
        .s          (s_case )
    );

    integer     i;
    initial begin
        $display("====================");
        $display("4:1 MUX using if");
        $display("====================");

        for (i=0; i<4; i=i+1) begin
            #100
            s_if[1] = i / 2;
            s_if[0] = i % 2;

            $display("select value : %b", s_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b0111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
            #100    {d3_if, d2_if, d1_if, d0_if} = 4'b1111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_if, d2_if, d1_if, d0_if, y_if);
        end

        $display("====================");
        $display("4:1 MUX using case");
        $display("====================");

        for (i=0; i<4; i=i+1) begin
            #100
            s_case[1] = i / 2;
            s_case[0] = i % 2;

            $display("select value : %b", s_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b0111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1000;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1001;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1010;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1011;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1100;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1101;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1110;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
            #100    {d3_case, d2_case, d1_case, d0_case} = 4'b1111;     #100    $display("D3: %d | D2: %d | D1: %d | D0: %d | Y: %d", d3_case, d2_case, d1_case, d0_case, y_case);
        end
        #100 $finish;
    end
endmodule
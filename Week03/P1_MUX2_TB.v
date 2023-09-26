// Test Bench for 2:1 MUXs

`timescale 1ns/1ps

module P1_MUX2_TB;

    wire            mux2_s_y;
    reg             mux2_s_d0;
    reg             mux2_s_d1;
    reg             mux2_s_s;

    wire    [3:0]   mux2_m_y;
    reg     [3:0]   mux2_m_d0;
    reg     [3:0]   mux2_m_d1;
    reg             mux2_m_s;

    P1_MUX_dataflow1 u0_mux2_dataflow(
        .y          (mux2_s_y   ),
        .d0         (mux2_s_d0  ),
        .d1         (mux2_s_d1  ),
        .s          (mux2_s_s   )
    );

    P1_MUX_dataflow2 u0_mux2_dataflow_multibit(
        .y          (mux2_m_y   ),
        .d0         (mux2_m_d0  ),
        .d1         (mux2_m_d1  ),
        .s          (mux2_m_s   )
    );

    integer     i, err;
    initial begin
        $display("====================");
        $display("2:1 MUX (1-bit)");
        $display("====================");
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b000;    #100    $display(" Expected:0, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b001;    #100    $display(" Expected:0, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b010;    #100    $display(" Expected:1, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b011;    #100    $display(" Expected:1, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b100;    #100    $display(" Expected:0, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b101;    #100    $display(" Expected:1, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b110;    #100    $display(" Expected:0, H/W Output: %b", mux2_s_y);
        #100    {mux2_s_s, mux2_s_d0, mux2_s_d1} = 3'b111;    #100    $display(" Expected:1, H/W Output: %b", mux2_s_y);
        
        $display("====================");
        $display("2:1 MUX (4-bit)");
        $display("====================");
        err = 0;
        for (i=0; i<100; i=i+1) begin
            #100;
            mux2_m_s    = i % 2;
            mux2_m_d0   = $urandom%15;  // mux2_m_d0 = 0 ~ 15
            mux2_m_d1   = $urandom%15;  // mux2_m_d1 = 0 ~ 15
            #100

            $display("Index [%2d] | SEL: %b | D0: %d | D1: %d | Y: %d", i, mux2_m_s, mux2_m_d0, mux2_m_d1, mux2_m_y);
            if( (mux2_m_s == 0) && (mux2_m_y != mux2_m_d0) ) begin
                err = err + 1;
            end
            if( (mux2_m_s == 1) && (mux2_m_y != mux2_m_d1) ) begin
                err = err + 1;
            end
        end
        $display("Total Error Count: %d", err);
        #100    $finish;
    end
    
endmodule
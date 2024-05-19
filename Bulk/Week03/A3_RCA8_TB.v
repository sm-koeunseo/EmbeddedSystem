// Test Bench for 8-bit Ripple Carry Adder

`timescale 1ns/1ps

module A3_RCA_TB;
    wire    [7:0]   s;
    wire            co;
    reg     [7:0]   a;
    reg     [7:0]   b;
    reg             ci;

    A3_RCA8 rca(
        .s          (s  ),
        .co         (co ),
        .a          (a  ),
        .b          (b  ),
        .ci         (ci )
    );

    integer     i, err;
    initial begin
        $display("====================");
        $display("8-bit Ripple Carry Adder");
        $display("====================");
        err = 0;
        ci  = 1'b0;
        #100
        for (i=0; i<100; i=i+1) begin
            a   = $urandom%256;  // a = 0 ~ 255
            b   = $urandom%256;  // b = 0 ~ 255
            
            #100
            $display("Index [%2d] | a: %d | b: %d | S: %d | c: %b", i, a, b, s, co);
        end
        #100    $finish;
    end
    
endmodule
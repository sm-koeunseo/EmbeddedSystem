// 4:1 Multiplexer (case)

module P1_MUX_case_DUT(
    output  reg     y,
    input           d0,
    input           d1,
    input           d2,
    input           d3,
    input   [1:0]   s
);

    always @(*) begin
        case(s)
            2'b00:      y = d0;
            2'b01:      y = d1;
            2'b10:      y = d2;
            2'b11:      y = d3;
        endcase
    end

endmodule
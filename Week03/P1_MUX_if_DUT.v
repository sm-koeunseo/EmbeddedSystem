//

module P1_MUX_if_DUT(
    output  reg     y,
    input           d0,
    input           d1,
    input           d2,
    input           d3,
    input   [1:0]   s
);

    always @(*) begin
        if          (s == 2'b00) begin
            y = d0;
        end else if (s == 2'b01) begin
            y = d1;
        end else if (s == 2'b10) begin
            y = d2;
        //end else if (s == 2'b11) begin
        end else begin
            y = d3;
        end
    end

endmodule
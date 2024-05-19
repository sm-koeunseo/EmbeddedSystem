// 2:4 Decoder using Behavior

module P1_DEC_behavior(
    output  reg     [3:0]   out,
    input           [1:0]   in,
    input                   en
);

    always @(*) begin
        if  (en == 1'b1)    begin
            case(in)
                2'b00:  out = 4'b0001;
                2'b01:  out = 4'b0010;
                2'b10:  out = 4'b0100;
                2'b11:  out = 4'b1000;
            endcase
        end else            begin
            out = 4'd0;
        end
    end

endmodule
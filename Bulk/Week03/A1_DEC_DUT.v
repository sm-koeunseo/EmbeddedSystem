// 3:8 Decoder dataflow, behavior, except enable

module A1_DEC_dataflow(
    output      [7:0]   out,    // output 8bit
    input       [2:0]   in,     // input 3bit
    input               en      // enable
);
    // dataflow (shift 이용)
    assign  out = (en == 1'b1) ? (8'd1 << in) : 8'd0;

endmodule


module A1_DEC_behavior(
    output  reg    [7:0]   out,
    input          [2:0]   in,
    input                  en
);

    // behavior (case 이용, 명시적)
    always @(*) begin
        if  (en == 1'b1)    begin
            case(in)
                3'b000:  out = 8'b00000001;
                3'b001:  out = 8'b00000010;
                3'b010:  out = 8'b00000100;
                3'b011:  out = 8'b00001000;
                3'b100:  out = 8'b00010000;
                3'b101:  out = 8'b00100000;
                3'b110:  out = 8'b01000000;
                3'b111:  out = 8'b10000000;
            endcase
        end else            begin
            out = 8'd0;
        end
    end

endmodule

// enable 뺀 버전
module A1_DEC(
    output      [7:0]   out,
    input       [2:0]   in
);

    assign  out = 8'd1 << in;

endmodule
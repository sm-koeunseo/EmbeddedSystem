// 1-bit Full Adder (Description: behavior 2)

module P1_FA_behavior2(
    output  reg     s,   // sum
    output  reg     co,  // carry out
    input           a,   // input a
    input           b,   // input b
    input           ci   // carry in
);

    always @(*) begin
        case({ci, a, b})
            3'b000: {co, s} = 2'b00;
            3'b001: {co, s} = 2'b01;
            3'b010: {co, s} = 2'b10;
            3'b011: {co, s} = 2'b11;
            3'b100: {co, s} = 2'b00;
            3'b101: {co, s} = 2'b01;
            3'b110: {co, s} = 2'b10;
            3'b111: {co, s} = 2'b11;
        endcase
    end
    
endmodule
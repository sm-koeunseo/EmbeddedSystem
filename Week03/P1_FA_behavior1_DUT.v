// 1-bit Full Adder (Description: behavior 1)

module P1_FA_behavior1(
    output  reg     s,   // sum
    output  reg     co,  // carry out
    input           a,   // input a
    input           b,   // input b
    input           ci   // carry in
);

    always @(*) begin
        s   = (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
        co  = (a & b) + (b & ci) + (a & ci);    //  부울식
        // {co, s} = a + b + ci // 간결식
    end
    
endmodule
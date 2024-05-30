// TB : ch04_08

`include "define.h"

module RegFile(R_Addr, W_Addr, R_en, W_en, R_Data, W_Data, Clk, Rst);

    input [(`A_WIDTH-1):0] R_Addr, W_Addr;
    input R_en, W_en;
    output reg [(`D_WIDTH-1):0] R_Data;
    input [(`D_WIDTH-1):0] W_Data;
    input Clk, Rst;

    reg [(`D_WIDTH-1):0] RegFile [0:(2**`A_WIDTH-1)],   // 왜 0이 먼저??
                        RegFile_Next [0:(2**`A_WIDTH-1)];

    integer Index;

    // Reg
    always @(posedge Clk) begin
        if (Rst == 1'b1)
            for(Index=0; Index<(2**`A_WIDTH);Index=Index+1)
                RegFile[Index] <= {`D_WIDTH{1'b0}};
        else
            for(Index=0; Index<(2**`A_WIDTH);Index=Index+1)
                RegFile[Index] <= RegFile_Next[Index];
    end

    // CombLogic - Write Operation
    always @* begin
        for(Index=0; Index<(2**`A_WIDTH);Index=Index+1)
                RegFile_Next[Index] <= RegFile[Index];
        
        if(W_en == 1'b1)
            RegFile_Next[W_Addr] <= W_Data;
    end

    // CombLogic - Read Operation
    always @* begin
        if (R_en == 1'b1)
            R_Data <= RegFile[R_Addr];
        else
            R_Data <= {`D_WIDTH{1'bZ}};
    end

endmodule
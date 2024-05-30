`include "define.h"

module TestBench();

    reg [(`A_WIDTH-1):0] R_Addr, W_Addr;
    reg R_en, W_en;
    wire [(`D_WIDTH-1):0] R_Data;
    reg [(`D_WIDTH-1):0] W_Data;
    reg Clk, Rst;

    integer Index;

    RegFile CompToTest (R_Addr, W_Addr, R_en, W_en, R_Data, W_Data, Clk, Rst);

    // Clock Procedure
    always begin
        Clk <= 1'b0;
        #10;
        Clk <= 1'b1;
        #10;
    end

    // Vector Procedure
    initial begin
        Rst <= 1'b1;
        R_Addr <= {`A_WIDTH{1'b0}}; W_Addr <= {`A_WIDTH{1'b0}};
        R_en <= 1'b0; W_en <= 1'b0;
        @(posedge Clk);
        #5 Rst <= 1'b0;
        @(posedge Clk);
        #5;

        // Write Values to registers
        for (Index=0; Index<(2**`A_WIDTH);Index=Index+1) begin
            W_Addr <= Index; W_Data <= Index;
            W_en <= 1'b1;
            @(posedge Clk);
            #5;
        end
        W_en <= 1'b0;
        
        // Check for correct read values from registers
        for (Index=0; Index<(2**`A_WIDTH);Index=Index+1) begin
            R_Addr <= Index; R_en <= 1'b1;
            @(posedge Clk);
            #5;
            if (R_Data !== Index)
                $display("Failed case %d.", Index);
        end
        R_en <= 1'b0;
        #5;
        if(R_Data != {`D_WIDTH{1'bZ}})
            $display("Failed no read case.");
        $stop;
    end

endmodule
`timescale 1 ns/1 ns

module Testbench();
    
   reg X_s;
   wire F_s;

   Inv CompToTest(X_s, F_s);
   
   initial begin
      // Test all possible input combinations    
      X_s <= 0; #10;
      X_s <= 1; #10;
   end

endmodule

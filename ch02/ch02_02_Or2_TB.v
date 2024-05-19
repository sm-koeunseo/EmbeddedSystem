`timescale 1 ns/1 ns

module Testbench();
    
   reg X_s, Y_s;
   wire F_s;

   Or2 CompToTest(X_s, Y_s, F_s);
   
   initial begin
      // Test all possible input combinations    
      Y_s <= 0; X_s <= 0;
      #10 Y_s <= 0; X_s <= 1;
      #10 Y_s <= 1; X_s <= 0;
      #10 Y_s <= 1; X_s <= 1;
   end

endmodule

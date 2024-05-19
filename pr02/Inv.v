`timescale 1 ns/1 ns

module Inv(X, F);
    
   input X;
   output F;
   reg F;

   always @(X) begin
	   F <= ~X;
   end				    

endmodule

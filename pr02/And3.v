`timescale 1 ns/1 ns

module And3(X, Y, Z, F);
    
   input X, Y, Z;
   output F;
   reg F;

   always @(X, Y, Z) begin
	   F <= X & Y & Z;
   end				 

endmodule

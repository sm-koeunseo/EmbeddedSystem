`timescale 1 ns/1 ns

module Or4(W, X, Y, Z, F);
    
   input W, X, Y, Z;
   output F;
   reg F;

   always @(W, X, Y, Z) begin
	   F <= W | X | Y | Z;
   end				 

endmodule

//------------------------------
// Module name: clk_div
// Function: General clock divider
// Creator:  Peter Cheung
// Version:  1.0
// Date:     20 Jan 2014
//------------------------------

module clk_div (clkin, tc, clkout);

	parameter	BIT_SZ = 21;

	input				clkin;	// 50MHz input clock from DE0
	input [BIT_SZ-1:0]	tc;		// Time constant - output freq = 1/((tc+1)*2*20ns
	output			clkout;	// Divided clock - square output

	reg				clkout;
	reg [BIT_SZ-1:0]		ctr;		// internal counter
	initial begin
		clkout = 0;			// don't need to reset - don't care if it is 1 or 0 to start
		ctr = 0;		//  ... to start.  Initialise to make simulation easier
	end
		
	always @ (posedge clkin)   // 
	  if (ctr==0) begin
		  ctr <= tc;
		  clkout <= ~clkout; // toggle the output clock for squarewave
		end
	  else
		  ctr <= ctr - 1'b1;
		  
endmodule

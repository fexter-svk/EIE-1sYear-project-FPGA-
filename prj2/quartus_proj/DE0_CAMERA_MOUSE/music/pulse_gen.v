//------------------------------
// Module name: pulse_gen (Moore)
// Function: Generate one clock pulse on +ve edge of input
// Creator:  Peter Cheung
// Version:  1.0
// Date:     29 Jan 2014
//------------------------------

module pulse_gen(pulse, in, clk);

	output 			pulse;	// output pulse lasting one clk cycle
	input 			in;		// input, +ve edge to be detected
	input 			clk;		// clock signal

	reg [1:0]	state;
	reg	pulse;
	
	parameter	IDLE = 2'b0;	// state coding for IDLE state
	parameter	IN_HIGH = 2'b01;
	parameter	WAIT_LOW = 2'b10;  
	
	initial state = IDLE;
	
	always @ (posedge clk) 
		begin	
			pulse <= 0;		 // default output
			case (state)
			IDLE: 	if (in == 1'b1) begin
							state <= IN_HIGH;	pulse <= 1'b1; end
						else 
							state <= IDLE; 
			IN_HIGH: if (in == 1'b1) 
							state <= WAIT_LOW;
						else 
							state <= IDLE; 
			WAIT_LOW: if (in == 1'b1) 
							state <= WAIT_LOW;
						 else  
							state <= IDLE;
			default: ;
			endcase
		end			//... always
endmodule

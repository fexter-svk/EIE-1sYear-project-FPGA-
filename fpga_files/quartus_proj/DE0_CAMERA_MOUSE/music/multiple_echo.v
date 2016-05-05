//------------------------------
// Module name: allpass processor
// Function: Simply to pass input to output
// Creator:  Affan & Pavol
// Version:  1.1
// Date:     10 Dec 2015
//------------------------------

module processor (sysclk, data_in, data_valid, data_out,volume);

		input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input 			data_valid;
	output [9:0] 	data_out;	// 10-bit output data
	input [7:0]    volume;
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;
	wire 				pulse;
	wire 				d; // wire from full output to flip flop
	reg				ff_out; // output from flip flop to and gate
	wire 				and_out; // output from and gate to rdreq FIFO input
	wire [9:0]		q; // output from FIFO to atenuator
	wire [9:0]		att_q; // attenuated output from FIFO

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	
	pulse_gen pulse_gen(pulse, data_valid, sysclk);
	
	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	//assign y = (x * volume);
	
	FIFO FIFO (
	.clock(sysclk),
	.data(y),
	.rdreq(and_out),
	.wrreq(pulse),
	.full(d),
	.q(q));
	
	assign and_out = pulse && ff_out;
	
	assign att_q[8:0] = q[9:1];
	assign att_q[9] = q[9];
	
	//assign y = x - att_q;
	
	assign y = (x * volume) - att_q;
	
	
	

	//  Now clock y output with system clock
	always @(posedge sysclk) begin
		data_out <=  y + DAC_OFFSET;
		
		ff_out <= d;
		
	end
		
endmodule
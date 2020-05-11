`default_nettype none
module demo_01_impl (input wire clock);
	wire reset;
	wire a, b;

	//     01234567890123456789
	seq #("-_____-____-________") seq_r (clock, reset);
	seq #("_--___-___-______-__") seq_a (clock, a);
	seq #("__--__-__________-__") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	// in the cycle after a, b must be high
	assert property (a |=> b);
endmodule

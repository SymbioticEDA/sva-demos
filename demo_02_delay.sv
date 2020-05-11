`default_nettype none
module demo_02_delay (input wire clock);
	wire reset;
	wire a, b;

	//     0123456789012345678901
	seq #("-_____-_______________") seq_r (clock, reset);
	seq #("_-____-_______-_______") seq_a (clock, a);
	seq #("___-__-__________-____") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	// in any cycle when a is high, b must be high 1 to 2 cycles later
	assert property (a |-> ##[1:2] b);
endmodule

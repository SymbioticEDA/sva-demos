module demo_01_impl (input clock);
	wire reset;
	wire a, b;

    //     1234567890123456789012
	seq #("-_____-____-__________") seq_r (clock, reset);
	seq #("_-____-___-______-____") seq_a (clock, a);
	seq #("______-__________-____") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

    // in the cycle after a, b must be high
	assert property (a |=> b);
endmodule

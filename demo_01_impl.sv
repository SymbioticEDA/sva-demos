module demo_01_impl (input clock);
	wire reset;
	wire a, b;

	seq #("-_____-____-__________") seq_r (clock, reset);
	seq #("_-____-___-______-____") seq_a (clock, a);
	seq #("__-___-__________-____") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property (a |=> b);
endmodule

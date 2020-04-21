module demo_01_impl (input clock);
	wire reset;
	wire a, b;

	seq #("-_____________________") seq_r (clock, reset);
	seq #("_-____________________") seq_a (clock, a);
	seq #("__-___________________") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property (a |=> b);
endmodule

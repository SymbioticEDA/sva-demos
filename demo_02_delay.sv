module demo_02_delay (input clock);
	wire reset;
	wire a, b;

	seq #("-_____-_______________") seq_r (clock, reset);
	seq #("_-____-_______-_______") seq_a (clock, a);
	seq #("___-__-__________-____") seq_b (clock, b);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property (a |-> ##[1:2] b);
endmodule

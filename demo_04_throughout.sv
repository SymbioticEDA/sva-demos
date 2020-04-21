module demo_04_throughout (input clock);
	wire reset;
	wire a, b;

	//     01234567890123456789
	seq #("-________-__________") seq_r (clock, reset);
	seq #("_--____-____--______") seq_a (clock, a);
	seq #("__----__-____---_-__") seq_b (clock, b);
	seq #("__--_-______-_-_-___") seq_c (clock, c);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	// after a goes high, b must be high throughout 3 (not necessarily consecutive) cycles of c
	assert property ($rose(a) |=> (b throughout c[->3]));
endmodule

module demo_04_throughout (input clock);
	wire reset;
	wire a, b;

	seq #("-_______-___________") seq_r (clock, reset);
	seq #("_-____-____-________") seq_a (clock, a);
	seq #("__--___-____________") seq_b (clock, b);
	seq #("__---_______--______") seq_c (clock, c);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property ($rose(a) |=> (b throughout c[*2]));
endmodule


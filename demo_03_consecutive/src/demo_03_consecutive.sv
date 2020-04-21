module demo_03_consecutive (input clock);
	wire reset;
	wire a, b;

	seq #("-_______-___________") seq_r (clock, reset);
	seq #("_-____-____-________") seq_a (clock, a);
	seq #("__--___-_____--_____") seq_b (clock, b);
	seq #("____-__________-____") seq_c (clock, c);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property ($rose(a) |=> b[*2] ##1 c);
endmodule

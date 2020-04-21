module demo_03_consecutive (input clock);
	wire reset;
	wire a, b;

	seq #("-_______-___________") seq_r (clock, reset);
	seq #("_--___-_______-_____") seq_a (clock, a);
	seq #("__--___-________--__") seq_b (clock, b);
	seq #("____-_____________-_") seq_c (clock, c);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	assert property ($rose(a) |=> b[*2] ##1 c);
endmodule

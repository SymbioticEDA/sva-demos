`default_nettype none
module demo_03_consecutive (input wire clock);
	wire reset;
	wire a, b, c;

	//     01234567890123456789
	seq #("-_______-___________") seq_r (clock, reset);
	seq #("_--___-_______-_____") seq_a (clock, a);
	seq #("__--___-________--__") seq_b (clock, b);
	seq #("____-_____________-_") seq_c (clock, c);

	default clocking @(posedge clock); endclocking
	default disable iff (reset);

	// after a goes high, b must be high for 2 cycles followed 1 cycle later by c
	assert property ($rose(a) |=> b[*2] ##1 c);
endmodule

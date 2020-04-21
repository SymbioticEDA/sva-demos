module seq #(
	parameter [1023:0] seq = ""
) (
	input clock,
	output reg [3:0] dout
);
	localparam seqlen = $clog2(seq) / 8;

	integer cycle = 0;
	wire [31:0] position = seqlen - cycle;
	wire [7:0] ch = seq >> (8*position);

	always @(posedge clock) begin
		cycle <= cycle + 1;
	end
	
	always @* begin
		dout = 4'b xxxx;
		case (ch)
			"0", "_": dout = 0;
			"1": dout = 1;
			"2": dout = 2;
			"3": dout = 3;
			"4": dout = 4;
			"5": dout = 5;
			"6": dout = 6;
			"7": dout = 7;
			"8": dout = 8;
			"9": dout = 9;
			"A", "a": dout = 10;
			"B", "b": dout = 11;
			"C", "c": dout = 12;
			"D", "d": dout = 13;
			"E", "e": dout = 14;
			"F", "f", "-": dout = 15;
			"X", "x": dout = 4'b xxxx;
			"Z", "z": dout = 4'b zzzz;
		endcase
	end
endmodule

`default_nettype none
module seq #(
	parameter [1023:0] seq = "",
	parameter integer N = 1
) (
	input wire clock,
	output wire [N-1:0] dout
);
	localparam seqlen = $clog2(seq) / 8;

	integer cycle = 0;
	wire [31:0] position = seqlen - cycle;
	wire [7:0] ch = (seq >> (8*position)) & 255;

	always @(posedge clock) begin
		cycle <= cycle + 1;
	end
	
	reg [3:0] dout_reg;
	assign dout = dout_reg[N-1:0];

	always @* begin
		dout_reg = 4'b xxxx;
		case (ch)
			"0", "_": dout_reg = 0;
			"1": dout_reg = 1;
			"2": dout_reg = 2;
			"3": dout_reg = 3;
			"4": dout_reg = 4;
			"5": dout_reg = 5;
			"6": dout_reg = 6;
			"7": dout_reg = 7;
			"8": dout_reg = 8;
			"9": dout_reg = 9;
			"A", "a": dout_reg = 10;
			"B", "b": dout_reg = 11;
			"C", "c": dout_reg = 12;
			"D", "d": dout_reg = 13;
			"E", "e": dout_reg = 14;
			"F", "f", "-": dout_reg = 15;
			"X", "x": dout_reg = 4'b xxxx;
			"Z", "z": dout_reg = 4'b zzzz;
		endcase
	end
endmodule

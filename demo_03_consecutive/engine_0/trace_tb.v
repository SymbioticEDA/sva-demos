`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  wire [0:0] PI_clock = clock;
  demo_03_consecutive UUT (
    .clock(PI_clock)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$async2sync.cc:104:execute$487 = 1'b0;
    // UUT.$auto$async2sync.cc:104:execute$491 = 1'b0;
    // UUT.$auto$async2sync.cc:104:execute$495 = 1'b0;
    // UUT.$auto$async2sync.cc:104:execute$499 = 1'b0;
    // UUT.$auto$async2sync.cc:104:execute$503 = 1'b0;
    // UUT.$verific$i5$demo_03_consecutive.sv:13$18 = 1'b0;
    UUT.seq_a.cycle = 32'b00000000000000000000000000000000;
    UUT.seq_b.cycle = 32'b00000000000000000000000000000000;
    UUT.seq_c.cycle = 32'b00000000000000000000000000000000;
    UUT.seq_r.cycle = 32'b00000000000000000000000000000000;

    // state 0
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
    end

    // state 2
    if (cycle == 1) begin
    end

    // state 3
    if (cycle == 2) begin
    end

    // state 4
    if (cycle == 3) begin
    end

    // state 5
    if (cycle == 4) begin
    end

    // state 6
    if (cycle == 5) begin
    end

    // state 7
    if (cycle == 6) begin
    end

    // state 8
    if (cycle == 7) begin
    end

    // state 9
    if (cycle == 8) begin
    end

    // state 10
    if (cycle == 9) begin
    end

    // state 11
    if (cycle == 10) begin
    end

    // state 12
    if (cycle == 11) begin
    end

    // state 13
    if (cycle == 12) begin
    end

    genclock <= cycle < 13;
    cycle <= cycle + 1;
  end
endmodule

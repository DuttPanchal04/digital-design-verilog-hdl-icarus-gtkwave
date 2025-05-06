module d_ff_tb;

reg d;
reg clk;
reg reset;
wire y;

d_ff dut(

.d(d),
.clk(clk),
.reset(reset),
.y(y)

);

// clock generation
initial begin
clk = 0;
forever #5 clk = ~clk;
end

// test sequence
initial begin

  $dumpfile("test_d_ff.vcd");
  $dumpvars(0, d_ff_tb);

reset = 1; d = 0;

#12 reset = 0;
 #10 d = 1;
    #10 d = 0;
    #10 d = 1;

    #20 $finish;
end

endmodule


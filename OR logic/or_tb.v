module or_tb;

reg a,b;
wire y;

or_gate u0_DUT(

.a(a),
.b(b),
.y(y)

);

initial begin

  $dumpfile("test_or.vcd");
  $dumpvars(0,or_tb);

a = 1'b0;
b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end
endmodule

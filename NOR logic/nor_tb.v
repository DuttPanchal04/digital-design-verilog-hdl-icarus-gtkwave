module nor_tb;

reg a,b;
wire y;

nor_gate dut(

.a(a),
.b(b),
.y(y)

);

initial begin

$dumpfile("nor_gate.vcd");
  $dumpvars(0,nor_tb);

a = 1'b0; b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end
endmodule

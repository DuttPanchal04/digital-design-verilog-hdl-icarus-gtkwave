`timescale 1ns/100ps

module and_tb;

reg a, b;
wire y;

and_gate u0_DUT(

.a(a),
.b(b),
.y(y)

);

initial begin

 $dumpfile("and_test.vcd");
  $dumpvars(0,and_tb);

a = 1'b0;
b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end 
endmodule

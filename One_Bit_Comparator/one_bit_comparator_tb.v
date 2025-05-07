module one_bit_comparator_tb;

reg a,b;
wire equal, greater, less;

one_bit_comparator dut(

.a(a),
.b(b),
.equal(equal),
.greater(greater),
.less(less)

);

initial begin

$dumpfile("test_one_bit_comparator");
$dumpvars(0, one_bit_comparator_tb);

a = 1'b0; b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end
endmodule


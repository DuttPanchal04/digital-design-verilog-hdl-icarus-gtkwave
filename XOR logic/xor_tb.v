module xor_tb;

reg a, b;
wire y;

xor_gate dut(

.a(a),
.b(b),
.y(y)

);

initial begin

$dumpfile("test_xor.vcd");
$dumpvars(0, xor_tb);

a = 1'b0;
b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end 
endmodule

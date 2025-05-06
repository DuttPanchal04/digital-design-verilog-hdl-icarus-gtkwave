module xnor_tb;

reg a,b;
wire y;

xnor_gate dut(

.a(a),
.b(b),
.y(y)

);

initial begin

$dumpfile("test_xnor.vcd");
$dumpvars(0,xnor_tb);

a = 1'b0; 
b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end 
endmodule

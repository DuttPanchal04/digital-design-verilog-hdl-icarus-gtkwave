module fa_tb;

reg a, b, cin;
wire s, cout;

fa dut(

.a(a),
.b(b),
.cin(cin),
.s(s),
.cout(cout)

);

initial begin

$dumpfile("test_fa.vcd");
$dumpvars(0, fa_tb);

a = 1'b0;
b = 1'b0;
cin = 1'b0;

#5 a = 1'b0; b = 1'b0; cin = 1'b1;
#5 a = 1'b0; b = 1'b1; cin = 1'b0;
#5 a = 1'b0; b = 1'b1; cin = 1'b1;
#5 a = 1'b1; b = 1'b0; cin = 1'b0;
#5 a = 1'b1; b = 1'b0; cin = 1'b1;
#5 a = 1'b1; b = 1'b1; cin = 1'b0;
#5 a = 1'b1; b = 1'b1; cin = 1'b1;
#5 $finish;

end
endmodule


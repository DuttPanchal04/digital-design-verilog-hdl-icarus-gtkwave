module ha_tb;

reg a,b;
wire s,c;

ha dut(

.a(a),
.b(b),
.s(s),
.c(c)

);

initial begin

$dumpfile("test_ha.vcd");
$dumpvars(0, ha_tb);

a = 1'b0; b = 1'b0;

#5 a = 1'b0; b = 1'b1;
#5 a = 1'b1; b = 1'b0;
#5 a = 1'b1; b = 1'b1;
#5 $finish;

end 
endmodule


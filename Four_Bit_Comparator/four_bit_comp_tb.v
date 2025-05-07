module four_bit_comp_tb;

reg a;
reg b;
wire equal;
wire greater;
wire less;

four_bit_comp dut(

.a(a),
.b(b),
.equal(equal),
.greater(greater),
.less(less)

);

initial begin

$dumpfile("test_four_bit_comp.vcd");
$dumpvars(0, four_bit_comp_tb);

a = 4'b0000; b = 4'b0000;

    a = 4'b0000; b = 4'b0000; #5;
    a = 4'b0000; b = 4'b0001; #5;
    a = 4'b0001; b = 4'b0000; #5;
    a = 4'b0010; b = 4'b0010; #5;
    a = 4'b0011; b = 4'b0100; #5;
    a = 4'b0101; b = 4'b0101; #5;
    a = 4'b0110; b = 4'b0111; #5;
    a = 4'b0111; b = 4'b0110; #5;
    a = 4'b1000; b = 4'b1000; #5;
    a = 4'b1001; b = 4'b1010; #5;
    a = 4'b1010; b = 4'b1010; #5;
    a = 4'b1011; b = 4'b1100; #5;
    a = 4'b1100; b = 4'b1100; #5;
    a = 4'b1101; b = 4'b1110; #5;
    a = 4'b1110; b = 4'b1111; #5;
    a = 4'b1111; b = 4'b1111; #5;
    $finish; #5;

end
endmodule


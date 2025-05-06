module mux_4_1_tb;

reg i0,i1,i2,i3;
reg [1:0] sel;
wire y;

mux_4_1 dut(

.i0(i0),
.i1(i1),
.i2(i2),
.i3(i3),
.sel(sel),
.y(y)

);

initial begin

$monitor("Time=%0t | sel=%b | y=%b", $time, sel, y);

$dumpfile("test_mux41.vcd");
$dumpvars(0, mux_4_1_tb);

i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0; sel = 2'b00;

#5 sel = 2'b01;
#5 sel = 2'b10;
#5 sel = 2'b11;
#5 $finish;

end
endmodule

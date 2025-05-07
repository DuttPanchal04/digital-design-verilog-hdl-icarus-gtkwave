module clk_divider_tb;

reg clk, rst;
wire clk_div2;
wire clk_div4;
wire clk_div8;

clk_divider dut(

.clk(clk),
.rst(rst),
.clk_div2(clk_div2),
.clk_div4(clk_div4),
.clk_div8(clk_div8)

);

initial begin

clk = 0;
forever #5 clk = ~clk;

end

initial begin

$dumpfile("test_clk_divider.vcd");
$dumpvars(0, clk_divider_tb);

rst = 1; clk = 0;

#5 rst = 0;
#200 $finish;

end
endmodule

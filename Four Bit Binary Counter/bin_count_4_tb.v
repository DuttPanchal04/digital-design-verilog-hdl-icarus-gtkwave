`timescale 1ns/100ps

module bin_count_4_tb;

reg clk;
reg reset;
wire [3:0] count;

bin_count_4 dut(

.clk(clk),
.reset(reset),
.count(count)

);

// clock generation
initial begin
clk = 0;
forever #5 clk = ~clk;
end

// test vector sequence
initial begin

$dumpfile("test_binary_counter_4.vcd");
$dumpvars(0, bin_count_4_tb);

clk = 0; reset = 1; 

#5 reset = 0;
#200 $finish;

end
endmodule


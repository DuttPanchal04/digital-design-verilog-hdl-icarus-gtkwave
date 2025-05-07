`timescale 1ns/100ps;

module alu_4bit_tb;

reg [3:0] a, b;
reg [1:0] sel;
wire [4:0] result;

alu_4bit dut(

.a(a),
.b(b),
.sel(sel),
.result(result)

);

initial begin

$dumpfile("test_alu_4bit.vcd");
$dumpvars(0, alu_4bit_tb);

    // Test vectors    

    // AND
    sel = 2'b00;
    a = 4'b1100; b = 4'b1010; #5;
    a = 4'b1111; b = 4'b0000; #5;

    // OR
    sel = 2'b01;
    a = 4'b1100; b = 4'b1010; #5;
    a = 4'b1111; b = 4'b0000; #5;

    // ADD
    sel = 2'b10;
    a = 4'b0011; b = 4'b0101; #5;  // 3 + 5 = 8
    a = 4'b1111; b = 4'b0001; #5;  // 15 + 1 = 16

    // SUB
    sel = 2'b11;
    a = 4'b1000; b = 4'b0011; #5;  // 8 - 3 = 5
    a = 4'b0001; b = 4'b0010; #5;  // 1 - 2 = -1 (in 2's complement = 5'b11111)

    #10 $finish;
end

endmodule

module alu_2bit_tb;

reg [1:0] a,b;
reg [1:0] sel;
wire [2:0] result;

alu_2bit dut(

.a(a),
.b(b),
.sel(sel),
.result(result)

);

initial begin

$dumpfile("test_alu_2bit.vcd");
$dumpvars(0, alu_2bit_tb);

    // Test AND operation (sel = 00)
    sel = 2'b00;
    a = 2'b00; b = 2'b00; #5;
    a = 2'b01; b = 2'b10; #5;
    a = 2'b11; b = 2'b10; #5;

    // Test OR operation (sel = 01)
    sel = 2'b01;
    a = 2'b00; b = 2'b01; #5;
    a = 2'b10; b = 2'b10; #5;
    a = 2'b11; b = 2'b00; #5;

    // Test ADD operation (sel = 10)
    sel = 2'b10;
    a = 2'b01; b = 2'b01; #5;  // 1 + 1 = 2
    a = 2'b11; b = 2'b10; #5;  // 3 + 2 = 5

    // Test SUB operation (sel = 11)
    sel = 2'b11;
    a = 2'b10; b = 2'b01; #5;  // 2 - 1 = 1
    a = 2'b00; b = 2'b01; #5;  // 0 - 1 = -1 (2's comp, result = 3'b111)

end
endmodule

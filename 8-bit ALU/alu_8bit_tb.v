module alu_8bit_tb;

reg [7:0] a, b;
reg [2:0] sel;
wire [8:0] result;

alu_8bit dut(

.a(a),
.b(b),
.sel(sel),
.result(result)

);

initial begin

$dumpfile("test_alu_8bit.vcd");
$dumpvars(0, alu_8bit_tb);

// Test Vectors

 a = 8'b10101010; b = 8'b11001100;

    sel = 3'b000; #10;  // AND
    sel = 3'b001; #10;  // OR
    sel = 3'b010; #10;  // ADD
    sel = 3'b011; #10;  // SUB
    sel = 3'b100; #10;  // XOR
    sel = 3'b101; #10;  // NOT A
    sel = 3'b110; #10;  // Increment A
    sel = 3'b111; #10;  // Decrement A
    $finish; #10;

end
endmodule

module alu_4bit(

input [3:0] a,
input [3:0] b,
input [1:0] sel,
output reg [4:0] result // 5-bit to hold carry/borrow in ADD/SUB

);

always @(*) begin

case (sel)

2'b00: result = a & b;
2'b01: result = a | b;
2'b10: result = a + b;
2'b11: result = a - b;
default: result = 5'b00000;

endcase
end
endmodule


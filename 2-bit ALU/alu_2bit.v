module alu_2bit(

input [1:0] a,
input [1:0] b,
input [1:0] sel,
output reg [2:0] result // 3 bit to handle overflow ( 2bit + 2bit )

);

always @(*) begin

case ( sel )

2'b00: result = a & b;
2'b01: result = a | b;
2'b10: result = a + b;
2'b11: result = a - b;
default: result = 3'b000;

endcase
end
endmodule

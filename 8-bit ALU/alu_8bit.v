module alu_8bit(

input wire [7:0] a,
input wire [7:0] b,
input wire  [2:0] sel,
output reg [8:0] result

);

always @(*) begin

case (sel)

	3'b000: result = a & b;         // AND
        3'b001: result = a | b;         // OR
        3'b010: result = a + b;         // ADD
        3'b011: result = a - b;         // SUB
        3'b100: result = a ^ b;         // XOR
        3'b101: result = ~a;            // NOT A
        3'b110: result = a + 1;         // Increment A
        3'b111: result = a - 1;         // Decrement A
        default: result = 8'b00000000;

endcase
end
endmodule

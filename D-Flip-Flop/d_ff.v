module d_ff(

input wire d,
input wire clk,
input wire reset,
output reg y

);

always @(posedge clk or posedge reset) begin

if(reset)
y <= 1'b0;
else
y <= d;

end
endmodule

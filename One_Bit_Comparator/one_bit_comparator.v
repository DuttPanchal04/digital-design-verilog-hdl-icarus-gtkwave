module one_bit_comparator(

input wire a,
input wire b,
output wire equal,
output wire greater,
output wire less

);

assign equal = ~(a ^ b);
assign greater = ( a > b);
assign less = ( a < b );

endmodule

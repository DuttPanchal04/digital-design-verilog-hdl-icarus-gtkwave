module four_bit_comp(

input wire [3:0] a,
input wire [3:0] b,
output wire equal,
output wire greater,
output wire less

);

assign equal = ( a==b );
assign greater = ( a>b );
assign less = ( a<b );

endmodule

module clk_divider(

input wire clk,
input wire rst,
output reg clk_div2,
output reg clk_div4,
output reg clk_div8

);

always @(posedge clk or posedge rst) begin

if ( rst ) begin

clk_div2 = 0;
clk_div4 = 0;
clk_div8 = 0;

end else begin
clk_div2 = ~clk_div2;
end
end

always @(posedge clk_div2 or posedge rst) 

if ( rst )

clk_div4 = 0;

else
clk_div4 = ~clk_div4;

always @(posedge clk_div4 or posedge rst)

if( rst )

clk_div8 = 0;

else
clk_div8 = ~clk_div8;

endmodule

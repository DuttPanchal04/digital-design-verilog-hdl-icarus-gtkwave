`timescale 1ns/100ps 

module inverter_tb;

reg a;
wire y;

inverter u0_DUT(

.a(a),
.y(y)

);

initial begin

 $dumpfile("test_inv.vcd");
 $dumpvars(0,inverter_tb);

a = 1'b0;

#5 a = 1'b1;
#5 a = 1'b0;
#5 $finish;
end

endmodule


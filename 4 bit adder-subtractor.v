`timescale 1ns / 1ps

module normal(a,b,m,v,sum,cot);
input [3:0] a;
input [3:0] b;
input m;
output [3:0] sum;
output v;
output cot;
wire c1,c2,c3;
wire m0,m1,m2,m3;
assign m0 = m^b[0];
assign m1 = m^b[1];
assign m2 = m^b[2];
assign m3 = m^b[3];

full_adder full_adder0(.a(a[0]),.b(m0),.c(m),.sum(sum[0]),.cout(c1));
full_adder full_adder1(.a(a[1]),.b(m1),.c(c1),.sum(sum[1]),.cout(c2));
full_adder full_adder2(.a(a[2]),.b(m2),.c(c2),.sum(sum[2]),.cout(c3));
full_adder full_adder3(.a(a[3]),.b(m3),.c(c3),.sum(sum[3]),.cout(cot));
assign v = cot^c3;

endmodule

module full_adder(a,b,c,sum,cout);
input a,b,c;
output reg sum,cout;
always @(*)
begin
sum = a^b^c;
cout = (a&b|b&c|c&a);
end
endmodule

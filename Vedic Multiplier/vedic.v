`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:07 03/17/2020 
// Design Name: 
// Module Name:    vedic_multiplier4x4bit 
// Project Name:     Arithmetic ckts
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FA(sum,carry,a,b,cin);
input a,b,cin;
output reg sum,carry;
always@(a or b or cin)
begin
sum<=a^b^cin;
carry<=(a&(b^cin))|(b&cin);
end
endmodule
module HA(sum,carry,a,b);
input a,b;
output reg sum,carry;
always@(a or b )
begin
sum<=a^b;
carry<=a&b;
end
endmodule

module vedic_multiplier4x4bit(pro,a,b);
parameter m=4;
input [m-1:0] a,b;
output  [2*m-1:0] pro;
assign pro[0]=a[0]&b[0];
wire [13:0] tc;
wire [7:0] ts;
HA HA1(pro[1],tc[0],a[1]&b[0],b[1]&a[0]);

FA FA1 (ts[0],tc[1],a[0]&b[2],a[1]&b[1],a[2]&b[0]);
HA HA2 (pro[2],tc[2],ts[0],tc[0]);

FA FA2(ts[1],tc[3],b[3]&a[0],b[2]&a[1],b[1]&a[2]);
FA FA3(ts[2],tc[4],b[0]&a[3],tc[1],tc[2]);
HA HA3(pro[3],tc[5],ts[1],ts[2]);

FA FA4(ts[3],tc[6],b[3]&a[1],b[2]&a[2],b[1]&a[3]);
FA FA5(ts[4],tc[7],tc[3],tc[4],tc[5]);
HA HA4(pro[4],tc[8],ts[3],ts[4]);

HA HA5(ts[5],tc[9],b[3]&a[2],b[2]&a[3]);
FA FA6(ts[6],tc[10],tc[6],tc[7],tc[8]);
HA HA6(pro[5],tc[11],ts[5],ts[6]);

FA FA7(ts[7],tc[12],a[3]&b[3],tc[9],tc[10]);
HA HA7(pro[6],tc[13],ts[7],tc[11]);

HA HA(pro[7], ,tc[12],tc[13]);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:19 03/12/2020 
// Design Name: 
// Module Name:    wallace_Multiplier 
// Project Name: 
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

module HA(a,b,sum,carry);
input a,b;
output sum,carry;
assign sum=a^b;
assign carry=a&b;
endmodule

module FA (a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
assign sum=a^b^cin;
assign carry=(a&(b^cin))|(b&cin);
endmodule

module AND41(a,b,c);
input [3:0] a;
input b;
output [3:0] c;
assign c[0]=a[0]&b;
assign c[1]=a[1]&b;
assign c[2]=a[2]&b;
assign c[3]=a[3]&b;
endmodule

module wallace_Multiplier(input [3:0] a,b,output [7:0] product);

wire [3:0] pp [3:0];
AND41 AND1(a,b[0],pp[0]);
AND41 ANDd3(a,b[1],pp[1]);
AND41 ANDd2(a,b[2],pp[2]);
AND41 ANDd1(a,b[3],pp[3]);

wire tempcarry;
assign product[0]=pp[0][0];

HA HA1(pp[1][0],pp[0][1],product[1],tempcarry);

wire s1,t1;
FA FA1(pp[0][2],pp[1][1],pp[2][0],s1,t1);
wire t2;
HA HA2(s1,tempcarry,product[2],t2);

wire s2,t3,s3,t4,t5;
FA FA3(pp[0][3],pp[2][1],pp[1][2],s2,t3);
FA FA4(s2,pp[3][0],t1,s3,t4);
HA HA3(s3,t2,product[3],t5);

wire s4,s5,t6,t7,t8;
FA FA6(pp[3][1],pp[2][2],pp[1][3],s4,t6);
FA FA7(t3,t4,t5,s5,t7);
HA HA4(s4,s5,product[4],t8);

wire t9,s6,t10;
FA FA8(pp[3][2],pp[2][3],t6,s6,t9);
FA FA9(s6,t7,t8,product[5],t10);

FA FA10(pp[3][3],t9,t10,product[6],product[7]);

endmodule

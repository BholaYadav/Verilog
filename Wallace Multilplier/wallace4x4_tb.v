`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2020 12:29:32 PM
// Design Name: 
// Module Name: wallace4x4_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wallace4x4_tb();
reg [3:0] a,b;
wire [7:0] pro;

wallace_Multiplier W(a,b,pro);
integer i,j;
initial
 begin


for(i=0;i<16;i=i+1)
begin
for(j=0;j<16;j=j+1)
begin
#10 a<=i;
# 10 b<=j;
$display(" a :",a,"  b: ",b,"  product:  ",pro);
end
end
end
endmodule

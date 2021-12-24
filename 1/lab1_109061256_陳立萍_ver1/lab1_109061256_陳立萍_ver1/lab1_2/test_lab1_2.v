`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/07 17:24:17
// Design Name: 
// Module Name: test_lab1_2
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


module test_lab1_2();
    reg A1, A0, B1, B0;
    wire C3, C2, C1, C0;
    
lab1_2 U0(.a1(A1), .a0(A0), .b1(B1), .b0(B0), .c3(C3), .c2(C2), .c1(C1), .c0(C0));

initial
begin
A1 = 0; A0 = 0; B1 = 0; B0 = 0;
#10 A1 = 0; A0 = 0; B1 = 0; B0 = 1;
#10 A1 = 0; A0 = 0; B1 = 1; B0 = 0;
#10 A1 = 0; A0 = 0; B1 = 1; B0 = 1;
#10 A1 = 0; A0 = 1; B1 = 0; B0 = 0;
#10 A1 = 0; A0 = 1; B1 = 0; B0 = 1;
#10 A1 = 0; A0 = 1; B1 = 1; B0 = 0;
#10 A1 = 0; A0 = 1; B1 = 1; B0 = 1;
#10 A1 = 1; A0 = 0; B1 = 0; B0 = 0;
#10 A1 = 1; A0 = 0; B1 = 0; B0 = 1;
#10 A1 = 1; A0 = 0; B1 = 1; B0 = 0;
#10 A1 = 1; A0 = 0; B1 = 1; B0 = 1;
#10 A1 = 1; A0 = 1; B1 = 0; B0 = 0;
#10 A1 = 1; A0 = 1; B1 = 0; B0 = 1;
#10 A1 = 1; A0 = 1; B1 = 1; B0 = 0;
#10 A1 = 1; A0 = 1; B1 = 1; B0 = 1;
end
    
endmodule

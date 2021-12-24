`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 08:55:23
// Design Name: 
// Module Name: lab3_1
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



module f_divider(f_out, f_crys,rst);
output f_out;
input f_crys,rst;
reg [26:0]tmp;

always@(posedge  f_crys or posedge rst)
    if(rst) 
        tmp<=0;
    else 
        tmp<= tmp+1;

assign f_out = tmp[26];

endmodule

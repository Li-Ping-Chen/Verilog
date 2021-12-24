`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 22:49:39
// Design Name: 
// Module Name: lab4_1
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


module lab4_1(rst,b,f_crys);
    input  rst,  f_crys;
    output [3:0]b;
    reg [3:0]b;
    reg [25:0]comp;
    reg f_tmp;
    wire f_out;

assign f_out = f_tmp;

always@(posedge f_crys or posedge rst)
if(rst)
    begin
        comp<=0;
        f_tmp<=0;
    end
else if (comp==26'd49999999) 
    begin
        f_tmp <= ~f_tmp;
        comp<=0;
    end
else 
    comp<= comp + 26'd1;
    
        
always@(posedge  f_out or posedge rst)
    if(rst) 
        b<=4'd0;
    else 
        b<=b + 4'd1;
    
endmodule

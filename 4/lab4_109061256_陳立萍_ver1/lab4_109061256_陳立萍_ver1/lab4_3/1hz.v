`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/01 00:07:35
// Design Name: 
// Module Name: 1hz
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


module divide_1hz( f_crys,rst,f_out);
output f_out;
input f_crys,rst;
reg [25:0]comp;
reg f_tmp;

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

endmodule

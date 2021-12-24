`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 22:42:29
// Design Name: 
// Module Name: bin_to_dec
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


module bin_to_dec(
    input [4:0]bin,
    output [3:0]digit1,
    output [3:0]digit0
    );
    
    assign digit1 = bin / 10;
    assign digit0 = bin % 10;
     
     
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 23:27:14
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
    input [13:0]bin,
    input sign,
    output reg [3:0]digit3,
    output reg [3:0]digit2,
    output reg [3:0]digit1,
    output reg [3:0]digit0
    );
    
always@*   
    if (sign) begin
        digit3 = 4'd10;
        digit2 = (bin % 1000) / 100;
        digit1 = (bin % 100) / 10;
        digit0 = bin % 10;
    end 
    else begin
        digit3 = bin / 1000;    
        digit2 = (bin % 1000) / 100;
        digit1 = (bin % 100) / 10;
        digit0 = bin % 10;
    end
     
endmodule

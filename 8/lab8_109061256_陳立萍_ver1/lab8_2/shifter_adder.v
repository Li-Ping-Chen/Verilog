`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/05 22:26:39
// Design Name: 
// Module Name: shifter_adder
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


module shifter_adder(
    input [3:0]key_in,
    input clk,
    input shift_valid,
    input rst_n,
    output reg [3:0]addend,
    output reg [3:0]augend,
    output reg [4:0]sum
    );
    reg [3:0]addend_next;
    reg [3:0]augend_next;

// shifter
    always @(posedge clk or negedge rst_n)  // no shift
        if (~rst_n) addend <= 4'd0;
        else addend <= addend_next;
    always @(posedge clk or negedge rst_n)
        if (~rst_n) augend <= 4'd0;
        else augend <= augend_next;    

    always @* begin                    // shift
        if (shift_valid)  begin
            addend_next <= key_in;
            augend_next <= addend;
        end
        else  begin
            addend_next <= addend;
            augend_next <= augend;
       end  
   end
    
// adder
    always @*
        sum = addend + augend;

endmodule
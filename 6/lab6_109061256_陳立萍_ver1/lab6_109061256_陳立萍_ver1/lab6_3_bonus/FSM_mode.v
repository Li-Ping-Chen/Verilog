`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 23:50:53
// Design Name: 
// Module Name: FSM_mode
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


`define setting_on 1
`define setting_off 0
     
module FSM_mode(
    input pulse,
    input clk,
    input rst_n,
    output reg setting
);

reg state;
reg next_state;
     
always@*  begin         
    case (state) //judge state
    `setting_on:
        if (pulse)  begin
            next_state <= `setting_off;
            setting <= `setting_off;
        end
        else  begin
            next_state <= `setting_on;
            setting <= `setting_on;
        end
    `setting_off:
        if (pulse)  begin
            next_state <= `setting_on;
            setting <= `setting_on;
        end
        else  begin
            next_state <= `setting_off;
            setting <= `setting_off;
        end
    default:
        begin
            next_state <= `setting_off;
            setting <= `setting_off;
        end
    endcase
end
    
always@(posedge clk or negedge rst_n)
    if (~rst_n) state <= `setting_off;
    else state <= next_state;

endmodule

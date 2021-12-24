`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/16 23:58:31
// Design Name: 
// Module Name: lab2_bonus
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


module lab2_bonus(s, g, bulls, cows);
    input [7:0] s;
    input [7:0] g;
    output [1:0] bulls;
    output [1:0] cows;
    reg [1:0] bulls;
    reg [1:0] cows;

    
always@(s,g)begin
    if((s[0]==s[4]&&s[1]==s[5]&&s[2]==s[6]&&s[3]==s[7]) || (g[0]==g[4]&&g[1]==g[5]&&g[2]==g[6]&&g[3]==g[7]))
        begin
            bulls = 2'b00;
            cows = 2'b00;
        end
    else if(s==g)
        begin
          bulls = 2'b10;
          cows = 2'b00;
        end
        
    else if(s[4]==g[0] && s[5]==g[1] && s[6]==g[2] && s[7]==g[3] && g[4]==s[0] && g[5]==s[1] && g[6]==s[2] && g[7]==s[3])
        begin
           bulls = 2'b00;
           cows = 2'b10;
        end
        
    else if(s[0]==g[0] && s[1]==g[1] && s[2]==g[2] && s[3]==g[3])
        begin
           bulls = 2'b01;
           cows = 2'b00;
        end
    
    else if(s[4]==g[4] && s[5]==g[5] && s[6]==g[6] && s[7]==g[7])
        begin
           bulls = 2'b01;
           cows = 2'b00;
        end
        
    else if(s[4]==g[0] && s[5]==g[1] && s[6]==g[2] && s[7]==g[3])
        begin
           bulls = 2'b00;
           cows = 2'b01;
        end
        
    else if(g[4]==s[0] && g[5]==s[1] && g[6]==s[2] && g[7]==s[3])
        begin
           bulls = 2'b00;
           cows = 2'b01;
        end
 
    else
    begin
        bulls = 2'b00;
        cows = 2'b00;
    end
end    
    
endmodule

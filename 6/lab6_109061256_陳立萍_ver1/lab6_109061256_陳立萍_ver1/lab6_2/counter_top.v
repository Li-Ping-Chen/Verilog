`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/13 22:48:35
// Design Name: 
// Module Name: counter_top
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


module counter_top(
    input setting_next,
    input set_sec_next,
    input set_min_next,
    input rst_n,
    input clk_1hz,    // for downcounter
    input clk_100hz,  // for upcounter
    input mode,
    input resume,
    output [3:0]val0,  //sec
    output [3:0]val1,
    output [3:0]val2,  //min
    output [3:0]val3,
    output reg [15:0]led
    );
    wire setting;
    wire set_min;
    wire set_sec;
    wire start;
    reg start_next;
    wire [3:0]val_set[3:0];
    reg rst_min_next;
    wire rst_min;
    wire [3:0]increment;
    wire [3:0]borrow;
    
    assign rst_min = rst_min_next;            // if over 23:59, turn 00:00
    assign setting = setting_next | resume;   // setting or resume
    assign set_sec = set_sec_next & setting;  // setting and push button
    assign set_min = set_min_next & setting;  //  setting and push button
    assign start = start_next & (~setting);   // not setting and count down
    
    always@*   // if over 23:59, turn 00:00
        if (val_set[3] == 4'd2 && val_set[2] == 4'd4)
              rst_min_next <= 1'd1;
        else  rst_min_next <= 1'd0;
        
    always@*  
        if (val3 == 4'd0 && val2 == 4'd0 && val1 == 4'd0 && val0 == 4'd0) begin
           start_next <= 1'd0;   // count down to 00:00
           led <= {16{1'd1}};
        end
        else begin
            start_next <= mode;
            led <= {16{1'd0}};
        end   
       
    upcounter set_sec0 (.inivalue(4'd0),.highbound(4'd9),.lowbound(4'd0),.increase(set_sec),.time_rst(1'd0),.time_rst_value(4'd0),.clk(clk_100hz),.rst_n(rst_n),.value(val_set[0]),.increment(increment[0]));
    upcounter set_sec1 (.inivalue(4'd0),.highbound(4'd5),.lowbound(4'd0),.increase(increment[0]),.time_rst(1'd0),.time_rst_value(4'd0),.clk(clk_100hz),.rst_n(rst_n),.value(val_set[1]),.increment(increment[1]));
    upcounter set_min0 (.inivalue(4'd0),.highbound(4'd9),.lowbound(4'd0),.increase(set_min),.time_rst(rst_min),.time_rst_value(4'd0),.clk(clk_100hz),.rst_n(rst_n),.value(val_set[2]),.increment(increment[2]));
    upcounter set_min1 (.inivalue(4'd0),.highbound(4'd2),.lowbound(4'd0),.increase(increment[2]),.time_rst(rst_min),.time_rst_value(4'd0),.clk(clk_100hz),.rst_n(rst_n),.value(val_set[3]),.increment(increment[3]));            
    downcounter sec0 (.inivalue(4'd0),.highbound(4'd9),.lowbound(4'd0),.decrease(start),.set(setting),.set_val(val_set[0]),.clk(clk_1hz),.rst_n(rst_n),.value(val0),.borrow(borrow[0]));
    downcounter sec1 (.inivalue(4'd0),.highbound(4'd5),.lowbound(4'd0),.decrease(borrow[0]),.set(setting),.set_val(val_set[1]),.clk(clk_1hz),.rst_n(rst_n),.value(val1),.borrow(borrow[1]));
    downcounter min0 (.inivalue(4'd0),.highbound(4'd9),.lowbound(4'd0),.decrease(borrow[1]),.set(setting),.set_val(val_set[2]),.clk(clk_1hz),.rst_n(rst_n),.value(val2),.borrow(borrow[2]));
    downcounter min1 (.inivalue(4'd0),.highbound(4'd2),.lowbound(4'd0),.decrease(borrow[2]),.set(setting),.set_val(val_set[3]),.clk(clk_1hz),.rst_n(rst_n),.value(val3),.borrow(borrow[3]));
    
        
endmodule

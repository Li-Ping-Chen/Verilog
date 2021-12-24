`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 23:46:23
// Design Name: 
// Module Name: lab6_3_top
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


module top(
    input set,          // set time and pause / resume
    input pb_lap_min,   // lap and set min
    input pb_stop_sec,  // stop and set sec
    input pb_rst,       // reset
    input clk,          // 100Mhz
    output [3:0]dis,
    output [7:0]segs,
    output [15:0]led
    );
    
    wire clk_1hz;
    wire clk_100hz;
    wire set_debounced;
    wire set_pulse;
    wire lap_min_debounced;
    wire lap_min_pulse;
    wire stop_sec_debounced;
    wire stop_sec_pulse;
    wire rst_debounced;
    wire rst_pulse;
    wire rst_pulse_next;
    wire mode;
    wire setting;
    wire memory;
    wire [3:0]value[3:0];
    wire [3:0]memory_value[3:0];
    
    assign rst_pulse = ~rst_pulse_next;
    
    fre_div_1 clk_1 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_1hz));
    fre_div_100 clk_100 (.clk(clk),.rst_n(rst_pulse),.clk_out(clk_100hz));
    debounce A0 (.pb_in(pb_stop_sec),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(stop_sec_debounced));
    debounce B0 (.pb_in(pb_rst),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(rst_debounced));
    debounce C0 (.pb_in(set),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(set_debounced));
    debounce E0 (.pb_in(pb_lap_min),.rst_n(rst_pulse),.clk(clk_100hz),.pb_debounced(lap_min_debounced));
    one_pulse A1 (.in_trig(lap_min_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(lap_min_pulse));
    one_pulse B1 (.in_trig(rst_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(rst_pulse_next));
    one_pulse D1 (.in_trig(stop_sec_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(stop_sec_pulse));
    one_pulse F1 (.in_trig(set_debounced),.clk(clk_100hz),.rst_n(rst_pulse),.one_pulse(set_pulse));
    FSM fsm_0 (.pulse(stop_sec_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.setting(setting),.mode(mode),.set_on(setting));
    FSM_lap fsm_1 (.pulse(lap_min_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.memory(memory),.setting(setting));
    FSM_mode fsm_2 (.pulse(set_pulse),.clk(clk_100hz),.rst_n(rst_pulse),.setting(setting));
    counter_top T1 (.clk_100hz(clk_100hz),.clk_1hz(clk_1hz),.rst_n(rst_pulse),.mode(mode),.set_min_next(lap_min_pulse),.set_sec_next(stop_sec_pulse),
                    .setting_next(setting),.val0(value[0]),.val1(value[1]),.val2(value[2]),.val3(value[3]),.led(led));
    memory U0 (.clk(clk_100hz),.rst_n(rst_pulse),.memory(memory)
              ,.value0_in(value[0]),.value1_in(value[1]),.value2_in(value[2]),.value3_in(value[3])
              ,.value0_out(memory_value[0]),.value1_out(memory_value[1]),.value2_out(memory_value[2]),.value3_out(memory_value[3]));
    scan_ctl T0 (.digit3(memory_value[3]),.digit2(memory_value[2]),.digit1(memory_value[1]),.digit0(memory_value[0])
                         ,.clk(clk),.rst_n(rst_pulse),.dis(dis),.segs(segs));
                         
endmodule

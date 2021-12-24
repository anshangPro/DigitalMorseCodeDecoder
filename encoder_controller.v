`timescale 1ns / 1ps

module encoder_controller (
    input clk, rst, backspace_button, flag,
    input [8:0] encoder_switch,
    input switch1,
    input switch2,
    input switch3,
    input [3:0] key,
    output [63:0] seg_out,
    output beep
);

wire [4:0] morse_cord;
wire [63:0] seg_out_temp;
register regist(clk, flag, backspace_button, rst, key,  seg_out);
assign seg_out_temp = seg_out;
encoder_basic encb(clk, encoder_switch, rst, seg_out_temp, morse_cord);

wire [1:0]time_lc;
wire [1:0]time_sc;
wire time_ss;
wire [74:0]beep_bit;
buzzer_controller buzc(clk, switch1, switch2, switch3, rst, time_lc, time_sc, time_ss);
buzzer_trans buzt(clk, rst, time_lc, time_sc, time_ss, morse_code, beep_bit);
buzzer buz(rst, clk, beep_bit, beep);

    
endmodule

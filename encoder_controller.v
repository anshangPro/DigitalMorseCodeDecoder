`timescale 1ns / 1ps

module encoder_controller (
    input clk, rst, backspace_button, flag,
    input [8:0] encoder_switch,
    input [1:0]sw_lc,
    input [1:0]sw_sc,
    input sw_ss,
    input [3:0] key,
    output [63:0] seg_out,
    output beep
);

//register

wire [63:0] seg_out_same;
register regist(clk, flag, backspace_button, rst, key,  seg_out, seg_out_same);

//trans

wire [4:0]morse_code;
encoder_basic encb(clk, encoder_switch, rst, seg_out_same, morse_code);

//buzzer
wire [6:0]wid;
wire [74:0]beep_bit;
buzzer_trans buzt(clk, rst, sw_lc, sw_sc, sw_ss, morse_code, beep_bit, wid);


buzzer buz(rst, clk, beep_bit, wid, beep);

    
endmodule

`timescale 1ns / 1ps

module encoder_controller (
    input clk, rst, backspace_button, flag,
    input [8:0] encoder_switch,
    input [1:0] sw_lc,
    input [1:0] sw_sc,
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

exciting ex0(clk, encoder_switch[0], sw_out0);
exciting ex1(clk, encoder_switch[1], sw_out1);
exciting ex2(clk, encoder_switch[2], sw_out2);
exciting ex3(clk, encoder_switch[3], sw_out3);
exciting ex4(clk, encoder_switch[4], sw_out4);
exciting ex5(clk, encoder_switch[5], sw_out5);
exciting ex6(clk, encoder_switch[6], sw_out6);
exciting ex7(clk, encoder_switch[7], sw_out7);
exciting ex8(clk, encoder_switch[8], sw_out8);

wire sw_exciting;
assign sw_exciting = sw_out0 | sw_out1 | sw_out2 | sw_out3 | sw_out4 | sw_out5 | sw_out6 | sw_out7 | sw_out8;

wire [6:0]wid;
wire [74:0]beep_bit;
buzzer_trans buzt(clk, rst | sw_exciting, sw_lc, sw_sc, sw_ss, morse_code, beep_bit, wid);

buzzer buz(rst | sw_exciting, clk, beep_bit, wid, beep);
endmodule

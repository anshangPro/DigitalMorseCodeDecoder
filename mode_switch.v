    `timescale 1ns / 1ps

module mode_switch(
    input clk, rst,                  //时钟与重置信号
    input backspace,                 //退格键
    input mode_sw,                   //模式转换键
    input [1:0] beep_sw1,            // 蜂鸣器变速开关
    input [1:0] beep_sw2,
    input beep_sw3, 
    input [3:0] row,                 //矩阵键盘输入
    input [8:0] encoder_switch,      // 蜂鸣器播放开关
    output [3:0] col,                //矩阵键盘输出
    output [4:0] led_morse,
    output [2:0] led_cnt,
    output led_mode,                 //模式灯
    output [7:0] seg_en,             //七段数码显示管
    output [7:0] seg_out,
    output beep                      //蜂鸣器
    );

    //蜂鸣器变速开关消抖
    wire [1:0] beep_sw1_stable;
    wire [1:0] beep_sw2_stable;
    wire beep_sw3_stable;
    debounce beep10(clk, rst, beep_sw1[0], beep_sw1_stable[0]);
    debounce beep11(clk, rst, beep_sw1[1], beep_sw1_stable[1]);
    debounce beep20(clk, rst, beep_sw2[0], beep_sw2_stable[0]);
    debounce beep21(clk, rst, beep_sw2[1], beep_sw2_stable[1]);
    debounce beep30(clk, rst, beep_sw3, beep_sw3_stable);

    //蜂鸣器编码开关消抖
    wire [8:0] encoder_switch_stable;
    debounce en_s0(clk, rst, encoder_switch[0], encoder_switch_stable[0]);
    debounce en_s1(clk, rst, encoder_switch[1], encoder_switch_stable[1]);
    debounce en_s2(clk, rst, encoder_switch[2], encoder_switch_stable[2]);
    debounce en_s3(clk, rst, encoder_switch[3], encoder_switch_stable[3]);
    debounce en_s4(clk, rst, encoder_switch[4], encoder_switch_stable[4]);
    debounce en_s5(clk, rst, encoder_switch[5], encoder_switch_stable[5]);
    debounce en_s6(clk, rst, encoder_switch[6], encoder_switch_stable[6]);
    debounce en_s7(clk, rst, encoder_switch[7], encoder_switch_stable[7]);
    debounce en_s8(clk, rst, encoder_switch[8], encoder_switch_stable[8]);

    //分频
    wire clk_fast;
    counter fast(clk, rst, clk_fast);///////////////////////////?????????

    //模式切换消抖
    wire mode_stable;
    debounce modesw(clk_fast, rst, mode_sw, mode_stable);

    //回退键消抖
    wire backspace_stable;
    debounce backspacebutton(clk_fast, rst, backspace, backspace_stable);


    //模式切换
    reg mode; 
    assign led_mode = mode;
    always @(posedge mode_stable) begin
    mode = mode + 1;
    end

    //矩阵键盘输入，flag为1时代表按下
    wire [3:0] value;
    wire key_flag;
    key_board key(clk, rst, row, col, value, key_flag);

    //模式切换，初始是编码
    wire [63:0] seg_enc;
    wire [63:0] seg_dec;
    encoder_controller enc(clk, mode | rst, backspace_stable, key_flag, encoder_switch_stable, beep_sw1_stable, beep_sw2_stable, beep_sw3_stable, value, seg_enc, beep);
    decoder_controller dec(mode, clk, rst, value, key_flag, backspace_stable, led_morse, led_cnt, seg_dec);

    //多路选择器与七段数码显示管
    wire [63:0] seg;
    mux64 mux(mode, seg_dec, seg_enc, rst, seg);
    seg light(clk, rst, seg, seg_en, seg_out);

    endmodule
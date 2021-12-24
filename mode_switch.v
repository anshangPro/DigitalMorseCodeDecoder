`timescale 1ns / 1ps

module mode_switch(
    input clk, rst, backspace,
    input mode_sw,
    input [3:0] row,
    input [8:0] encoder_switch,
    input switch1,
    input switch2,
    input switch3,
    output [3:0] col,
    output reg [23:0] led,
    output [7:0] seg_en,
    output wire [7:0] seg_out,
    output beep
);

wire clk_fast;
wire mode_stable, backspace_stable;
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_sw, mode_stable);///消抖后的模式切换�??
debounce backspacebutton(clk_fast, rst, backspace, backspace_stable);//回退键除�??
//decoder(mode);
//encoder(~mode);

//模式切换
reg mode; 
always @(posedge mode_stable or posedge rst) begin
    if(rst)begin 
        mode = 0;
        led[23] = 0;
    end else begin
        mode = mode +1;
        led[23] = led[23] +1;
    end
end

//矩阵键盘输入，flag�??1时代表按�??
wire [3:0] value;
wire key_flag;
wire [4:0] morse_cord;
key_board key(clk, rst, row, col, value, key_flag);

//模式切换，初始是编码
wire [63:0] seg_enc;
encoder_controller enc(~mode, clk, rst, backspace_stable, key_flag,encoder_switch ,switch1,switch2,switch3,value, seg_enc,beep);


seg light(clk, rst, seg_enc, seg_en, seg_out);


endmodule

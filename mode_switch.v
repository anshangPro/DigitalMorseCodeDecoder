`timescale 1ns / 1ps

module mode_switch(
    input clk, rst, backspace,
    input mode_sw,
    input [3:0] row,
    output [3:0] col,
    output reg [23:0] led,
    output [7:0] seg_en,
    output wire [7:0] seg_out
);

wire clk_fast;
wire mode_stable;
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_sw, mode_stable);
//decoder(mode);
//encoder(~mode);
reg mode; // 1为解码器 0为编码器
always @(posedge mode_stable or posedge rst) begin
    if(rst)begin 
        mode <= 0;
        led[23] <= 0;
    end else begin
        mode <= mode +1;
        led[23] <= led[23] +1;
    end
end

wire [3:0] value;
wire key_flag;
wire [4:0] morse_cord;
key_board key(clk, rst, row, col, value, key_flag);

// 编码器部分
wire [63:0] seg_enc;
encoder_controller enc(~mode, clk, rst, backspace, key_flag, value, seg_enc);
// 编码器部分

// 灯！ 测试展示全接编码器了 记得改！
seg light(clk_fast, rst, seg_enc, seg_en, seg_out);
// 灯！

endmodule
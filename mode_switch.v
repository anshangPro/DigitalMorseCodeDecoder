`timescale 1ns / 1ps

module mode_switch(
    input clk, rst, backspace,
    input mode_sw,
    input [1:0] beep_sw1,
    input [1:0] beep_sw2,
    input beep_sw3, // ������ģʽ
    input [3:0] row,
    input [8:0] encoder_switch, // �˸����ż�
    output [3:0] col,
    output [23:0] led,
    output [7:0] seg_en,
    output wire [7:0] seg_out,
    output beep
);

wire clk_fast;
wire mode_stable, backspace_stable;
counter fast(clk, rst, clk_fast);
debounce modesw(clk_fast, rst, mode_sw, mode_stable);///�������ģʽ�л���
debounce backspacebutton(clk_fast, rst, backspace, backspace_stable);//���˼�����
//decoder(mode);
//encoder(~mode);

//ģʽ�л�
reg mode; 
assign led[23] = mode;
always @(posedge mode_stable) begin
        mode = mode +1;
end

//����������룬flagΪ1ʱ������
wire [3:0] value;
wire key_flag;
wire [4:0] morse_cord;
key_board key(clk, rst, row, col, value, key_flag);

//ģʽ�л�����ʼ�Ǳ���
wire [63:0] seg_enc;
wire [63:0] seg_dec;
encoder_controller enc(clk, mode | rst, backspace_stable, key_flag, encoder_switch, beep_sw1, beep_sw2, beep_sw3, value, seg_enc, beep);
decoder dec(mode, clk, rst, value, key_flag, backspace_stable, led[8:4], led[2:0], seg_dec);

wire [63:0] seg;
mux64 mux(mode, seg_dec, seg_enc, seg);
seg light(clk, rst, seg, seg_en, seg_out);


endmodule
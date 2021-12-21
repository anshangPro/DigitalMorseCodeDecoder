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
debounce modesw(clk_fast, rst, mode_sw, mode_stable);//�������ģʽ�л���
//decoder(mode);
//encoder(~mode);

//ģʽ�л�����ʼ�Ǳ���
reg mode; 
always @(posedge mode_stable or posedge rst) begin
    if(rst)begin 
        mode <= 0;
        led[23] <= 0;
    end else begin
        mode <= mode +1;
        led[23] <= led[23] +1;
    end
end

//����������룬flagΪ1ʱ������
wire [3:0] value;
wire key_flag;
wire [4:0] morse_cord;
key_board key(clk, rst, row, col, value, key_flag);

//����������,�ߵ�ƽ��Ч
wire [63:0] seg_enc;
encoder_controller enc(~mode, clk, rst, backspace, key_flag,encoder_switch ,value, seg_enc);


seg light(clk_fast, rst, seg_enc, seg_en, seg_out);


endmodule
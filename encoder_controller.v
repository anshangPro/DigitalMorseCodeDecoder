`timescale 1ns / 1ps

module encoder_controller (
    input clk, rst, backspace_button, flag,
    input [8:0] encoder_switch,
    input [1:0] sw_lc,
    input [1:0] sw_sc,
    input sw_ss,
    input [3:0] key,
    output [63:0] seg_out,
    output beep,
    output [4:0] led_test
);

//register

wire [63:0] seg_out_same;
register regist(clk, flag, backspace_button, rst, key,  seg_out, seg_out_same);

//trans
reg [7:0] sw;
wire [7:0] s;
wire [4:0]morse_code;
encoder_basic encb(clk, encoder_switch, sw, rst, seg_out_same, morse_code);
assign led_test = morse_code;

exciting ex0(clk, encoder_switch[0], sw_out0);
exciting ex1(clk, encoder_switch[1], sw_out1);
exciting ex2(clk, encoder_switch[2], sw_out2);
exciting ex3(clk, encoder_switch[3], sw_out3);
exciting ex4(clk, encoder_switch[4], sw_out4);
exciting ex5(clk, encoder_switch[5], sw_out5);
exciting ex6(clk, encoder_switch[6], sw_out6);
exciting ex7(clk, encoder_switch[7], sw_out7);
exciting ex8(clk, encoder_switch[8], sw_out8);

wire [6:0]wid;

wire clk_10000, clk_s02;
    counter full(clk, sw_out8 | rst, clk_10000);
    counter #(2000) s02(clk_10000, sw_out8 | rst, clk_s02);

exciting e0(clk, sw[0], s[0]);
exciting e1(clk, sw[1], s[1]);
exciting e2(clk, sw[2], s[2]);
exciting e3(clk, sw[3], s[3]);
exciting e4(clk, sw[4], s[4]);
exciting e5(clk, sw[5], s[5]);
exciting e6(clk, sw[6], s[6]);
exciting e7(clk, sw[7], s[7]);
wire s_exciting;
assign s_exciting = s[0] | s[1] | s[2] | s[3] | s[4] | s[5] | s[6] | s[7];
reg [7:0] cnt;
always @ (posedge clk_s02, posedge rst, posedge sw_out8, posedge s_exciting) begin
    if (rst | sw_out8 | s_exciting) begin
        cnt <= 0;
    end
    else if((cnt == wid+10 | cnt == 8'b1000_0000 )) begin
        cnt <= 8'b1000_0000;
    end else cnt <= cnt + 1;
end
wire cnt_clk;
assign cnt_clk = cnt == 8'b1000_0000 ? 1 : 0;

always @ (posedge cnt_clk, posedge rst ,posedge sw_out8) begin
    if (rst) sw = 0;
    else if(sw_out8) begin
        sw = 8'b0000_0001;
    end else if(morse_code == 5'b10101) sw = 0;
    else sw = sw << 1;
end

wire sw_exciting;
assign sw_exciting = sw_out0 | sw_out1 | sw_out2 | sw_out3 | sw_out4 | sw_out5 | sw_out6 | sw_out7 | sw_out8;

wire [74:0]beep_bit;
buzzer_trans buzt(clk, rst | sw_exciting | s_exciting, sw_lc, sw_sc, sw_ss, morse_code, beep_bit, wid);

buzzer buz(rst | sw_exciting | s_exciting, clk, beep_bit, wid, beep);
endmodule

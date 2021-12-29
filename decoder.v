`timescale 1ns / 1ps

module decoder(
    input en,
    input clk,
    input rst,
    input [3:0] key,
    input flag,
    input backspace,
    output reg [4:0] led_morse,
    output reg [2:0] led_cnt,
    output [63:0] out
    );
    // 初定 5位表示正常的摩斯码 3位表示当前输入位数 输入从右往左入 
    reg bs_lag1, bs_lag2;
    reg flag_lag1, flag_lag2;

    always @ (posedge clk) begin
        bs_lag1  <= backspace;
        flag_lag1 <= flag;
        bs_lag2  <= bs_lag1;
        flag_lag2 <= flag_lag1;
    end
    //左长键* 右短键#  d为回车 确认键
//    reg [4:0] value;
    reg [5:0] value;

    wire block;
    assign block = led_cnt[0] & ~led_cnt[1] & led_cnt[2];
    reg trans;
    reg [4:0] led_morse_backup;
    reg [2:0] led_cnt_backup;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            led_morse <= 0;
            led_cnt <= 0;
            trans <= 0;
        end else if(en) begin
            if(flag_lag1 & ~flag_lag2) begin
                if(~block) begin
                    if(key == 4'he) begin 
                        led_morse <= {led_morse[3:0], 1'b1};
                        led_cnt <= led_cnt+1;
                    end
                    if(key == 4'hf) begin
                        led_morse <= {led_morse[3:0], 1'b0};
                        led_cnt <= led_cnt+1;
                    end
                end
                else begin
                    // TODO 输入太长的警告
                    led_morse <= led_morse;
                    led_cnt <= led_cnt;
                end
                if(key == 4'hd) begin
                    led_morse <= 0;
                    led_morse_backup <= led_morse;
                    led_cnt_backup <= led_cnt;
                    led_cnt <= 0;
                    case({led_morse, led_cnt})
                            8'b00001_010: begin
                                value <= 6'ha;
                                trans <= 1;
                            end
                            8'b01000_100: begin
                                value <= 6'hb;
                                trans <= 1;
                            end
                            8'b01010_100: begin
                                value <= 6'hc;
                                trans <= 1;
                            end
                            8'b00100_011: begin
                                value <= 6'hd;
                                trans <= 1;
                            end
                            8'b00000_001: begin
                                value <= 6'he;
                                trans <= 1;
                            end
                            8'b00010_100: begin
                                value <= 6'hf;
                                trans <= 1;
                            end
                            8'b00110_011: begin
                                value <= 6'h10;
                                trans <= 1;
                            end
                            8'b00000_100: begin
                                value <= 6'h11;
                                trans <= 1;
                            end
                            8'b00000_010: begin
                                value <= 6'h12;
                                trans <= 1;
                            end
                            8'b00111_100: begin
                                value <= 6'h13;
                                trans <= 1;
                            end
                            8'b00101_011: begin
                                value <= 6'h14;
                                trans <= 1;
                            end
                            8'b00100_100: begin
                                value <= 6'h15;
                                trans <= 1;
                            end
                            8'b00011_010: begin
                                value <= 6'h16;
                                trans <= 1;
                            end
                            8'b00010_010: begin
                                value <= 6'h17;
                                trans <= 1;
                            end
                            8'b00111_011: begin
                                value <= 6'h18;
                                trans <= 1;
                            end
                            8'b00110_100: begin
                                value <= 6'h19;
                                trans <= 1;
                            end
                            8'b01101_100: begin
                                value <= 6'h1a;
                                trans <= 1;
                            end
                            8'b00010_011: begin
                                value <= 6'h1b;
                                trans <= 1;
                            end
                            8'b00000_011: begin
                                value <= 6'h1c;
                                trans <= 1;
                            end
                            8'b00001_001: begin
                                value <= 6'h1d;
                                trans <= 1;
                            end
                            8'b00001_011: begin
                                value <= 6'h1e;
                                trans <= 1;
                            end
                            8'b00001_100: begin
                                value <= 6'h1f;
                                trans <= 1;
                            end
                            8'b00011_011: begin
                                value <= 6'h20;
                                trans <= 1;
                            end
                            8'b01001_100: begin
                                value <= 6'h21;
                                trans <= 1;
                            end
                            8'b01011_100: begin
                                value <= 6'h22;
                                trans <= 1;
                            end
                            8'b01100_100: begin
                                value <= 6'h23;
                                trans <= 1;
                            end
                            8'b01111_101: begin
                                value <= 6'h1;
                                trans <= 1;
                            end
                            8'b00111_101: begin
                                value <= 6'h2;
                                trans <= 1;
                            end
                            8'b00011_101: begin
                                value <= 6'h3;
                                trans <= 1;
                            end
                            8'b00001_101: begin
                                value <= 6'h4;
                                trans <= 1;
                            end
                            8'b00000_101: begin
                                value <= 6'h5;
                                trans <= 1;
                            end
                            8'b10000_101: begin
                                value <= 6'h6;
                                trans <= 1;
                            end
                            8'b11000_101: begin
                                value <= 6'h7;
                                trans <= 1;
                            end
                            8'b11100_101: begin
                                value <= 6'h8;
                                trans <= 1;
                            end
                            8'b11110_101: begin
                                value <= 6'h9;
                                trans <= 1;
                            end
                            8'b11111_101: begin
                                value <= 6'h0;
                                trans <= 1;
                            end
                            default: ;//警告
                    endcase
                end
            end
            if(bs_lag1 & ~bs_lag2) begin
                led_morse <= {1'b0, led_morse[4:1]};
                if(led_cnt != 0) led_cnt <= led_cnt - 1;
            end
            if(trans) trans <= 0;
        end else begin
            led_morse <= 0;
            led_cnt <= 0;
            trans <= 0;
        end
    end
    de_translation de_tr(clk, rst | ~en, trans, led_morse_backup, led_cnt_backup, value, out);
endmodule
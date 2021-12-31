`timescale 1ns / 1ps

module decoder_controller(
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
    // 5位表示正常的摩斯码 3位表示当前输入位数 输入从右往左入
    exciting bs1(clk, backspace, bs_ex);
    exciting flag1(clk, flag, flag_ex);

    //左长键* 右短键#  d为回车键 确认
    wire block;
    assign block = led_cnt[0] & ~led_cnt[1] & led_cnt[2];
    reg trans;
    reg [4:0] led_morse_backup;
    reg [2:0] led_cnt_backup;

    reg [2:0] warning;// 切换警告状态
    wire [63:0] tooLong; // 01摩斯码超长警告
    assign tooLong = 64'b10000111_10100011_10100011_11111111_11000111_10100011_10101011_11000010;

    wire [63:0] failed; // 10摩斯码不合法
    assign failed = 64'b11111111_10001110_10001000_11111001_11000111_10000110_10100001_11111111;

    wire [63:0] enough;// 11七段数码显示管超长警告
    assign enough = 64'b11111111_10000110_11001000_11000000_11000001_11000010_10001001_11111111;

    reg [26:0] cnt; //10 11111 01011 11000 01000 00000
    reg [3:0] cnt_num;

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            cnt <= 27'd100000000;
            led_morse <= 0;
            led_cnt <= 0;
            trans <= 0;
            warning <= 0;
            cnt_num <= 0;
        end else if(en) begin
            if(flag_ex) begin
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
                    //输入太长的警告
                    if(key == 4'he | key == 4'hf) begin
                        warning <= 01;
                    end
                end
                if(key == 4'hd) begin
                    led_morse <= 0;
                    led_morse_backup <= led_morse;
                    led_cnt_backup <= led_cnt;
                    led_cnt <= 0;
                    case({led_morse, led_cnt})
                            8'b00001_010: begin
                                trans <= 1;
                            end
                            8'b01000_100: begin
                                trans <= 1;
                            end
                            8'b01010_100: begin
                                trans <= 1;
                            end
                            8'b00100_011: begin
                                trans <= 1;
                            end
                            8'b00000_001: begin
                                trans <= 1;
                            end
                            8'b00010_100: begin
                                trans <= 1;
                            end
                            8'b00110_011: begin
                                trans <= 1;
                            end
                            8'b00000_100: begin
                                trans <= 1;
                            end
                            8'b00000_010: begin
                                trans <= 1;
                            end
                            8'b00111_100: begin
                                trans <= 1;
                            end
                            8'b00101_011: begin
                                trans <= 1;
                            end
                            8'b00100_100: begin
                                trans <= 1;
                            end
                            8'b00011_010: begin
                                trans <= 1;
                            end
                            8'b00010_010: begin
                                trans <= 1;
                            end
                            8'b00111_011: begin
                                trans <= 1;
                            end
                            8'b00110_100: begin
                                trans <= 1;
                            end
                            8'b01101_100: begin
                                trans <= 1;
                            end
                            8'b00010_011: begin
                                trans <= 1;
                            end
                            8'b00000_011: begin
                                trans <= 1;
                            end
                            8'b00001_001: begin
                                trans <= 1;
                            end
                            8'b00001_011: begin
                                trans <= 1;
                            end
                            8'b00001_100: begin
                                trans <= 1;
                            end
                            8'b00011_011: begin
                                trans <= 1;
                            end
                            8'b01001_100: begin
                                trans <= 1;
                            end
                            8'b01011_100: begin
                                trans <= 1;
                            end
                            8'b01100_100: begin
                                trans <= 1;
                            end
                            8'b01111_101: begin
                                trans <= 1;
                            end
                            8'b00111_101: begin
                                trans <= 1;
                            end
                            8'b00011_101: begin
                                trans <= 1;
                            end
                            8'b00001_101: begin
                                trans <= 1;
                            end
                            8'b00000_101: begin
                                trans <= 1;
                            end
                            8'b10000_101: begin
                                trans <= 1;
                            end
                            8'b11000_101: begin
                                trans <= 1;
                            end
                            8'b11100_101: begin
                                trans <= 1;
                            end
                            8'b11110_101: begin
                                trans <= 1;
                            end
                            8'b11111_101: begin
                                trans <= 1;
                            end
                            default: warning <= 10;//警告
                    endcase
                end
            end
            if(bs_ex) begin
                led_morse <= {1'b0, led_morse[4:1]};
                if(led_cnt != 0) led_cnt <= led_cnt - 1;
            end
            if(trans) begin
                trans <= 0;
                if(cnt_num != 8) cnt_num = cnt_num + 1;
                else warning <= 11;
            end 
            if(warning != 00) cnt <= 0;
            if(cnt != 100000000) begin
                cnt <= cnt+1;
                if(cnt == 99999999) warning <= 0;
            end
        end else begin
            led_morse <= 0;
            led_cnt <= 0;
            trans <= 0;
        end
    end
    wire [63:0] de_out;
    de_translation de_tr(clk, rst | ~en, trans, led_morse_backup, led_cnt_backup, de_out);

    mux64x4 mux(de_out, failed, enough, tooLong, warning, rst, out);

endmodule
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
    reg [4:0] value;
//    reg [5:0] value;

    wire block;
    assign block = led_cnt[0] & ~led_cnt[1] & led_cnt[2];

    always @(posedge clk, posedge rst) begin
        if(rst) begin
            led_morse <= 0;
            led_cnt <= 0;
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
                        led_cnt <= 0;
                        case({led_morse, led_cnt})
                            8'b00001_010: begin
                                value <= 5'ha;
                            end
                            8'b01000_100: begin
                                value <= 5'hb;
                            end
                            8'b01010_100: begin
                                value <= 5'hc;
                            end
                            8'b00100_011: begin
                                value <= 5'hd;
                            end
                            8'b00000_001: begin
                                value <= 5'he;
                            end
                            8'b00010_100: begin
                                value <= 5'hf;
                            end
                            8'b00110_011: begin
                                value <= 5'h10;
                            end
                            8'b00000_100: begin
                                value <= 5'h11;
                            end
                            8'b00000_010: begin
                                value <= 5'h12;
                            end
                            8'b00111_100: begin
                                value <= 5'h13;
                            end
                            8'b00101_011: begin
                                value <= 5'h14;
                            end
                            8'b00100_100: begin
                                value <= 5'h15;
                            end
                            8'b00011_010: begin
                                value <= 5'h16;
                            end
                            8'b00010_010: begin
                                value <= 5'h17;
                            end
                            8'b00111_011: begin
                                value <= 5'h18;
                            end
                            8'b00110_100: begin
                                value <= 5'h19;
                            end
                            8'b01101_100: begin
                                value <= 5'h1a;
                            end
                            8'b00010_011: begin
                                value <= 5'h1b;
                            end
                            8'b00000_011: begin
                                value <= 5'h1c;
                            end
                            8'b00001_001: begin
                                value <= 5'h1d;
                            end
                            8'b00001_011: begin
                                value <= 5'h1e;
                            end
                            8'b00001_100: begin
                                value <= 5'h1f;
                            end
                            8'b00011_011: begin
                                value <= 5'h20;
                            end
                            8'b01001_100: begin
                                value <= 5'h21;
                            end
                            8'b01011_100: begin
                                value <= 5'h22;
                            end
                            8'b01100_100: begin
                                value <= 5'h23;
                            end
                            8'b01111_101: begin
                                value <= 5'h1;
                            end
                            8'b00111_101: begin
                                value <= 5'h2;
                            end
                            8'b00011_101: begin
                                value <= 5'h3;
                            end
                            8'b00001_101: begin
                                value <= 5'h4;
                            end
                            8'b00000_101: begin
                                value <= 5'h5;
                            end
                            8'b10000_101: begin
                                value <= 5'h6;
                            end
                            8'b11000_101: begin
                                value <= 5'h7;
                            end
                            8'b11100_101: begin
                                value <= 5'h8;
                            end
                            8'b11110_101: begin
                                value <= 5'h9;
                            end
                            8'b11111_101: begin
                                value <= 5'h0;
                            end
                            default: ;//警告
                        endcase
                    end
            end
            if(bs_lag1 & ~bs_lag2) begin
                led_morse <= {1'b0, led_morse[4:1]};
                if(led_cnt != 0) led_cnt <= led_cnt - 1;
            end
        end else begin
            led_morse <= 0;
            led_cnt <= 0;
        end
    end
    de_translation de_tr(clk, rst | ~en, flag, value, out);
endmodule
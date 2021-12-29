`timescale 1ns / 1ps

module encoder_basic(
    input clk,
    input [8:0]encoder_switch,
    input rst,
    input [63:0] seg_out_temp,
    output reg [4:0] morse_code
    );

    wire [7:0]seg_1;
    assign seg_1 = seg_out_temp[7:0];

    wire [7:0]seg_2;
    assign seg_2 = seg_out_temp[15:8];
    
    wire [7:0]seg_3;
    assign seg_3 = seg_out_temp[23:16];

    wire [7:0]seg_4;
    assign seg_4 = seg_out_temp[31:24];
    
    wire [7:0]seg_5;
    assign seg_5 = seg_out_temp[39:32];

    wire [7:0]seg_6;
    assign seg_6 = seg_out_temp[47:40];
    
    wire [7:0]seg_7;
    assign seg_7 = seg_out_temp[55:48];

    wire [7:0]seg_8;
    assign seg_8 = seg_out_temp[63:56];

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            morse_code = 5'b10101;
        end 
        else if (encoder_switch[0]) begin
            if (seg_1!=8'b1111_1111) begin
                case(seg_1)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[1]) begin
            if (seg_2!=8'b1111_1111) begin
                case(seg_2)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[2]) begin
            if (seg_3!=8'b1111_1111) begin
                case(seg_3)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[3]) begin
            if (seg_4!=8'b1111_1111) begin
                case(seg_4)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[4]) begin
            if (seg_5!=8'b1111_1111) begin
                case(seg_5)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[5]) begin
            if (seg_6!=8'b1111_1111) begin
                case(seg_6)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[6]) begin
            if (seg_7!=8'b1111_1111) begin
                case(seg_7)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else if (encoder_switch[7]) begin
            if (seg_8!=8'b1111_1111) begin
                case(seg_8)//0 stands for short code and 1 stands for long code
                8'b1111_1001:morse_code <= 5'b01111;//1
                8'b1010_0100:morse_code <= 5'b00111;//2
                8'b1011_0000:morse_code <= 5'b00011;//3
                8'b1001_1001:morse_code <= 5'b00001;//4
                8'b1001_0010:morse_code <= 5'b00000;//5
                8'b1000_0010:morse_code <= 5'b10000;//6
                8'b1111_1000:morse_code <= 5'b11000;//7
                8'b1000_0000:morse_code <= 5'b11100;//8
                8'b1001_0000:morse_code <= 5'b11110;//9
                8'b1100_0000:morse_code <= 5'b11111;//0
                8'b1111_1111:morse_code <= 5'b10101;//none
                default :morse_code <= 5'b10101;//defalut
            endcase
            end
        end
        else begin
            morse_code <= 5'b10101;
        end
    end
endmodule

`timescale 1ns / 1ps

module de_translation(
    input clk,
    input rst,
    input trans,
    input [4:0] led_morse,
    input [2:0] led_cnt,
    input [5:0] value,//////////////////////////////////////////????????????
    output reg [63:0] out
    );
      
    reg counting;
    reg [19:0] cnt;
    reg [7:0] val;
    always @ (posedge clk, posedge rst)
    begin
        if(rst) begin
            out <= ~0;
            cnt <= 0;
        end
        else if(out[63:56] == 8'b1111_1111) begin 
            if(trans) begin
                counting <= 1;
            end
            if(counting) begin
                if(cnt == 1000000) 
                begin
                    counting <= 0;
                    cnt <= 0;
                    out <= {out[55:0], val};
                end 
                else cnt <= cnt + 1;
            end
        end
        case({led_morse, led_cnt})
            8'b00001_010: val <= 8'b1000_1000;
            8'b01000_100: val <= 8'b1000_0011;
            8'b01010_100: val <= 8'b1100_0110;
            8'b00100_011: val <= 8'b1010_0001;
            8'b00000_001: val <= 8'b1000_0110;
            8'b00010_100: val <= 8'b1000_1110;
            8'b00110_011: val <= 8'b1100_0010;
            8'b00000_100: val <= 8'b1000_1001;
            8'b00000_010: val <= 8'b1111_0000;
            8'b00111_100: val <= 8'b1111_0001;
            8'b00101_011: val <= 8'b1000_1010;
            8'b00100_100: val <= 8'b1100_0111;
            8'b00011_010: val <= 8'b1100_1000;
            8'b00010_010: val <= 8'b1010_1011;
            8'b00111_011: val <= 8'b1010_0011;
            8'b00110_100: val <= 8'b1000_1100;
            8'b01101_100: val <= 8'b1001_1000;
            8'b00010_011: val <= 8'b1100_1110;
            8'b00000_011: val <= 8'b1011_0110;
            8'b00001_001: val <= 8'b1000_0111;
            8'b00001_011: val <= 8'b1100_0001;
            8'b00001_100: val <= 8'b1110_0011;
            8'b00011_011: val <= 8'b1000_0001;
            8'b01001_100: val <= 8'b1001_1011;
            8'b01011_100: val <= 8'b1001_0001;
            8'b01100_100: val <= 8'b1010_0101;
            8'b01111_101: val <= 8'b1111_1001;
            8'b00111_101: val <= 8'b1010_0100;
            8'b00011_101: val <= 8'b1011_0000;
            8'b00001_101: val <= 8'b1001_1001;
            8'b00000_101: val <= 8'b1001_0010;
            8'b10000_101: val <= 8'b1000_0010;
            8'b11000_101: val <= 8'b1111_1000;
            8'b11100_101: val <= 8'b1000_0000;
            8'b11110_101: val <= 8'b1001_0000;
            8'b11111_101: val <= 8'b1100_0000;
            default: val <= 8'b1111_1111;
        endcase
    end
    
endmodule
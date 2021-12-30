`timescale 1ns / 1ps

module de_translation(
    input clk,
    input rst,
    input trans,
    input [4:0] led_morse,
    input [2:0] led_cnt,
    input [1:0] inf, //1,2 ±¨´í  0 Õı³£
    output reg [63:0] out
    );
      
    reg [3:0] c;
    reg [1:0] inf_backup;
    reg inf_2;  
    reg counting;
    reg [19:0] cnt;
    reg [7:0] val;
    reg [63:0] out_backup;
    reg [63:0] out_2;
    always @ (posedge clk, posedge rst)
    begin
        if(rst) begin
//            out <= ~0;
            out_backup <= ~0;
            cnt <= 0;
            c <= 0;
        end
        else if(c != 4'b1000)
        begin 
            if(trans) begin
                counting <= 1;
            end
            if(counting) begin
                if(cnt == 1000000) 
                begin
                    counting <= 0;
                    cnt <= 0;

//                    out <= {out[55:0], val};
                    out_backup <= {out_backup[55:0], val};
                    if(inf == 0) out <= out_backup;
                    else out <= out_2;
                    
                    c <= c + 1'b1;
                end 
                else cnt <= cnt + 1;
            end
        end
        else c <= c - 1;
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
    
    wire clk_1, clk_2;
    counter full1 (clk, rst, clk_1);
    counter full2 (clk_1, rst, clk_2);
    always @ (posedge clk_2, posedge rst)
    begin
        if(rst)
        begin
            out_2 <= ~0;
            inf_backup <= inf;
        end
        else
        begin
            if(inf == 2'b01)
            begin
                out_2 <= 64'b10000111_10100011_10100011_11111111_11000111_10100011_10101011_11000010; //too long
                inf_backup <= 0;
            end
            else if(inf == 2'b10)
            begin
                out_2 <= 64'b11111111_10001110_10001000_11110000_11000111_10000110_10000110_11111111; //failed
                inf_backup <= 0;
            end
            else if(c == 4'b1000)
            begin
                out_2 <= 64'b11111111_10000110_10101011_10100011_11000001_11000010_10001001_11111111; //enough
                inf_backup <= 0;
            end
        end
    end
endmodule
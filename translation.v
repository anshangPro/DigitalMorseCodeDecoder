`timescale 1ns / 1ps

module encoder(
    input en,
    input [7:0] seg_x,
    //input seg_x
    output reg [4:0] morse_cord
    );
    
    always @(en)begin
        if(en)begin
            case(seg_x)//0 stands for short cord and 1 stands for long cord
                8'b1111_1001:morse_cord = 5'b01111;//1
                8'b1010_0100:morse_cord = 5'b00111;//2
                8'b1011_0000:morse_cord = 5'b00011;//3
                8'b1001_1001:morse_cord = 5'b00001;//4
                8'b1001_0010:morse_cord = 5'b00000;//5
                8'b1000_0010:morse_cord = 5'b10000;//6
                8'b1111_1000:morse_cord = 5'b11000;//7
                8'b1000_0000:morse_cord = 5'b11100;//8
                8'b1001_0000:morse_cord = 5'b11110;//9
                8'b1100_0000:morse_cord = 5'b11111;//0
                default :morse_cord = 5'b00000;//0
            endcase
        end
    end
    
endmodule
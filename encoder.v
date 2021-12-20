`timescale 1ns / 1ps

module encoder(
    input en,
    input [7:0]encoder_switch,
    input rst,
    input [3:0] key,
    //input encode_button,
    output reg [4:0] morse_cord
    );
    
    always @(encoder_switch)begin
        if(en)begin
            case(key)//0 stands for short cord and 1 stands for long cord
                4'b0001:morse_cord = 5'b01111;//1
                4'b0010:morse_cord = 5'b00111;//2
                4'b0011:morse_cord = 5'b00011;//3
                4'b0100:morse_cord = 5'b00001;//4
                4'b0101:morse_cord = 5'b00000;//5
                4'b0110:morse_cord = 5'b10000;//6
                4'b0111:morse_cord = 5'b11000;//7
                4'b1000:morse_cord = 5'b11100;//8
                4'b1001:morse_cord = 5'b11110;//9
                4'b0000:morse_cord = 5'b11111;//0
                default :morse_cord = 5'b11111;//0
            endcase
        end
    end
    
endmodule
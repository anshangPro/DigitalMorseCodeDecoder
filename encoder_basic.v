`timescale 1ns / 1ps

module encoder_basic(
    input en,
    input clk,
    input [8:0]encoder_switch,
    input rst,
    input [63:0] seg_out_temp,
    //input encode_button,
    output reg [4:0] morse_cord
    );

    wire [7:0]seg_1;
    wire [3:0]r1;
    assign seg_1 = seg_out_temp[7:0];
    translation t1(encoder_switch[0], seg_1,r1);
    always @(posedge clk) begin
        if (en && encoder_switch[0]) begin
            if (seg_1!=8'b1111_1111) begin
                morse_cord = r1;
            end
        end
    end

    wire [7:0]seg_2;
    wire [3:0]r2;
    assign seg_2 = seg_out_temp[15:8];
    translation t2(encoder_switch[1], seg_2,r2);
    always @(posedge clk) begin
        if (en && encoder_switch[1]) begin
            if (seg_2!=8'b1111_1111) begin
                morse_cord = r2;
            end
        end
    end

    wire [7:0]seg_3;
    wire [3:0]r3;
    assign seg_3 = seg_out_temp[23:16];
    translation t3(encoder_switch[2], seg_3,r3);
    always @(posedge clk) begin
        if (en && encoder_switch[2]) begin
            if (seg_3!=8'b1111_1111) begin
                morse_cord = r3;
            end
        end
    end

    wire [7:0]seg_4;
    wire [3:0]r4;
    assign seg_4 = seg_out_temp[31:24];
    translation t4(encoder_switch[3], seg_4,r4);
    always @(posedge clk) begin
        if (en && encoder_switch[3]) begin
            if (seg_4!=8'b1111_1111) begin
                morse_cord = r4;
            end
        end
    end

    wire [7:0]seg_5;
    wire [3:0]r5;
    assign seg_5 = seg_out_temp[39:32];
    translation t5(encoder_switch[4], seg_5,r5);
    always @(posedge clk) begin
        if (en && encoder_switch[4]) begin
            if (seg_5!=8'b1111_1111) begin
                morse_cord = r5;
            end
        end
    end


    wire [7:0]seg_6;
    wire [3:0]r6;
    assign seg_6 = seg_out_temp[47:40];
    translation t6(encoder_switch[5], seg_6,r6);
    always @(posedge clk) begin
        if (en && encoder_switch[5]) begin
            if (seg_6!=8'b1111_1111) begin
                morse_cord = r6;
            end
        end
    end

    wire [7:0]seg_7;
    wire [3:0]r7;
    assign seg_7 = seg_out_temp[55:48];
    translation t7(encoder_switch[6], seg_7,r7);
    always @(posedge clk) begin
        if (en && encoder_switch[6]) begin
            if (seg_7!=8'b1111_1111) begin
                morse_cord = r7;
            end
        end
    end

    wire [7:0]seg_8;
    wire [3:0]r8;
    assign seg_8 = seg_out_temp[63:56];
    translation t8(encoder_switch[7], seg_8,r8);
    always @(posedge clk) begin
        if (en && encoder_switch[7]) begin
            if (seg_8!=8'b1111_1111) begin
                morse_cord = r8;
            end
        end
    end   

endmodule
`timescale 1ns / 1ps

module register(
    input backspace_button,
    input clk,
    input rst,
    input [3:0] keyboard_val,
    input flag,
    output reg [63:0] seg_in
);
    // seg_out ����out�� �Ƿ���֮���8λ����
    wire [7:0] seg_out;
    display u(keyboard_val, flag, seg_out);
    reg [4:0] input_wid; // ��¼��ǰ�������λ
    reg changed;

    always @(posedge clk,posedge rst) begin
        if (rst) 
        begin
            seg_in <= ~(64'b0);
            input_wid <= 0;
        end 
        else begin
            if(input_wid == 8)begin
                //todo ��λ����8֮��ľ���
            end else if (changed == 0)
            begin
                changed <= 1;
                input_wid <= input_wid + 1;
                seg_in <= {seg_in[55:0],seg_out};
            end
        end
    end

    always @(seg_out, rst)begin
        if(rst) changed <= 1;
        else begin
            changed <= 0;
        end
    end
    
    // �˸���
    always @(posedge backspace_button) begin
        if(input_wid > 0) begin
            input_wid <= input_wid -1;
            seg_in <= {8'b1111_1111, seg_in[63:8]};
        end    
    end
endmodule
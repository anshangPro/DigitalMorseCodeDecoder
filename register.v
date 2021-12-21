
`timescale 1ns / 1ps

module register (
    input en,
    input flag,
    input backspace_button,
    input rst,
    input [3:0] keyboard_val,
    output [63:0] seg_out
);

    //mode = 1 -> backspace
    //mode = 0 -> flag
    reg mode;
    wire cir;
    assign cir = flag | backspace_button;
    always @ (posedge cir, posedge rst) begin
        if (en) begin
            if(rst) begin
                mode <= 0;
            end
            else if (backspace_button) begin 
                mode <= 1;
            end
            else begin 
                mode <= 0;
            end
        end
    end

    wire[7:0] val;
    transfer trans(flag, rst, keyboard_val, val);
    shift shift(flag | backspace_button, rst, mode, val, seg_out);

endmodule


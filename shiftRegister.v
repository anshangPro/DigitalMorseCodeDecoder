`timescale 1ns / 1ps

module shiftRegister(
    input clk, rst,
    input direction,  
    input [7:0] in,
    output reg [63:0] out
);
// reg data;
// always @ (in) begin
//     case(in)
//            4'h0: data=8'b0100_0000;  // 0
//            4'h1: data=8'b0111_1001;  // 1
//            4'h2: data=8'b0010_0100;  // 2
//            4'h3: data=8'b0011_0000;  // 3
//            4'h4: data=8'b0001_1001;  // 4
//            4'h5: data=8'b0001_0010;  // 5
//            4'h6: data=8'b0000_0010;  // 6
//            4'h7: data=8'b0111_1000;  // 7
//            4'h8: data=8'b0000_0000;  // 8
//            4'h9: data=8'b0001_0000;  // 9
//            default: data = 8'b1111_1111;
//        endcase
// end
always @ (posedge clk, posedge rst) begin
    if(rst) begin
        out <= ~0;
    end else if(~direction) begin
        out <= {out[55:0], in};
    end else out <= {8'b1111_1111, out[63:8]};
end

endmodule

// module register (
//     input backspace_button,
//     input clk,
//     input rst,
//     input [3:0] keyboard_val,
//     input flag,
//     output reg [63:0] seg_in
// );
//     reg mode;
//     display tran(keyboard_val, seg_out);

//     shiftRegister sReg(clk | backspace_button, rst, mode, seg_out, seg_in);

//     wire cir;
//     assignn cir = flag | backspace_button;
//     always @ (posedge cir, posedge rst) begin
//         if(rst) mode <= 0;
//         else if(backspace_button) mode <= 1;
//         else mode <= 0;
//     end
// endmodule
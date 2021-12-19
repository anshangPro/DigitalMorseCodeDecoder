`timescale 1ns / 1ps

module display(
input rst,
input [3:0] key,
input flag,
output reg [7:0] seg_out
    );
always @(posedge flag or posedge rst)
    begin
    if (rst) begin
        seg_out = 8'b1111_1111;
    end
    else begin
        case(key)
           4'h0: seg_out=8'b1100_0000;  // 0
           4'h1: seg_out=8'b1111_1001;  // 1
           4'h2: seg_out=8'b1010_0100;  // 2
           4'h3: seg_out=8'b1011_0000;  // 3
           4'h4: seg_out=8'b1001_1001;  // 4
           4'h5: seg_out=8'b1001_0010;  // 5
           4'h6: seg_out=8'b1000_0010;  // 6
           4'h7: seg_out=8'b1111_1000;  // 7
           4'h8: seg_out=8'b1000_0000;  // 8
           4'h9: seg_out=8'b1001_0000;  // 9
           default: seg_out = 8'b1111_1111;
       endcase
    end
end
    
endmodule

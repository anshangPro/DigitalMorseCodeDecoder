`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/09 17:18:04
// Design Name: 
// Module Name: display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display(
input clk,
input rst,
input [3:0] key,
output reg [7:0] seg_out
    );
always @*
    begin
       case(key)
           4'h0: seg_out=8'b0100_0000;  // 0
           4'h1: seg_out=8'b0111_1001;  // 1
           4'h2: seg_out=8'b0010_0100;  // 2
           4'h3: seg_out=8'b0011_0000;  // 3
           4'h4: seg_out=8'b0001_1001;  // 4
           4'h5: seg_out=8'b0001_0010;  // 5
           4'h6: seg_out=8'b0000_0010;  // 6
           4'h7: seg_out=8'b0111_1000;  // 7
           4'h8: seg_out=8'b0000_0000;  // 8
           4'h9: seg_out=8'b0001_0000;  // 9
           default: seg_out = 8'b0000_0000;
       endcase
    end
    
    
endmodule

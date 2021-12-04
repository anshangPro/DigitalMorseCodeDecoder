`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/03 15:08:15
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    output clk_out
    );
    parameter period = 100000000;
    reg [13:0] cnt_1, cnt_2;
    always @ (posedge clk or posedge rst) 
        if(rst)
            cnt_1 <= 14'd0;
        else if(cnt_1 == 14'd10000 )
            cnt_1 <= 14'd0;
        else cnt_1 <= cnt_1 + 1'b1;
        
    assign clk_out = cnt_1 == 14'd10000 ? 1'b1 : 1'b0;
endmodule

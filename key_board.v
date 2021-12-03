`timescale 1ns / 1ps

module key_board(
    input clk,
    input rst,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] key
);

reg [19:0] cnt;
wire key_clk;

always @ (posedge clk or posedge rst)
    if(rst)
      cnt <= 0;
    else
      cnt <= cnt + 1'b1;



endmodule

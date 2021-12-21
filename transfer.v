`timescale 1ns / 1ps

module transfer(
    input clk,
    input rst,
    input [3:0] keyboard_val,
    output reg [7:0] val
    );
always @(posedge clk or posedge rst) begin
    begin
        if (rst) begin
            val<=8'b1111_1111;
        end
        else begin
            case(keyboard_val)
            4'h0: val<=8'b1100_0000;  // 0
            4'h1: val<=8'b1111_1001;  // 1
            4'h2: val<=8'b1010_0100;  // 2
            4'h3: val<=8'b1011_0000;  // 3
            4'h4: val<=8'b1001_1001;  // 4
            4'h5: val<=8'b1001_0010;  // 5
            4'h6: val<=8'b1000_0010;  // 6
            4'h7: val<=8'b1111_1000;  // 7
            4'h8: val<=8'b1000_0000;  // 8
            4'h9: val<=8'b1001_0000;  // 9
            4'hA: val<=8'b1000_1000;  // A
            4'hB: val<=8'b1000_0011;  // B
            4'hC: val<=8'b1100_0110;  // C
            4'hD: val<=8'b1010_0001;  // D
            4'hE: val<=8'b1000_0110;  // E
            4'hF: val<=8'b1000_1110;  // F
            default: val <= 8'b1111_1111;
            endcase
        end
    end
end
    
endmodule
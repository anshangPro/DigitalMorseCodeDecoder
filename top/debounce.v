`timescale 1ns / 1ps

module debounce(
    input clk_fast,
    input rst,
    input key_in,
    output reg key_out
    );

    reg change;
    reg [7:0] cnt;

    always @ (posedge clk_fast or posedge rst)begin
        if(rst) begin 
            change <= 0;
            cnt <= 0;
            key_out <= 0;
        end
        else begin
            if(cnt == 200) begin  
                cnt <= 0;
                change <= 0;
            end else begin
                cnt <= cnt + 1;
            end
            if(change == 0 && key_out != key_in)begin
                key_out <= key_in;
                change <= 1;
                cnt <= 0;
            end
        end
    end
endmodule
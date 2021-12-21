`timescale 1ns / 1ps

module debounce(
    input clk_fast,
    input rst,
    input key_in,
    output reg key_out
    );
    // ?????£???????????????????????0.5s?? ???????£
    wire clk_out;
    reg change;
    reg [11:0] cnt;
    // 0.5s ????
    always @ (posedge clk_fast or posedge rst)begin
        if(rst) begin 
            change <= 0;
            cnt <= 0;
        end
        else if(cnt == 5000) begin  
            cnt <= 0;
            change <= 0;
        end else begin
            cnt <= cnt + 1;
            //change <= 1;
        end
    end
    
    always @ (posedge clk_fast or posedge rst)begin
        if(rst) key_out <= 0;
        else if(change == 0 && key_out != key_in)begin
            key_out <= key_in;
            change <= 1;
            cnt <= 0;
        end
    end
endmodule

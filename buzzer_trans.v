`timescale 1ns / 1ps

module buzzer_trans(input en,
                    input clk,
                    input rst,
                    input [1:0]temp1,          /////shortest
                    input [1:0]temp2,
                    input temp3,
                    input [4:0]morse_code,
                    output reg [74:0]beep_bit,
                    output reg [6:0] wid);
    
    reg code_first;
    reg [2:0]cnt;
    always @(posedge clk or posedge rst) begin
        if (en) begin
            if (rst) begin
                beep_bit <= 0;
                cnt      <= 3'b000;
            end
            else begin
                if (cnt != 3'b101) begin
                    code_first = morse_code[cnt];
                    cnt        = cnt+1;
                    if (code_first) begin
                        case ({temp1,temp3})
                            3'b010: beep_bit = {beep_bit,8'b00011111};
                            3'b011: beep_bit = {beep_bit,10'b0000011111};
                            
                            3'b100: beep_bit = {beep_bit,11'b00011111111};
                            3'b101: beep_bit = {beep_bit,13'b0000011111111};
                            
                            3'b110: beep_bit = {beep_bit,13'b0001111111111};
                            3'b111: beep_bit = {beep_bit,15'b000001111111111};
                        endcase
                    end
                    else begin
                        case ({temp2,temp3})
                            3'b010: beep_bit = {beep_bit,4'b0001};
                            3'b011: beep_bit = {beep_bit,6'b000001};
                            
                            3'b100: beep_bit = {beep_bit,6'b000111};
                            3'b101: beep_bit = {beep_bit,8'b00000111};
                            
                            3'b110: beep_bit = {beep_bit,7'b0001111};
                            3'b111: beep_bit = {beep_bit,9'b000001111};
                        endcase
                    end
                end
                else begin
                    cnt <= 0;
                end
            end
        end
    end
    
endmodule

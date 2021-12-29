`timescale 1ns / 1ps

module buzzer_trans(
    input clk,
    input rst,
    input [1:0]sw_lc,
    input [1:0]sw_sc,
    input sw_ss,
    input [4:0]morse_code,
    output reg [74:0]beep_bit,
    output reg [6:0] wid
    );
    

    reg en;
    reg code_first;
    reg [2:0]cnt;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            cnt <= 3'b000;
            code_first <= 0;
            en <= 0;
        end
        else if(morse_code == 5'b10101) begin
            cnt <= 3'b000;
            code_first <= 0;
            en <= 0;
        end
        else begin
            if (cnt != 3'b101) begin
                code_first <= morse_code[cnt];
                cnt <= cnt+1;
                en <= 1;
            end
        end
    end

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            beep_bit <= 0;
            wid <= 0;
        end
        else if (morse_code == 5'b10101) begin
            beep_bit <= 0;
            wid <= 0;
        end
        else begin
            if (en) begin
                if (code_first) begin
                    case ({sw_lc,sw_ss})
                    3'b000: begin
                        beep_bit <= {beep_bit,8'b00011111};
                        wid <= wid + 4'b1000;
                    end

                    3'b001: begin 
                        beep_bit <= {beep_bit,10'b0000011111};
                        wid <= wid + 4'b1010;
                    end 

                    3'b010: begin
                        beep_bit <= {beep_bit,11'b00011111111};
                        wid <= wid + 4'b1011;
                    end

                    3'b011: begin 
                        beep_bit <= {beep_bit,13'b0000011111111};
                        wid <= wid + 4'b1101;
                    end

                    3'b100: begin 
                        beep_bit <= {beep_bit,13'b0001111111111};
                        wid <= wid + 4'b1101;
                    end

                    3'b101: begin
                        beep_bit <= {beep_bit,15'b000001111111111};
                        wid <= wid + 4'b1111;
                    end
                    default begin 
                        beep_bit <= 0;
                        wid <= 0;
                    end
                    endcase
                end
                else begin
                case ({sw_sc,sw_ss})
                    3'b000: begin 
                        beep_bit <= {beep_bit,4'b0001};
                        wid <= wid + 4'b0100;
                    end

                    3'b001: begin
                        beep_bit <= {beep_bit,6'b000001};
                        wid <= wid + 4'b0110;
                    end
                    
                            
                    3'b010: begin
                        beep_bit <= {beep_bit,6'b000111};
                        wid <= wid + 4'b0110;
                    end
                    
                    3'b011: begin
                        beep_bit <= {beep_bit,8'b00000111};
                        wid <= wid + 4'b1000;
                    end
                         
                    3'b100: begin
                        beep_bit <= {beep_bit,7'b0001111};
                        wid <= wid + 4'b0111;
                    end
                    
                    3'b101: begin
                        beep_bit <= {beep_bit,9'b000001111};
                        wid <= wid + 4'b1001;
                    end
                    default begin 
                        beep_bit <= 0;
                        wid <= 0;
                    end
                    endcase
                end
            end
        end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 10:37:12
// Design Name: 
// Module Name: adjustable_blink
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


module adjustable_blink(
    input clk, 
    input btn_up, 
    input btn_dn,
    output reg led
);

    reg btn_up_prev, btn_dn_prev;
    
    reg [2:0] speed = 3'd2; 
    
    reg [24:0] counter = 25'd0;
    reg [24:0] max_count;

    always @(posedge clk) begin
      
        btn_up_prev <= btn_up;
        btn_dn_prev <= btn_dn;

        if (btn_up && !btn_up_prev && speed < 3'd4) 
            speed <= speed + 1;
        else if (btn_dn && !btn_dn_prev && speed > 3'd0) 
            speed <= speed - 1;
    end

    always @(*) begin
        case(speed)
            3'd4: max_count = 25'd1_499_999;  // 8 Hz
            3'd3: max_count = 25'd2_999_999;  // 4 Hz
            3'd2: max_count = 25'd5_999_999;  // 2 Hz
            3'd1: max_count = 25'd11_999_999; // 1 Hz
            3'd0: max_count = 25'd23_999_999; // 0.5 Hz
            default: max_count = 25'd5_999_999;
        endcase
    end

    always @(posedge clk) begin
        if (counter >= max_count) begin
            counter <= 25'd0;
            led <= ~led;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
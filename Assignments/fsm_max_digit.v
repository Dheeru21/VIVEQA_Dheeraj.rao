`timescale 1ns / 1ps

module fsm_max_digit (
    input wire clk,
    input wire rst,
    input wire [1:0] din,
    output reg [1:0] dout
);

    reg [1:0] max_val;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            max_val <= 2'b00;
            dout <= 2'b00;
        end else begin
            if (din > max_val) begin
                max_val <= din;
                dout <= din;
            end else begin
                dout <= max_val; 
            end
        end
    end
endmodule

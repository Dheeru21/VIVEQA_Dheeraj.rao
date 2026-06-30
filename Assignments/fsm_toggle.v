`timescale 1ns / 1ps

module fsm_toggle (
    input wire clk,
    input wire rst,
    input wire din,
    output reg dout
);

    localparam S0 = 2'b00; 
    localparam S1 = 2'b01; 
    localparam S2 = 2'b10; 

    reg [1:0] state, next_state;
    reg toggle;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            dout <= 1'b0;
        end else begin
            state <= next_state;
            if (toggle) 
                dout <= ~dout; 
        end
    end

    always @(*) begin
        next_state = state;
        toggle = 1'b0;

        case (state)
            S0: begin
                if (din == 1'b0) next_state = S1;
                else             next_state = S0;
            end
            S1: begin
                if (din == 1'b1) next_state = S2;
                else             next_state = S1; 
            end
            S2: begin
                if (din == 1'b1) begin
                    toggle = 1'b1;     
                    next_state = S0;   
                end else begin
                    next_state = S1;   
                end
            end
            default: next_state = S0;
        endcase
    end
endmodule
`timescale 1ns / 1ps

module tb_fsm_max_digit();
    reg clk, rst;
    reg [1:0] din;
    wire [1:0] dout;

    fsm_max_digit uut (.clk(clk), .rst(rst), .din(din), .dout(dout));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; din = 2'b00;
        #10 rst = 0;

        #10 din = 2'd0; 
        #10 din = 2'd0; 
        #10 din = 2'd1; 
        #10 din = 2'd0; 
        #10 din = 2'd3; 
        #10 din = 2'd2; 

        #20 $finish;
    end
endmodule

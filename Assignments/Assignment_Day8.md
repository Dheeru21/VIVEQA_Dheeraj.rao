Combinational Verilog Codes

1. Write RTL for 1bit Full adder using Dataflow abstraction and verify the same using a Testbench. 
Ans:
Module code:

module full_adder_df(A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule


Testbench code:

module full_adder_df_tb();
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder_df dut(A, B, Cin, Sum, Cout);

    initial begin
   
        A=1'b0; B=1'b0; Cin=1'b0;
        #5 A=1'b0; B=1'b0; Cin=1'b1;
        #5 A=1'b0; B=1'b1; Cin=1'b0;
        #5 A=1'b0; B=1'b1; Cin=1'b1;
        #5 A=1'b1; B=1'b0; Cin=1'b0;
        #5 A=1'b1; B=1'b0; Cin=1'b1;
        #5 A=1'b1; B=1'b1; Cin=1'b0;
        #5 A=1'b1; B=1'b1; Cin=1'b1;
        #5 $finish;
    end
endmodule

2. Write RTL for 2x4 decoder using Dataflow abstraction and verify the same using a Testbench. 
Ans:
Module code:

module decoder_2x4(A, Y);
    input [1:0] A;       
    output [3:0] Y;     

    assign Y[0] = ~A[1] & ~A[0]; // Active when A is 00
    assign Y[1] = ~A[1] &  A[0]; // Active when A is 01
    assign Y[2] =  A[1] & ~A[0]; // Active when A is 10
    assign Y[3] =  A[1] &  A[0]; // Active when A is 11

endmodule


Testbench code:

module decoder_2x4_tb();
    reg [1:0] A;
    wire [3:0] Y;

    decoder_2x4 dut(A, Y);

    initial begin
        
        A = 2'b00; 
        #5 A = 2'b01; 
        #5 A = 2'b10; 
        #5 A = 2'b11; 
        #5 $finish;
    end
    
endmodule

3. Write RTL for 8x3 priority encoder using structural model and verify the same using a Testbench. 
Ans:
Module code:

module pri_encoder_8x3_struc(D, Y, Valid);
    input [7:0] D;
    output [2:0] Y;
    output Valid;

    wire n_D6, n_D5, n_D4, n_D2;
    wire w1, w2, w3, w4, w5;

    not (n_D6, D[6]);
    not (n_D5, D[5]);
    not (n_D4, D[4]);
    not (n_D2, D[2]);

    or (Y[2], D[7], D[6], D[5], D[4]);

    and (w1, n_D5, n_D4, D[3]);
    and (w2, n_D5, n_D4, D[2]);
    or (Y[1], D[7], D[6], w1, w2);

    and (w3, n_D6, D[5]);
    and (w4, n_D6, n_D4, D[3]);
    and (w5, n_D6, n_D4, n_D2, D[1]);
    or (Y[0], D[7], w3, w4, w5);

    or (Valid, D[7], D[6], D[5], D[4], D[3], D[2], D[1], D[0]);

endmodule


Testbench code:

module pri_encoder_8x3_struc_tb();
    reg [7:0] D;
    wire [2:0] Y;
    wire Valid;

    pri_encoder_8x3_struc dut(D, Y, Valid);

    initial begin
        D = 8'b00000000; 
        
        #5 D = 8'b10000000; 
        
        #5 D = 8'b01010101; 
        
        #5 D = 8'b00100000; 
        #5 D = 8'b00011111; 
        #5 D = 8'b00001000; 
        #5 D = 8'b00000100; 
        #5 D = 8'b00000010; 
        #5 D = 8'b00000001; 
        
        #5 $finish;
    end

endmodule

4. Write RTL for the 4 bits Ripple carry Adder using 1-bit Full adder and verify the same using a Testbench.
Ans:
Module code:

module full_adder(A, B, Cin, Sum, Cout);
    input A, B, Cin;
    output Sum, Cout;

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module ripple_carry_adder_4bit(A, B, Cin, Sum, Cout);
    input [3:0] A, B;    
    input Cin;           
    output [3:0] Sum;    
    output Cout;         

    wire c1, c2, c3;

    full_adder fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder fa1 (A[1], B[1], c1,  Sum[1], c2);
    full_adder fa2 (A[2], B[2], c2,  Sum[2], c3);
    full_adder fa3 (A[3], B[3], c3,  Sum[3], Cout);

endmodule


Testbench code:

module ripple_carry_adder_4bit_tb();
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder_4bit dut(A, B, Cin, Sum, Cout);

    initial begin
  
        A = 4'b0000; B = 4'b0000; Cin = 1'b0;
        
        #5 A = 4'b0011; B = 4'b0101; Cin = 1'b0; 
        
        #5 A = 4'b1111; B = 4'b0001; Cin = 1'b0; 
        
        #5 A = 4'b0111; B = 4'b1000; Cin = 1'b1; 
        
        #5 A = 4'b1010; B = 4'b0101; Cin = 1'b0; 
        
        #5 $finish;
    end

endmodule

5. Write RTL for 4:1 Mux using 2:1 Muxes and verify the same using a Testbench.
Ans:
Module code:

module mux_2x1(D0, D1, S, Y);
    input D0, D1, S;
    output Y;

    assign Y = (~S & D0) | (S & D1);
endmodule

module mux_4x1_struc(D, S, Y);
    input [3:0] D;   
    input [1:0] S;   
    output Y;       

    wire w0, w1;

    mux_2x1 mux0 (D[0], D[1], S[0], w0);
    mux_2x1 mux1 (D[2], D[3], S[0], w1);

    mux_2x1 mux2 (w0, w1, S[1], Y);

endmodule

Testbench code:

module mux_4x1_struc_tb();
    reg [3:0] D;
    reg [1:0] S;
    wire Y;

    mux_4x1_struc dut(D, S, Y);

    initial begin
       
        D = 4'b1010; 
        
        S = 2'b00;        
        #5 S = 2'b01;    
        #5 S = 2'b10;    
        #5 S = 2'b11;    
        
        #5 D = 4'b1100;
        
        #5 S = 2'b00;    
        #5 S = 2'b01;    
        #5 S = 2'b10;    
        #5 S = 2'b11;    
        
        #5 $finish;
    end

endmodule

6. Write RTL description and test bench for 3:8 Decoder.
Ans:
Module code:

module decoder_3x8(A, Y);
    input [2:0] A;       
    output reg [7:0] Y;  

    always @(*) begin
        case(A)
            3'b000: Y = 8'b00000001; 
            3'b001: Y = 8'b00000010; 
            3'b010: Y = 8'b00000100; 
            3'b011: Y = 8'b00001000; 
            3'b100: Y = 8'b00010000; 
            3'b101: Y = 8'b00100000; 
            3'b110: Y = 8'b01000000; 
            3'b111: Y = 8'b10000000; 
            default: Y = 8'b00000000; 
        endcase
    end

endmodule

Testbench code:

module decoder_3x8_tb();
    reg [2:0] A;
    wire [7:0] Y;

    decoder_3x8 dut(A, Y);

    initial begin

        A = 3'b000;
        #5 A = 3'b001;
        #5 A = 3'b010;
        #5 A = 3'b011;
        #5 A = 3'b100;
        #5 A = 3'b101;
        #5 A = 3'b110;
        #5 A = 3'b111;
        
        #5 $finish;
    end

endmodule

7. Write RTL description and testbench for 8:3 Priority encoder.
Ans:
Module code:

module pri_encoder_8x3(D, Y, Valid);
    input [7:0] D;
    output reg [2:0] Y;  
    output reg Valid;    

    always @(*) begin
        Valid = 1'b1; 
        
        if      (D[7]) Y = 3'b111;
        else if (D[6]) Y = 3'b110;
        else if (D[5]) Y = 3'b101;
        else if (D[4]) Y = 3'b100;
        else if (D[3]) Y = 3'b011;
        else if (D[2]) Y = 3'b010;
        else if (D[1]) Y = 3'b001;
        else if (D[0]) Y = 3'b000;
        else begin
            Y = 3'b000;
            Valid = 1'b0; 
        end
    end

endmodule

Testbench code:

module pri_encoder_8x3_tb();
    reg [7:0] D;
    wire [2:0] Y;
    wire Valid;

    pri_encoder_8x3 dut(D, Y, Valid);

    initial begin

        D = 8'b00000000;
        
        #5 D = 8'b10000000;
        #5 D = 8'b11111111; 
        
        #5 D = 8'b01111111; 
        #5 D = 8'b00101010; 
        #5 D = 8'b00010000; 
        #5 D = 8'b00001100; 
        #5 D = 8'b00000111; 
        #5 D = 8'b00000010; 
        #5 D = 8'b00000001; 
        
        #5 $finish;
    end

endmodule


Sequential Circuits:

1. Write RTL and Testbench for SR latch using Gate level modelling.
Ans:
Module code:

module sr_latch_gate(S, R, Q, Qbar);
    input S, R;
    output Q, Qbar;

    nor (Q, R, Qbar);
    nor (Qbar, S, Q);

endmodule

Testbench code:

module sr_latch_gate_tb();
    reg S, R;
    wire Q, Qbar;

    sr_latch_gate dut(S, R, Q, Qbar);

    initial begin

        S = 1'b1; R = 1'b0;
        #10 S = 1'b0; R = 1'b0;
        #10 S = 1'b0; R = 1'b1;
        #10 S = 1'b0; R = 1'b0;
        #10 S = 1'b1; R = 1'b1;
        
        #10 S = 1'b0; R = 1'b0;
        
        #10 $finish;
    end

endmodule

2. Write RTL and Testbench for JK Flip Flop, using parameter declaration for the respective scenarios (HOLD, TOGGLE, SET, RESET).
Ans:
Module code:

module jk_ff(J, K, clk, rst, Q, Qbar);
    input J, K;
    input clk;
    input rst;  
    output reg Q;
    output Qbar;

    parameter HOLD   = 2'b00;
    parameter RESET  = 2'b01;
    parameter SET    = 2'b10;
    parameter TOGGLE = 2'b11;

    
    assign Qbar = ~Q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 1'b0; 
        end else begin
            case ({J, K})
                HOLD:   Q <= Q;       
                RESET:  Q <= 1'b0;    
                SET:    Q <= 1'b1;    
                TOGGLE: Q <= ~Q;      
            endcase
        end
    end

endmodule

Testbench code:

module jk_ff_tb();
    reg J, K, clk, rst;
    wire Q, Qbar;

    jk_ff dut(J, K, clk, rst, Q, Qbar);

    always #5 clk = ~clk;

    initial begin
        clk = 0; 
        J = 0; 
        K = 0; 
        rst = 1; 
        #10 rst = 0;
        #10 J = 1; K = 0;
        #10 J = 0; K = 0;
        #10 J = 0; K = 1;
        #10 J = 0; K = 0;
        #10 J = 1; K = 1;
        #10 J = 1; K = 1;
        #10 $finish;
    end

endmodule

3. Write RTL and Testbench for for a T Flip Flop using D Flip Flop.
Ans:
Module code:

module d_ff(D, clk, rst, Q);
    input D, clk, rst;
    output reg Q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end
endmodule

module t_ff_using_d(T, clk, rst, Q, Qbar);
    input T, clk, rst;
    output Q, Qbar;

    wire d_in;

    assign d_in = T ^ Q;
    assign Qbar = ~Q;

    d_ff d1(d_in, clk, rst, Q);

endmodule

Testbench code:

module t_ff_using_d_tb();
    reg T, clk, rst;
    wire Q, Qbar;

    t_ff_using_d dut(T, clk, rst, Q, Qbar);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        T = 0;
        rst = 1;
        #10 rst = 0;
        #10 T = 1;
        #20 T = 0;
        #10 T = 1;
        #10 T = 0;
        #10 $finish;
    end

endmodule

4. Write RTL and Testbench for a 4-bit synchronous and loadable binary up counter.
Ans:
Module code:

module counter_4bit_sync_load(clk, rst, load, data_in, count);
    input clk;
    input rst;               
    input load;              
    input [3:0] data_in;     
    output reg [3:0] count;  

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;        
        end else if (load) begin
            count <= data_in;        
        end else begin
            count <= count + 1'b1;   
        end
    end

endmodule

Testbench code:

module counter_4bit_sync_load_tb();
    reg clk;
    reg rst;
    reg load;
    reg [3:0] data_in;
    wire [3:0] count;

    counter_4bit_sync_load dut(clk, rst, load, data_in, count);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        data_in = 4'b0000;
        #10 rst = 0;
        #40; 
        load = 1;
        data_in = 4'b1001;
        #10 load = 0;
        #80; 
        rst = 1;
        #10 rst = 0;
        #30 $finish;
    end

endmodule

5. Write RTL and Testbench to design a 4-bit MOD-12 loadable binary synchronous up counter.
Ans:
Module code:

module mod12_counter_sync_load(clk, rst, load, data_in, count);
    input clk;
    input rst;
    input load;
    input [3:0] data_in;
    output reg [3:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else if (load) begin
            count <= data_in;
        end else begin
            if (count == 4'd11) begin
                count <= 4'b0000; 
            end else begin
                count <= count + 1'b1;
            end
        end
    end

endmodule

Testbench code:

module mod12_counter_sync_load_tb();
    reg clk;
    reg rst;
    reg load;
    reg [3:0] data_in;
    wire [3:0] count;

    mod12_counter_sync_load dut(clk, rst, load, data_in, count);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        data_in = 4'b0000;
        #10 rst = 0;
        #140; 
        load = 1;
        data_in = 4'd9;
        #10 load = 0;
        #60; 
        #10 $finish;
    end

endmodule

6. Write RTL and Testbench to design a 4-bit loadable binary synchronous up-down counter
Ans:
Module code:

module up_down_counter_sync_load(clk, rst, load, up_down, data_in, count);
    input clk;
    input rst;               
    input load;              
    input up_down;           
    input [3:0] data_in;     
    output reg [3:0] count;  

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else if (load) begin
            count <= data_in;
        end else if (up_down) begin
            count <= count + 1'b1;   
        end else begin
            count <= count - 1'b1;  
        end
    end

endmodule

Testbench code:

module up_down_counter_sync_load_tb();
    reg clk;
    reg rst;
    reg load;
    reg up_down;
    reg [3:0] data_in;
    wire [3:0] count;

    up_down_counter_sync_load dut(clk, rst, load, up_down, data_in, count);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        up_down = 1; 
        data_in = 4'b0000;
        #10 rst = 0;
        #50; 
        up_down = 0;
        #50; 
        load = 1;
        data_in = 4'b1010;
        #10 load = 0;
        #40; 
        up_down = 1;
        #40 $finish;
    end

endmodule
Testbench code:


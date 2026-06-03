# FPGA Design Internship Tracker



Welcome to my internship repository! This space tracks my daily progress, learnings, and Verilog code assignments during my time as an intern.



##  Overview

Role: FPGA Design Intern 

Company: VIVEQA, Academy by Anmaya Technologies Private Limited 

Location: MUTBI (Manipal University Technology Business Incubator)

Duration: 1 month (Commenced June 1, 2026)



## Internship Scope

My work focuses on RTL design using Verilog, the complete FPGA design flow (simulation, synthesis, implementation), and hands-on experience with FPGA tools[cite: 14, 15, 16].



---



##  Daily Progress Log



### Day 1

* Introduction to FPGAs.

* Discussed the primary uses of FPGAs across different fields and their real-world applications.



### Day 2

* Reviewed number systems and methods for converting between them.

* Refreshed knowledge on basic logic gates.

* Studied different types of adder circuits and their logic.



### Day 3

* Deep dive into combinational logic: 4-bit ripple adders, encoders, decoders, and priority encoders.

* Learned about multiplexers (Mux) and demultiplexers (Demux).

* Introduced to the basics of Verilog programming.

* **Assignments Completed (Code & Testbenches included in repo):**

    1.  Designed a D Flip-Flop using a 2x1 Multiplexer.
    **verilog code: **
module dff_mux (
    input d,
    input clk,
    output q
);
    wire qm;
    assign qm = clk ? qm : d;
    assign q  = clk ? qm : q;
endmodule

**testbench:**
module tb;
    reg d, clk;
    wire q;
    
dff_mux uut (d, clk, q);

 always #5 clk = ~clk;

initial begin
 clk = 0; 
d = 0;
        
#15 d = 1; 
#20 d = 0; 
#20 $finish; 
    end
    
endmodule

  2.  Designed a circuit to delay a D Flip-Flop input until the 3rd positive clock edge (delivering the output on the 4th positive edge).

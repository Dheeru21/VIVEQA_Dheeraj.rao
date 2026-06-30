# FPGA Design Internship Tracker

Welcome to my internship repository. This space tracks my daily progress, the Verilog code I wrote, and the hardware concepts I learned during my time as an FPGA Design Intern.

## Overview
* **Role:** FPGA Design Intern  
* **Company:** VIVEQA, Academy by Anmaya Technologies Private Limited  
* **Location:** MUTBI (Manipal University Technology Business Incubator)  
* **Duration:** 1 month (Commenced June 1, 2026)

## Internship Scope
My work focused on RTL design using Verilog, the complete FPGA design flow (simulation, synthesis, implementation), and mapping code to real physical hardware. 

Here is a breakdown of the concepts covered and the projects I built:

### 1. Digital Logic Fundamentals
* **Number Systems & Boolean Algebra:** Handled conversions across Binary, Octal, Hexadecimal, and Gray code. Minimized logic using K-maps and Boolean postulates.
* **Combinational & Sequential Logic:** Designed full adders and decoders using multiplexers. Implemented D, T, and JK flip-flops (both posedge and negedge triggered) and built synchronous up/down counters from scratch.

### 2. Verilog RTL and Testbenches
* Built 4-bit ripple carry adders, priority encoders, and decoders using dataflow, structural, and gate-level modeling.
* Parameterized JK Flip-Flops and created MOD-12 loadable binary counters. 
* Wrote standard testbenches to verify all RTL logic prior to synthesis.

### 3. State Machines and Complex Systems
* **Vending Machine (Mealy FSM):** Wrote a complete FSM that tracks accumulated coins (1 to 4 rupees), dispenses an item at 3 rupees, and returns change if 4 rupees are inserted.
* **4-bit ALU:** Designed an Arithmetic Logic Unit capable of 12 different operations (addition, subtraction, bitwise logic, shifting, multiplication) with zero and negative flags.
* **Hardware Interfacing:** Built a multi-frequency LED blinker (where LEDs blink at 1Hz, 2Hz, 4Hz, and 8Hz simultaneously) and an adjustable blink speed controller using push buttons.

### 4. FPGA Architecture and Hardware Mapping
* **Target Board:** Worked with the Digilent Arty A7-100T. I learned how to write and modify `.xdc` constraint files to map top-level Verilog signals to the physical switches, buttons, and LEDs on the board.
* **Xilinx 7-Series Primitives:** Reviewed AMD/Xilinx documentation to understand how FPGAs handle complex tasks at the hardware level, specifically focusing on DSP48E1 Slices for signal processing and Block RAM (RAMB36E1) for memory storage.

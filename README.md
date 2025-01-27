# 4-bit-adder-subtractor
This Verilog module implements a 4-bit Adder-Subtractor circuit, allowing both addition and subtraction operations based on a control signal. The design uses simple combinational logic to compute the sum or difference of two 4-bit numbers.

Features
Supports 4-bit addition and subtraction.
Uses a mode control signal (mode):
mode = 0: Performs addition.
mode = 1: Performs subtraction.
Includes a carry-out/borrow-out (cout) to detect overflow.
Module Description
Ports:
Port	Direction	Width	Description
a	Input	4-bit	First operand
b	Input	4-bit	Second operand
mode	Input	1-bit	Mode control (0: Add, 1: Subtract)
sum	Output	4-bit	Result of the operation
cout	Output	1-bit	Carry-out or Borrow-out
How It Works:
In addition mode (mode = 0), the inputs a and b are added together.
In subtraction mode (mode = 1), b is first inverted (2's complement), and the addition operation is performed with a.
The carry-out (cout) serves as an overflow/borrow indicator.

Verilog Code
verilog
Copy
Edit
`timescale 1ns / 1ps

module adder_subtractor_4bit(
    input [3:0] a,
    input [3:0] b,
    input mode,
    output [3:0] sum,
    output cout
);
    wire [3:0] b_comp;      // Complement of b
    wire carry_in;          // Carry-in signal for addition/subtraction

    // Generate complement of b if mode = 1 (Subtraction)
    assign b_comp = b ^ {4{mode}};
    assign carry_in = mode; // Carry-in is 1 for subtraction, 0 for addition

    // Perform addition
    assign {cout, sum} = a + b_comp + carry_in;
endmodule
Simulation and Testing
Testbench verifies all possible cases for a, b, and mode:
Addition: a + b (e.g., 4'b1010 + 4'b0011).
Subtraction: a - b (e.g., 4'b1010 - 4'b0011).
Handles overflow and borrow detection.
Example Test Cases
a	b	mode	sum	cout
4'b0110	4'b0011	0	4'b1001	0
4'b0110	4'b0011	1	4'b0011	1
How to Use
Clone the repository.
Simulate the code using tools like ModelSim, Vivado, or any Verilog simulator.
Run the testbench to verify functionality.

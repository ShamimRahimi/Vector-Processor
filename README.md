# Vector Processor Project

This project implements a simple vector processor using Verilog. It consists of a Register File, ALU, Memory, and a Vector Processor module, along with a test bench to validate the functionality.

## Table of Contents

1. [Project Structure](#project-structure)
2. [Modules](#modules)
   - [Register_File](#register_file)
   - [ALU](#alu)
   - [Memory](#memory)
   - [Vector_Processor](#vector_processor)
3. [Installation and Usage](#installation-and-usage)

## Project Structure

1. **Register_File.v**: Implements a register file with 4 registers, each 512 bits wide. It supports reading from and writing to the registers.

2. **ALU.v**: Implements an Arithmetic Logic Unit (ALU) that performs addition and multiplication on 512-bit signed inputs.

3. **Memory.v**: Implements a memory module with 512 locations, each 32 bits wide, for storing and retrieving data.

4. **Vector_Processor.v**: Implements a vector processor that uses the register file, ALU, and memory modules to execute instructions.

5. **TB.v**: Test bench module to validate the functionality of the vector processor.

## Modules

### Register_File

```verilog
module Register_File(
    input wire clk,
    input wire reset,
    input wire [1:0] write_sel,
    input wire [511:0] write_data,
    input wire [1:0] write_sel2,
    input wire [511:0] write_data2,
    input wire write_en,
    input wire write_en2,
    input wire [1:0] read_sel,
    output wire [511:0] read_data,
    output signed [511:0] A1,
    output signed [511:0] A2,
    output signed [511:0] A3,
    output signed [511:0] A4
);
Implements a register file with 4 registers. It supports simultaneous reading and writing operations.

### ALU
module ALU(
    input signed [511:0] A1,
    input signed [511:0] A2,
    input wire [1:0] operation, // 00: Addition, 01: Multiplication
    output signed [1023:0] output_data
);
Performs addition and multiplication operations on 512-bit signed inputs.

### Memory
module Memory(
    input wire clk,
    input wire reset,
    input wire write_en,
    input wire read_en,
    input [8:0] address, // 9 bits for 512 locations
    input signed [511:0] write_data,
    output reg signed [511:0] read_data
);
Provides 512 memory locations, each 32 bits wide, for data storage and retrieva

### Vector_Processor
module Vector_Processor(
    input wire clk,
    input wire reset,
    input wire [12:0] instruction, // 00: load, 01: store, 10: addition, 11: multiplication
    output signed [511 : 0] A1,
    output signed [511 : 0] A2,
    output signed [511 : 0] A3,
    output signed [511 : 0] A4
);
Combines the register file, ALU, and memory modules to implement a vector processor capable of executing instructions.

## Installation and Usage
1. Clone the repository.
2. Open the project in your preferred Verilog simulation tool (e.g., ModelSim, Xilinx ISE).
3. Compile and simulate the TB.v file to verify the functionality of the vector processor.

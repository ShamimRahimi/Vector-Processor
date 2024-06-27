# Vector Processor Project

This project implements a simple vector processor using Verilog. It consists of a Register File, ALU, Memory, and a Vector Processor module, along with a test bench to validate the functionality.

## Table of Contents

1. [Project Structure](#project-structure)
2. [Modules](#modules)
   - [Register_File](#register_file)
   - [ALU](#alu)
   - [Memory](#memory)
   - [Vector_Processor](#vector_processor)
   - [TB (Test Bench)](#tb-test-bench)
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

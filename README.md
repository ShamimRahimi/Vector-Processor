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
4. [Prerequisites](#prerequisites)
5. [Contributing](#contributing)
6. [License](#license)
7. [Contact](#contact)

## Project Structure

1. **Register_File.v**: Implements a register file with 4 registers, each 512 bits wide. It supports reading from and writing to the registers.

2. **ALU.v**: Implements an Arithmetic Logic Unit (ALU) that performs addition and multiplication on 512-bit signed inputs.

3. **Memory.v**: Implements a memory module with 512 locations, each 32 bits wide, for storing and retrieving data.

4. **Vector_Processor.v**: Implements a vector processor that uses the register file, ALU, and memory modules to execute instructions.

5. **TB.v**: Test bench module to validate the functionality of the vector processor.

## Modules

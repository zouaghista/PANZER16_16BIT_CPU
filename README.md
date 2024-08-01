# PANZER16: A Simple 16-Bit CPU

## Introduction

**PANZER16** is my own take on learning how the most important component in modern devices works. I believe the best way to learn is by doing. Although **PANZER16** was created with my creativity and inspired by other designs, I did not follow any specific tutorials, making it an original design for me.

## Content

### Section 1: The CPU Itself

- **Architecture:**

**PANZER16** follows the Harvard Architecture principle.

![architecture](https://github.com/user-attachments/assets/bdacc754-b4da-477f-85f0-5d7155c62c1d)

- **Instruction Set**

**PANZER16** is a RISC processor following the instruction set below.

![Instruction](https://github.com/user-attachments/assets/a4ff4517-6ec8-4e02-9d9b-2bd68206934d)

*CFLAG*: Declares the existence of a 16-bit constant that will be used in the next instruction, replacing the first register parameter.

| Name      | Ends With | Function                                      |
| :-------- | :-------: | :-------------------------------------------- |
| mov       | 0000      | Moves values between registers                |
| add       | 0001      | Adds two unsigned values                      |
| sub       | 0010      | Subtracts two unsigned values                 |
| mul       | 0011      | Multiplies two unsigned values                |
| or        | 0100      | Performs bitwise OR                           |
| and       | 0101      | Performs bitwise AND                          |
| xor       | 0110      | Performs bitwise XOR                          |
| not       | 0111      | Performs bitwise NOT                          |
| compare   | 1000      | Compares two values                           |
| str       | 1001      | Stores a register value to memory             |
| load      | 1010      | Loads a value into a register from memory     |
| jump      | 1011      | Jumps to an instruction                       |
| Cjump     | 1111      | Conditional jump to an instruction (EQ, GT, GE) as argument |

- **Top File:** The main CPU file can be found at `/PANZER16/MainCPU.vhd`.

### Section 2: The Simulation Environment

Along with the VHDL files, a Verilog file (`/PANZER16/CPUTestbench.v`) contains a simulation environment where you can execute commands and view internal and external signals. This file includes:

- RAM and ROM simulation parts with 0-1023 addressing. You can increase the address range as needed. It also includes functions to inject and read memory directly for debugging and testing.
- A console located at address 1023 in memory. Writing an ASCII character there will result in output in your simulation console.

### Section 3: Small Assembly Editor

Written in .NET WinForms, this tool allows you to write assembly code more easily and converts the code into either binary or an injectable format that you can add to the test environment.

## Disclaimer

This project was an end-of-year project submission. It is not flawless and is not well optimized. I decided to post this version currently; however, I am working on a more optimized and easier-to-understand design.

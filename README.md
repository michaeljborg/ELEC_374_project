# ELEC 374 - 32-bit CPU Design Project

## Project Overview

This repository contains a complete 32-bit CPU design implementation for ELEC 374 (Digital Systems Design). The project demonstrates the design and implementation of a custom microprocessor with a comprehensive instruction set, including arithmetic operations, memory access, branching, and I/O capabilities.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Implementation Phases](#implementation-phases)
- [Instruction Set](#instruction-set)
- [Hardware Components](#hardware-components)
- [Simulation and Testing](#simulation-and-testing)
- [FPGA Implementation](#fpga-implementation)
- [Getting Started](#getting-started)
- [Development Tools](#development-tools)
- [Contributors](#contributors)

## Architecture

The CPU design follows a classic von Neumann architecture with the following key components:

### Core Components
- **Control Unit**: Manages instruction execution through a finite state machine
- **DataPath**: Contains registers, ALU, and data routing logic
- **Memory System**: 512x32-bit RAM with instruction and data storage
- **I/O System**: Input/output ports with seven-segment display support

### Key Features
- 32-bit data width and 9-bit address width
- 16 general-purpose registers (R0-R15)
- Special registers: PC, IR, MAR, MDR, HI, LO, Y, Z
- Comprehensive ALU with 15+ operations
- Memory-mapped I/O
- Branch and jump instructions
- Clock division for system timing

## Project Structure

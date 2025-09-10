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
ELEC_374_project/
├── System/ # Main system implementation

│ ├── System.v # Top-level system module

│ ├── CPU_Design.qpf # Quartus Prime project file

│ ├── DataPath_partition/ # DataPath implementation

│ │ ├── DataPath.v # Main DataPath module

│ │ ├── ALU_files/ # ALU components

│ │ ├── Bus_files/ # Bus multiplexer logic

│ │ └── Registers/ # Register implementations

│ ├── Control_unit_partition/ # Control unit implementation

│ │ ├── Control.v # Main control unit FSM

│ │ └── Control copy 2.v # Backup control unit

│ ├── Memory/ # Memory system

│ │ ├── RAM512x32.v # 512x32 RAM implementation

│ │ ├── instructions.txt # Instruction set documentation

│ │ └── .hex, .mif # Memory initialization files

│ ├── Testbench_CONTROL.v # Control unit testbench

│ ├── SystemTestBench.v # System-level testbench

│ └── Seven_Seg_Display_Out.v # Seven-segment display driver

├── Phase_1_SS/ # Phase 1 screenshots

├── Phase_2_SS/ # Phase 2 screenshots

├── Phase_3_SS/ # Phase 3 screenshots

├── Phase_4_SS/ # Phase 4 screenshots

└── 374_Tutrorial_files/ # Reference tutorial files



## Implementation Phases

The project was developed in four distinct phases, each building upon the previous:

### Phase 1: Basic ALU Operations
- **Focus**: Arithmetic and logical operations
- **Components**: ALU, basic register operations
- **Operations**: ADD, SUB, AND, OR, SHIFT, ROTATE
- **Testing**: Individual component verification

### Phase 2: Memory and Load/Store
- **Focus**: Memory interface and data movement
- **Components**: Memory controller, MAR, MDR
- **Operations**: LOAD, STORE, LOADI
- **Testing**: Memory access patterns and data integrity

### Phase 3: Control Flow
- **Focus**: Branching and program control
- **Components**: Branch logic, condition flags
- **Operations**: BRANCH, JUMP, JUMP_LINK
- **Testing**: Control flow verification

### Phase 4: Complete System Integration
- **Focus**: Full system integration and optimization
- **Components**: Complete CPU with all features
- **Operations**: All instruction types working together
- **Testing**: Comprehensive system testing

## Instruction Set

The CPU supports a comprehensive instruction set organized into categories:

### Memory Operations
- `LOAD`: Load from memory to register
- `LOADI`: Load immediate value
- `STORE`: Store register to memory

### Arithmetic Operations
- `ADD`: Addition
- `SUB`: Subtraction
- `MUL`: Multiplication (with HI/LO registers)
- `DIV`: Division (with HI/LO registers)

### Logical Operations
- `AND`: Bitwise AND
- `OR`: Bitwise OR
- `NEG`: Two's complement negation
- `NOT`: Bitwise NOT

### Shift Operations
- `SHL`: Shift left
- `SHR`: Shift right logical
- `SHRA`: Shift right arithmetic
- `ROL`: Rotate left
- `ROR`: Rotate right

### Control Flow
- `BRANCH`: Conditional branch
- `JUMP`: Unconditional jump
- `JUMP_LINK`: Jump and link (for subroutines)

### I/O Operations
- `INPORT`: Read from input port
- `OUTPORT`: Write to output port

## Hardware Components

### Control Unit (`Control.v`)
- **Function**: Manages instruction execution through finite state machine
- **States**: Reset, S0-S7 for different instruction phases
- **Features**: 
  - Instruction decoding
  - Control signal generation
  - State management
  - Branch condition handling

### DataPath (`DataPath.v`)
- **Function**: Data processing and routing
- **Components**:
  - 16 general-purpose registers (R0-R15)
  - Special registers (PC, IR, MAR, MDR, HI, LO, Y, Z)
  - ALU with 15+ operations
  - Bus multiplexer system
  - Condition flag logic

### Memory System (`RAM512x32.v`)
- **Function**: Instruction and data storage
- **Specifications**:
  - 512 words × 32 bits
  - Single-cycle access
  - Memory-mapped I/O support

### ALU Implementation
- **Operations**: ADD, SUB, AND, OR, NEG, NOT, SHL, SHR, SHRA, ROL, ROR, MUL, DIV
- **Features**: 
  - 32-bit arithmetic
  - Overflow detection
  - HI/LO register support for multiplication/division

## Simulation and Testing

### Testbenches
- **`Testbench_CONTROL.v`**: Comprehensive control unit testing
- **`SystemTestBench.v`**: System-level integration testing
- **`TESTBENCH_RAM.v`**: Memory system verification

### Testing Strategy
1. **Unit Testing**: Individual component verification
2. **Integration Testing**: Component interaction testing
3. **System Testing**: Full instruction set verification
4. **Performance Testing**: Timing and resource utilization

### Simulation Results
- All instructions verified through simulation
- Timing constraints met
- Resource utilization optimized
- Comprehensive test coverage achieved

## FPGA Implementation

### Target Platform
- **FPGA**: Intel Cyclone V (C5)
- **Tool**: Quartus Prime 18.1
- **Language**: Verilog HDL

### Implementation Results
- **Logic Elements**: Optimized for target FPGA
- **Memory Usage**: Efficient RAM utilization
- **Timing**: Meets all timing constraints
- **Power**: Optimized for low power consumption

### Pin Assignments
- Clock input
- Reset and control signals
- I/O ports
- Seven-segment display outputs

## Getting Started

### Prerequisites
- Quartus Prime 18.1 or later
- ModelSim or similar Verilog simulator
- Basic understanding of digital systems design

### Setup Instructions
1. Clone the repository
2. Open `System/CPU_Design.qpf` in Quartus Prime
3. Review the project structure and components
4. Run simulation using provided testbenches
5. Compile and program FPGA (if hardware available)

### Running Simulations
```bash
# Using ModelSim (example)
vlog System/System.v
vlog System/DataPath_partition/DataPath.v
vlog System/Control_unit_partition/Control.v
vlog System/Testbench_CONTROL.v
vsim Testbench_CONTROL
run -all
```

## Development Tools

### Primary Tools
- **Quartus Prime**: FPGA development and synthesis
- **ModelSim**: Verilog simulation and debugging
- **Git**: Version control and collaboration

### File Types
- **`.v`**: Verilog source files
- **`.qpf`**: Quartus Prime project files
- **`.qsf`**: Quartus Prime settings files
- **`.hex/.mif`**: Memory initialization files
- **`.sof`**: FPGA programming files

## Project Features

### Advanced Features
- **Pipelined Design**: Optimized for performance
- **Memory Management**: Efficient memory access patterns
- **Error Handling**: Robust error detection and recovery
- **Modular Design**: Easy to extend and modify

### Performance Characteristics
- **Clock Frequency**: Optimized for target FPGA
- **Instruction Throughput**: Efficient instruction execution
- **Memory Bandwidth**: Optimized memory access
- **Power Efficiency**: Low power consumption design

## Contributors

This project was developed as part of ELEC 374 coursework with collaborative development:

- **Joel**: Project collaborator (joined January 25th)
- **Team Members**: Additional contributors for lab collaboration

## Documentation

### Additional Resources
- **Phase Screenshots**: Visual documentation of each development phase
- **Tutorial Files**: Reference materials and examples
- **Memory Files**: Instruction and data examples
- **Test Results**: Comprehensive testing documentation

### Key Files to Review
1. `System/System.v` - Top-level system architecture
2. `System/Control_unit_partition/Control.v` - Control unit implementation
3. `System/DataPath_partition/DataPath.v` - DataPath implementation
4. `System/Memory/instructions.txt` - Complete instruction set reference
5. `System/Testbench_CONTROL.v` - Comprehensive testing framework

## Future Enhancements

Potential areas for future development:
- Additional instruction set extensions
- Performance optimizations
- Advanced debugging features
- Enhanced I/O capabilities
- Multi-core support

---

**Note**: This project represents a complete educational implementation of a 32-bit CPU design, demonstrating fundamental concepts in digital systems design, computer architecture, and FPGA implementation.

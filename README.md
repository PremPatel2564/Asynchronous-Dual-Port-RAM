# Asynchronous Dual Port RAM (DPRAM)

## Overview

This project implements an **Asynchronous Dual Port RAM (DPRAM)** in **Verilog HDL**. The design uses two independent clock domains, allowing memory access from two separate ports operating on different clocks.

The project demonstrates the implementation and functional verification of a dual-clock memory architecture commonly used in FPGA and ASIC designs.

---

## Features

- Asynchronous Dual Port RAM
- Independent clock domains (Port A & Port B)
- Parameterizable data width and memory depth
- Separate address and data buses
- Verilog testbench for functional verification
- Synthesizable RTL design

---

## Module Parameters

| Parameter | Default Value |
|-----------|--------------:|
| `WIDTH`   | 8 bits |
| `DEPTH`   | 256 locations |

---

## Project Files

```
Async_dpram.v   // RTL Design
Async_tb.v      // Testbench
README.md
```

---

## Simulation

Compile the design:

```bash
iverilog -o sim Async_dpram.v Async_tb.v
```

Run the simulation:

```bash
vvp sim
```

View the waveform:

```bash
gtkwave wave.vcd
```

---

## Verification

The testbench verifies:

- Memory write operation
- Memory read operation
- Independent clock operation
- Functional behavior of the dual-port memory

---

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code

---

## Author

**Prem Patel**

RTL Design • Digital Verification • Verilog 

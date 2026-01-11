# UART Design & Verification using SystemVerilog (OOP Testbench)

## 🔹 Project Overview

This project implements a complete **UART Transmitter and Receiver** along with a **SystemVerilog class-based verification environment**.  
The goal is to demonstrate both **RTL design skills** and **modern verification methodology** using object-oriented programming concepts.

The testbench sends the string:


through the UART transmitter and verifies correct reception using a **Generator – Driver – Monitor – Scoreboard** architecture.

---

## 🔹 Key Features

### ✔ UART Design
| Feature | Value |
|------|------|
| Clock Frequency | 50 MHz |
| Baud Rate | 1 Mbps |
| Data Format | 1 Start bit, 8 Data bits, 1 Stop bit |
| Sampling Method | Mid-bit sampling |
| Loopback Mode | TxD connected internally to Rx |

---

### ✔ Verification Architecture

| Component | Role |
|-------|------|
| `uart_transaction` | Holds transmitted and received byte |
| `generator` | Generates characters "K R U P A L" |
| `driver` | Drives data into UART transmitter |
| `monitor` | Captures received UART bytes |
| `scoreboard` | Compares expected vs actual output |
| `environment` | Connects all components |

Mailbox communication is used between blocks.

---

## 🔹 Directory Structure


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
uart-systemverilog-verification/
|
|-- design
|   |-- uart_design.sv
|
|-- tb
|   |-- uart_tb.sv
|
|-- sim
|   |-- run.do
|
|-- README.md





---

## 🔹 How Simulation Works

1. Generator creates transactions with characters **K R U P A L**
2. Driver waits for UART idle and sends data
3. UART Transmitter serializes the data
4. UART Receiver samples mid-bit and reconstructs byte
5. Monitor captures received data
6. Scoreboard verifies correctness

---




---

## 🔹 Sample Output
| Index | Expected | Status |
| ----- | -------- | ------ |
| 1     | K        | PASS   |
| 2     | R        | PASS   |
| 3     | U        | PASS   |
| 4     | P        | PASS   |
| 5     | A        | PASS   |
| 6     | L        | PASS   |



---

## 🔹 Skills Demonstrated

✔ UART Protocol  
✔ RTL Design  
✔ SystemVerilog OOP Testbench  
✔ Mailbox based communication  
✔ Driver-Monitor-Scoreboard Architecture  
✔ Self-checking testbench  

---

## 🔹 Future Enhancements

- Add random constrained test generation  
- Add error injection (frame error, parity error)  
- Add functional coverage  
- Support variable baud rates  
- Separate Tx and Rx clocks  

---

## 👨‍🎓 Author

**Krupal Ashokkumar Babariya**  
MSc in Electrical & Microsystems Engineering  

---  
This project is created for academic learning and verification practice.




# 🧮 x86-calculator-v1.0

### A simple calculator built entirely in **x86 Assembly language** (MASM/TASM) that performs basic arithmetic operations and displays results in **Decimal**, **Binary**, and **Hexadecimal** formats.

---

## ⚙️ Features  

✅ **Menu-driven Interface**  
- User-friendly design with ASCII-art layout  
- Supports:  
  - ➕ Addition  
  - ➖ Subtraction  
  - ✖️ Multiplication  
  - ➗ Division  

✅ **Multi-format Output**  
- Results displayed in:  
  - **Decimal**  
  - **Binary**  
  - **Hexadecimal**

✅ **Error Handling**  
- Prints `"Error 404!"` for invalid inputs or operations  

✅ **Loop Support**  
- Repeat calculations without restarting the program  

---

## 🧰 Tech Stack  

| Component | Description |
|------------|-------------|
| **Language** | Assembly (x86, 16-bit) |
| **Assembler** | MASM / TASM |
| **Emulator / IDE** | EMU8086, DOSBox |
| **Platform** | DOS Environment |

---

## 📜 Program Flow  
<img width="644" height="372" alt="Screenshot 2025-10-07 003834" src="https://github.com/user-attachments/assets/c5874edc-27a3-4e84-a522-07fe1e1a1e22" />
<img width="641" height="372" alt="Screenshot 2025-10-07 003921" src="https://github.com/user-attachments/assets/4719917d-0af6-4904-8be5-9bb9994748a5" />
<img width="644" height="372" alt="Screenshot 2025-10-07 004004" src="https://github.com/user-attachments/assets/3b5cde74-a96a-43d7-8a95-80b201fc56a9" />


➡️ Type `1` to continue or `2` to exit.

<img width="640" height="73" alt="Screenshot 2025-10-07 004026" src="https://github.com/user-attachments/assets/d8cac572-b5cd-43b8-9b9e-13f464338c45" />

➡️ User chooses an operation → enters two numbers → result shown in three formats.  


---

## 🧩 Code Overview  

| Section | Purpose |
|----------|----------|
| `.DATA` | All messages, prompts, and ASCII labels |
| `.CODE` | Core logic for arithmetic and display |
| `MAIN PROC` | Entry point |
| `ADDD`, `SUBB`, `MULL`, `DIVV` | Handles each arithmetic operation |
| `DR`, `BR`, `HR` | Output results in Decimal, Binary, Hexadecimal |
| `TNX` | Displays exit message |
| `NL`, `BR1`, etc. | Utility subroutines for newline and conversions |

---

## 🚀 Running the Program  

### ▶️ **Option 1: EMU8086**
1. Open EMU8086 IDE  
2. Paste your code into a new file (`calculator.asm`)  
3. Assemble and run (`F5` or "Run")  
4. Follow on-screen instructions  

### ▶️ **Option 2: DOSBox + TASM/MASM**
```bash
tasm calculator.asm
tlink calculator.obj
calculator.exe

```
###👨‍💻 Author

Developed by: https://github.com/eshat69

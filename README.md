# 💡 RTL Design Projects using Verilog, Icarus Verilog & GTKWave

This repository contains a collection of basic Verilog projects focused on digital logic design. All designs are written in Verilog HDL and simulated using **Icarus Verilog** and **GTKWave**. These mini-projects are part of my VLSI learning journey using open-source tools.

---

## 🛠️ Tools Used

- **Verilog HDL** – For writing RTL logic and testbenches
- **Icarus Verilog** – Open-source Verilog compiler and simulator
- **GTKWave** – Waveform viewer for visualizing signal activity

---

## 🧠 Concepts Covered
- Structural modeling
- Testbench design
- Simulation using Icarus Verilog
- Visual debugging with GTKWave

## 🔧 Installation (Ubuntu/Debian)

### Install Icarus Verilog:
```
sudo apt update
sudo apt install iverilog
```
### Install GTKWave:
```
sudo apt install gtkwave
```
## 📁 Project Structure Example
Each project is organized in its own folder:
```
project/
├── project.v             # Verilog logic file
├── project_tb.v          # Testbench file
├── run.sh                 # Compile & simulate script
├── project_output.vcd             # Waveform dump file (auto-generated)
├── waveform.png           # Screenshot of GTKWave 
```

## ⚙️ Example Project – Inverter

Organize your project by running this commands. Assuming Home is current directory. 

```
cd Documents
mkdir Digital_Design_Verilog
cd Digital_Design_Verilog
mkdir inverter
cd inverter
```
Create our (`inverter.v`) file using this command and start writing verilog code.

```
nano inverter.v
```

### 🔌 Verilog Code – inverter.v
```
module inverter (

input wire a,
output wire y

);

assign y = ~a;

endmodule
```
Save the file by (`ctrl+o and enter`). And exit from file using (`ctrl+x`).

Create testbench verilog file using same command and start writing testbench:
```
nano inverter_tb.v
```

### 🧪 Testbench – inverter_tb.v

```
`timescale 1ns/100ps 

module inverter_tb;

reg a;
wire y;

inverter u0_DUT(

.a(a),
.y(y)

);

initial begin

 $dumpfile("test_inv.vcd");
 $dumpvars(0,inverter_tb);

a = 1'b0;

#5 a = 1'b1;
#5 a = 1'b0;
#5 $finish;
end

endmodule

```

Save and exit.

### ▶️ Running the Simulation
#### Step 1: Compile the design and testbench
```
iverilog -o inverter_wave inverter.v inverter_tb.v
```
#### Step 2: Run the simulation
```
vvp inverter_wave
```
#### Step 3: View waveform in GTKWave
```
gtkwave test_inv.vcd
```
#### Inside GTKWave:

- Load signals from the module (inverter_tb)
- Add inputs/outputs (a, y) to the waveform panel
- Zoom in/out to analyze the timing and logic transitions

## 📌 Notes
- The .vcd file will be generated as part of the simulation and can be opened in GTKWave for waveform analysis.
- Modify testbench signals to test different scenarios and observe the results in GTKWave.

## 🤖 Projects in this Repo

- Inverter
- AND logic
- OR logic
- NAND logic
- NOR logic
- XOR logic
- XNOR logic
- Half Adder
- Full Adder
- 2x1 Mux
- 4x1 Mux
- D Flip Flop
- More is coming soon...

## 📬 Contact
Feel free to reach out to me for any questions, feedback, or contributions.

- Email: dattpanchal2904@gmail.com
- [LinkedIn](https://www.linkedin.com/in/dattpanchal04/)
- [GitHub](https://github.com/DuttPanchal04)
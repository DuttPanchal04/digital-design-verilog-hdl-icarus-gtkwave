# 💡 Digital Design using Verilog HDL, Icarus Verilog & GTKWave

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
// Simple Inverter Module
// This module implements a NOT gate (inverter) in Verilog.
// It takes a single input 'a' and outputs the inverted value on 'y'.

module inverter (
    input wire a,   // Input signal 'a'
    output wire y   // Output signal 'y', which is the logical NOT of 'a'
);

// Perform inversion: output 'y' is the bitwise NOT of input 'a'
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
`timescale 1ns/100ps  // Time unit = 1ns, time precision = 100ps

// Testbench for the inverter module
module inverter_tb;

reg a;        // Test input signal (reg type because we drive it in initial block)
wire y;       // Output from the inverter (connected to DUT)

inverter u0_DUT (
    .a(a),     // Connect testbench input 'a' to inverter input
    .y(y)      // Connect testbench output 'y' to inverter output
);

initial begin
    // Initialize waveform dump file for viewing in GTKWave or similar tools
    $dumpfile("test_inv.vcd");   // Name of the waveform dump file
    $dumpvars(0, inverter_tb);   // Dump all variables in the inverter_tb hierarchy

    // Display a message when simulation starts
    $display("Starting Inverter Testbench...");

    // Monitor changes in signals 'a' and 'y', prints every time they change
    $monitor("Time = %0t | a = %b -> y = %b", $time, a, y);

    // Apply test vectors
    a = 1'b0;    // Set input 'a' to 0
    #5 a = 1'b1; // Wait 5ns, then set 'a' to 1
    #5 a = 1'b0; // Wait another 5ns, then set 'a' back to 0

    #5 $finish;  // Finish simulation after 5ns
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

![Inverter Output Waveform](https://github.com/user-attachments/assets/e3ae64e7-2831-4886-ba67-6838db1c0faa)

Follow the same steps for all other projects ( e.g. AND, OR, D_FF, Mux, etc. ) from creating verilog file and testbench file to compile and simulate on Gtkwave software.

## 📌 Notes
- The .vcd file will be generated as part of the simulation and can be opened in GTKWave for waveform analysis.
- Modify testbench signals to test different scenarios and observe the results in GTKWave.

## 🤖 Projects in this Repo

- All Basic and Universal Gates ( e.g. Inverter, AND, OR, NAND, NOR, XOR, XNOR )
- Half and Full Adder
- 2x1 Mux and 4x1 Mux
- D Flip Flop
- One and Four Bit Comparator
- Binary Counter
- More coming soon..

## 🤝 Connect & Collaborate

I believe in the power of open-source collaboration! If you're passionate about digital design or Verilog, feel free to:

- **Open Issues**: If you spot a bug or want to request a new feature, feel free to open an issue.
- **Submit Pull Requests**: If you improve the code, add more projects, or optimize existing ones, don't hesitate to submit a pull request.
- **Fork & Customize**: Fork this repository and customize it for your own learning or project needs.

Collaborating helps me improve, and I’d love to connect with other like-minded individuals in the digital design space!

---

## 🔧 Improve This Project

This repository is a starting point for digital design with Verilog. There are plenty of opportunities to expand and enhance these projects:

- Add more complex designs like **ALUs**, **multiplexers**, or **finite state machines**.
- Improve the testbenches to cover more corner cases and edge cases.
- Integrate more advanced simulation tools or scripts.
- Provide detailed explanations of the waveforms for each project.

Feel free to contribute in any way, whether it's improving documentation, fixing bugs, or adding new functionality. Every contribution counts!

Let's build, learn, and grow together!


## 📬 Contact
Feel free to reach out to me for any questions, feedback, or contributions.

- Email: dattpanchal2904@gmail.com
- [LinkedIn](https://www.linkedin.com/in/dattpanchal04/)
- [GitHub](https://github.com/DuttPanchal04)

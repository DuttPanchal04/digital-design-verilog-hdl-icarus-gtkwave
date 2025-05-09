# 💡 RTL Design to Gate-Level Synthesis using Icarus Verilog HDL, GTKWave & Yosys (Open-Source Project)

This repository showcases the complete RTL design, simulation, and gate-level synthesis of various digital logic modules using free and open-source EDA tools such as Icarus Verilog, Gtkwave, and Yosys.

---

## 🛠️ Tools Used

| Tool            | Purpose                           |
|-----------------|------------------------------------|
| Verilog (.v)    | Hardware design (RTL)              |
| Icarus Verilog  | RTL simulation                     |
| GTKWave         | Waveform visualization             |
| Yosys           | RTL-to-gate-level synthesis        |
| Graphviz ( optional )        | Visualizing logic schematics (.svg)|

---

## 📂 Repository or Project Structure

Each module ( e.g. ALU, MUX, Gates, Counter, etc.) is located in its own folder and contains:

- `module.v`: Verilog RTL code
- `module_tb.v`: Testbench
- `module.vcd`: Output waveform from Icarus + Gtkwave simulation
- `waveform.png`: GTKWave screenshot
- `module.ys`: Yosys synthesis script
- `module_synth.v`: Gate-level netlist
- `module.blif`: Logic netlist format
- `module.json`: JSON netlist (for OpenROAD/backend)
- `module_yosys_show.png`: Gate-level logic schematic (Yosys `show`)

## 🔍 Sample: Inverter Module

| Artifact        | Description                  |
|-----------------|------------------------------|
| `inverter.v`         | RTL Verilog code             |
| `inverter_tb.v`      | Testbench                    |
| `test_inv.vcd`       | Waveform from simulation     |
| `Inverter Output Waveform.png`  | Screenshot from GTKWave      |
| `inverter_synth.v`   | Gate-level netlist (Yosys)   |
| `inverter.json`      | Synthesis netlist in JSON    |
| `inverter.blif`   | Logic level netlist ( Yosys )   |
| `inverter.png`       | Gate-level schematic         |
| `inverter_synth.ys`        | Yosys synthesis script       |

## 🧪 Simulated & Synthesized Modules

- ✅ 2-bit/4-bit/8-bit ALU
- ✅ 2:1 and 4:1 Multiplexers
- ✅ All Basic and Universal Logic Gates (AND, OR, NOT, etc.)
- ✅ 4-bit Binary Up Counter
- ✅ 1-bit/4-bit Comparator
- ✅ Half Adder and Full Adder
- ✅ Clock Divider, etc.

Each of these modules has been:
- Designed in Verilog
- Simulated using Icarus Verilog + GTKWave
- Synthesized using Yosys
- Verified at both RTL and gate-level

## 🧠 Concepts Covered
- Structural modeling
- Testbench design
- Simulation using Icarus Verilog
- Visual debugging with GTKWave
- Sythesis using Yosys

---

## ⚙️ Example Project – Inverter ( Part-I: RTL Design using Icarus Verilog and Simulation using Gtkwave )

### 🔧 Installation (Ubuntu/Debian)

#### Install Icarus Verilog:
```
sudo apt update
sudo apt install iverilog
```
#### Install GTKWave:
```
sudo apt install gtkwave
```
Done installation. Next step:

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

#### 🔌 Verilog Code – inverter.v
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

#### 🧪 Testbench – inverter_tb.v

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

#### ▶️ Running the Simulation
##### Step 1: Compile the design and testbench
```
iverilog -o inverter_wave inverter.v inverter_tb.v
```
##### Step 2: Run the simulation
```
vvp inverter_wave
```
##### Step 3: View waveform in GTKWave
```
gtkwave test_inv.vcd
```
##### Inside GTKWave:

- Load signals from the module (inverter_tb)
- Add inputs/outputs (a, y) to the waveform panel
- Zoom in/out to analyze the timing and logic transitions

![Inverter Output Waveform](https://github.com/user-attachments/assets/e3ae64e7-2831-4886-ba67-6838db1c0faa)

Follow the same steps for all other projects ( e.g. AND, OR, D_FF, Mux, etc. ) from creating verilog file and testbench file to compile and simulate on Gtkwave software.

## 🔧 Example Inverter Project ( Part 2: RTL to Gate-Level Synthesis Using Yosys )

This section covers how to install **Yosys**, synthesize your Verilog RTL design (e.g., inverter), and generate gate-level artifacts for visualization and backend flows.

---

### 🛠️ Step 1: Install Yosys

#### ✅ Method 1: APT (Quick Install)

```
sudo apt update
sudo apt install yosys
```
This installs a stable version available via Ubuntu's package manager.

#### ✅ Method 2: Build Latest from Source (Recommended)
```
sudo apt install -y build-essential clang bison flex libreadline-dev \
  gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 python3-pip \
  libboost-system-dev libboost-python-dev libboost-filesystem-dev

# Clone and build Yosys
git clone https://github.com/YosysHQ/yosys.git
cd yosys
git submodule update --init --recursive
make -j$(nproc)
sudo make install
```
Verify Installtion using:
```
yosys -V
```

### 📜 Step 2: Create Yosys Script
Create a file named inverter.ys with the following content:

```
# Step 1: Read the RTL Verilog source file
read_verilog inverter.v

# Step 2: Synthesize the design and specify the top-level module name
synth -top inverter

# Step 3: Write the synthesized gate-level netlist in JSON format
# Useful for backend tools like OpenROAD
write_json inverter.json

# Step 4: Write the synthesized netlist as Verilog
# This can be used for gate-level simulation
write_verilog inverter_synth.v

# Step 5: Display a logic-level schematic of the synthesized design
# Requires xdot and Graphviz installed
show

```

### ▶️ Step 4: Run Synthesis
Execute the script:
```
yosys inverter.ys
```
This command will:

- Read the RTL Verilog
- Synthesize it to gate-level netlist
  
Write outputs:

- inverter_synth.v – synthesized gate-level Verilog
- inverter.json – JSON-formatted netlist
- Schematic (viewed with show)

![inverter yosys_show](https://github.com/user-attachments/assets/71bc1e1d-ae4d-430c-9334-ce370b4f8a61)

### 🖼️ Step 5: View Gate-Level Schematic (Optional)
To launch the graphical schematic from within Yosys:

```
yosys
```
Then in the Yosys shell:
```
read_verilog inverter.v
synth -top inverter
show
```

This will open a logic-level schematic (e.g., showing $NOT, $AND, etc.) using xdot.

## 📌 Notes
- The .vcd file will be generated as part of the simulation and can be opened in GTKWave for waveform analysis.
- Modify testbench signals to test different scenarios and observe the results in GTKWave.

## 🚀 What's Next

- ⏳ Gate-level simulation using synthesized `.v` netlists
- ⏳ Layout generation with OpenROAD and Sky130 PDK
- ⏳ Static timing analysis using OpenSTA
- ⏳ Open-source chip tape-out (future goal)

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

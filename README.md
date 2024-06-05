# GNN-ACCELARATOR
A miniature Graph Neural Network (GNN) using embedded Deep Neural Network (DNN) nodes is implemented to schedule tasks in multiprocessors. The GNN is designed as a hierarchical module consisting of embedded DNNs interacting with each other in a pipelined fashion. The logic is the synthesized and placed on a layout.


Design Objective:
We sought to develop the fastest possible design, within power constraints. This was demonstrated through our implementation at each design step. We optimized our pipelined design at the RTL and design-compiler level. The final values and design we arrived at is considered to be optimal for our given design objectives. 


RTL implementation:
We designed our GNN via hierarchical fashion. The DNN submodules were first designed, and then connected in one, large GNN module. In order to optimize for speed, we decided to make our pipeline as wide as possible, and thus finish operations within shorter time. Thus, our design executed within 2.5 clock cycles, rather than a standard design which would take around 5-6 cycles to execute. This improved speed came at the risk of increased leakage power, and thus, we focussed on optimizing for power in the design compiler stage.



Synthesis:
In order to make our design more power-efficient, we first enable clock gating for the design. This ensured that the clock was stopped in stages where the data was not toggling. In order to further reduce power, we applied an area constraint in our second compile instruction to increase the density of the circuit, and thus minimize leakage due to dissipation between interconnects. Finally, we ran several compile efforts, and set them to use the prior compile’s optimized values for each run. We successfully managed to reduce power from 2.6 mW to 2.02 mW. On observing the results of the first run, it was found that timing was being met comfortably. Seeing this as an opportunity to further improve speed, the clock period was reduced from 2000ps to 1450ps. Speed was further improved when output load was slightly reduced— it was found that this reduction did not significantly compromise power.


Automatic Place and Route (APR):
Once the gate-level netlist was implemented in the layout using the APR tool, we sought to optimize for power by modifying the number of standard cell rows under the constraint of DRC parameters.


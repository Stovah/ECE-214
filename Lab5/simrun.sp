***** Spice Netlist for Cell 'Lab5' *****

************** Module Lab5 **************
xi0 n1 n0 vsup gnd vout1 tl082 
xi1 n0 n2 vsup gnd vout2 tl082 
r0 vout1 n2 1k noisy=0
v0 vsup gnd dc='10' ac='0' 
c0 n2 vout2 0.1uf ic=0
r1 vsup n0 1k noisy=0
r2 n0 gnd 1k noisy=0
r3 n1 vout1 10k noisy=0
r4 n1 vout2 6k noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 10u 125m 25m
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


***** Spice Netlist for Cell 'Lab4_figure2' *****

************** Module Lab4_figure2 **************
r0 gnd n0 10k noisy=0
r1 n0 n3 10k noisy=0
v1 n1 gnd dc='10' ac='0' 
r2 vout n2 10k noisy=0
v0 vin gnd dc='0' ac='1' 
v2 n3 gnd dc='10' ac='0' 
xi0 n2 n0 n1 gnd vout opamp1 
r3 n2 vin 4k noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.dc V0 10 0 -.1
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


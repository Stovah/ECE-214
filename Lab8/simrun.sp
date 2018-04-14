***** Spice Netlist for Cell 'Lab8' *****

************** Module Lab8 **************
v0 n1 gnd dc='12' ac='1' 
r0 n0 n1 1k noisy=0
r1 vout n1 1k noisy=0
x0 vout vc1 gnd 2n7000_mod 
x1 n0 vc2 gnd 2n7000_mod 
r2 vc1 n1 60k noisy=0
r3 vc2 n1 60k noisy=0
r4 gnd vc1 30k noisy=0
r5 gnd vc2 30k noisy=0
c0 vc2 vout 470pf ic=0
c1 n0 vc1 1.5nf ic=0





.IC V(vc1) = 0
.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 1u 0.5m 0
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


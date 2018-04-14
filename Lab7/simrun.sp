***** Spice Netlist for Cell 'Lab7' *****

************** Module Lab7 **************
r1 n1 n2 50 noisy=0
x0 n4 n2 n3 irfl110 
r2 gnd n3 1 noisy=0
d0 n4 vout 1n4004rl 
v0 n0 gnd dc='12' ac='1' 
r0 n0 n5 2.51 noisy=0
l0 n5 n4 1mh 
c0 gnd vout 10uf ic=0
v1 n1 gnd ac 0v pulse 0v 5v 0ns 1ns 1ns 19.08us 34.62us 
r3 gnd vout 506 noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 1u 6m 0
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


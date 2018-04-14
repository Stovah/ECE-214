***** Spice Netlist for Cell 'Lab7_post' *****

************** Module Lab7_post **************
r0 n1 n2 50 noisy=0
x0 n4 n2 n3 irfl110 
d0 n4 n5 1n4004rl 
v0 n0 gnd dc='12' ac='1' 
c0 gnd n5 10uf ic=0
l0 n6 n4 1.0048mh 
r1 gnd n3 1.1 noisy=0
r4 n5 vout 179 noisy=0
c1 gnd vout 0.338uf ic=0
r3 gnd n5 610.8 noisy=0
v1 n1 gnd ac 0v pulse 0v 5v 0ns 1ns 1ns 23.2us 34.62us 
r2 n0 n6 6 noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 1u 10m 0
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


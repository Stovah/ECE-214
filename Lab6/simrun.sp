***** Spice Netlist for Cell 'Lab6' *****

************** Module Lab6 **************
r0 vg va 50 noisy=0
r1 va n1 res1 noisy=0
r2 n0 vc res2 noisy=0
c0 gnd n0 cap ic=0
l0 n1 vc ind 
v0 vg gnd ac 1v pulse 0v 1v 10us 0.1us 0.1us 0.625ms 1.25ms 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.ac dec 200 1000 1e6
.global gnd
.param res1=1.59e-07
.param res2=2.51
.param cap=3.36e-07
.param ind=0.001005
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


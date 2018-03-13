***** Spice Netlist for Cell 'Lab3_AC' *****

************** Module Lab3_AC **************
r0 vin n0 50 noisy=0
r1 n0 n1 res1 noisy=0
r2 n1 vout res2 noisy=0
c0 gnd n1 cap1 ic=0
c1 gnd vout cap2 ic=0
v0 vin gnd ac 1v pulse -2v 2v 0ns 0.1us 0.1us 0.625ms 1.25ms 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.ac dec 200 100 1e5
.global gnd
.param res1=10000
.param res2=200000
.param cap1=2.2e-08
.param cap2=1.2e-09
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


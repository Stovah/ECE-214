***** Spice Netlist for Cell 'Lab1' *****

************** Module Lab1 **************
r0 vin node1 30 noisy=0
c0 gnd node1 99.3pf ic=0
c1 gnd vout 102.2pf ic=0
r3 gnd vout 1meg noisy=0
c2 gnd vout 13pf ic=0
v0 vin gnd dc 0v ac 1v sin('0v' '1v' '1k' '0s') 
r1 node1 vout res noisy=0
r2 gnd vout res noisy=0





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 60u 20m
.global gnd
.param res=1e+07
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


***** Spice Netlist for Cell 'Lab2' *****

************** Module Lab2 **************
r0 vin va 50 noisy=0
r1 va vb 160k noisy=0
c0 gnd vb 1.5nf ic=0
vin vin gnd dc 0v ac 1v sin('0v' '4v' 'freq' '0s') 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 2.5e-08 0.00115 0.001 0
.global gnd
.param freq=40000
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


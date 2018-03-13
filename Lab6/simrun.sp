***** Spice Netlist for Cell 'Lab6' *****

************** Module Lab6 **************
r0 n1 va 50 noisy=0
r1 va n2 0 noisy=0
r2 vc n0 0 noisy=0
l0 n2 vc 1mh 
c0 gnd n0 0.33uf ic=0
v0 n1 gnd dc 0v ac 1v sin('0v' '1v' 'freq' '0s') 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 10u 125m 25m
.global gnd
.param freq=40000
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


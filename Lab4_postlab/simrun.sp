***** Spice Netlist for Cell 'Lab4_postlab' *****

************** Module Lab4_postlab **************
xi0 gnd n2 n0 n1 vout tl082 
v0 n0 gnd dc='10' ac='0' 
v1 gnd n1 dc='10' ac='0' 
r0 vin n2 1k noisy=0
c0 n2 vout 0.1uf ic=0
r1 n2 vout 1meg noisy=0
v2 vin gnd ac 1v pulse -1v 1v 0ns 1ms 0.1ns 0.1ns 1ms 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 10u 125m 25m
.global gnd
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


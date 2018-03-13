***** Spice Netlist for Cell 'Lab1_measured' *****

************** Module Lab1_measured **************
rfg vin node1 30 noisy=0
cp1 gnd node1 99.3pf ic=0
ra node1 vout 9.87k noisy=0
rb gnd vout 9.88k noisy=0
cp2 gnd vout 102.2pf ic=0
ros gnd vout 1meg noisy=0
cos gnd vout 13pf ic=0
vs vin gnd dc 0v ac 1v sin('0v' '1v' '1k' '0s') 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 60u 20m
.global gnd
.param res=1e+07
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op

.end


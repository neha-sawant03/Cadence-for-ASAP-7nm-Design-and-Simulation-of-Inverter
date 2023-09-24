** Run Inverter file
* Worst case temperature of 110C
.TEMP 110
.OPTION INGOLD=2 ARTIST=2 PSF=2 MEASOUT=1 PARHIER=LOCAL PROBE=0 MARCH=2 ACCURACY=1 POST RUNLVL=5

* Typical NMOS, typical PMOS process corner model file
.INCLUDE /home/class/ee5323ta/ASAP7_PDKandLIB_v1p6/asap7PDK_r1p6/models/hspice/7nm_TT.pm
* Slow NMOS, slow PMOS process corner model file
*.INCLUDE /home/class/ee5323ta/ASAP7_PDKandLIB_v1p6/asap7PDK_r1p6/models/hspice/7nm_SS.pm
* Fast NMOS, fast PMOS process corner model file 
*.INCLUDE /home/class/ee5323ta/ASAP7_PDKandLIB_v1p6/asap7PDK_r1p6/models/hspice/7nm_FF.pm
.INCLUDE inverter.sp
V1 A 0 PULSE(0 0.7V 10p 10p 10p 40p 100p)
V2 VDD 0 0.7V
V3 VSS 0 0V
* Small 1fF output capacitance for realistic simulation
C1 Y 0 1fF
.OP
.TRAN 0.1p 300ps
.END


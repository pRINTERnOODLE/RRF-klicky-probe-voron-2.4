M574 Z0 C"nil" ; no Z endstop switch, free up Z endstop input
M558 P5 C"e1_stop" I0 H0.8 R0.1 F120 T99999 A30 S0.001 B1
G31 P1000 X0 Y0 Z2.92	;	S25 T0.0033 H2 for temp offset
; Resume macro file
M915 E0 S5													;	set stall sensitivity
M913 E90													;	motor current to 90%
G1 H1 E150 F2000											;	extrude to a stall
M913 E100													;	return motor current to full
m98 P"/macros/wipe/quick_flick.g"
G1 R1 X0 Y0 Z2 F99999										;	move 2mm above last print move
G1 R1 X0 Y0 Z0 F99999										;	go to last print move
M83															;	relative extruder moves
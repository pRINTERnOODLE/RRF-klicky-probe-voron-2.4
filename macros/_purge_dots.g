; lets clean out that other nasty filament shall we?
M400									;	COMPLETE THE MOVES BEFORE NOW


G60 S0									;	SAVE CURRENT TOOL COORDS TO SLOT 0
G91										;	RELATIVE VODKA
M98 P"/macros/moveto/smallzhopup.g"		;	SMALL Z HOP UP
G90										;	ABSOLUTE VODKA
G1 X0 Y0 Z0.3 F99999					;	MOVE TO THE NAUGHTY SPOT
M83										;	RELATIVE NOODLES
G92 E0									;	SET EXTRUDER COORDS TO 0
;G1 E25 F99999							;	PRIME MATERIAL IN
M915 E0 S5          ; set stall sensitivity
M913 E90            ; motor current to 90%
G1 H1 E100 F1000    ; extrude to a stall
M913 E100           ; return motor current to full
G1 Z2 E16 F50							;	GET THE FUNK OUT
G1 E-2 F99999							;	RETRACT THE MATERIAL

G1 X20 Y0 Z0.3 F99999					;	MOVE TO THE NAUGHTY SPOT
M83										;	RELATIVE NOODLES
G92 E0									;	SET EXTRUDER COORDS TO 0
;G1 E25 F99999							;	PRIME MATERIAL IN
M915 E0 S5          ; set stall sensitivity
M913 E90            ; motor current to 90%
G1 H1 E100 F1000    ; extrude to a stall
M913 E100           ; return motor current to full
G1 Z2 E16 F50							;	GET THE FUNK OUT
G1 E-2 F99999							;	RETRACT THE MATERIAL

G1 X40 Y0 Z0.3 F99999					;	MOVE TO THE NAUGHTY SPOT
M83										;	RELATIVE NOODLES
G92 E0									;	SET EXTRUDER COORDS TO 0
;G1 E25 F99999							;	PRIME MATERIAL IN
M915 E0 S5          ; set stall sensitivity
M913 E90            ; motor current to 90%
G1 H1 E100 F1000    ; extrude to a stall
M913 E100           ; return motor current to full
G1 Z2 E16 F50							;	GET THE FUNK OUT
G1 E-20 F99999							;	RETRACT THE MATERIAL

;G1 R0 X0 Y0 Z2 F99999					;	GO BACK TO THE SAVED TOOL COORDS
;M98 P"/macros/wipe/quick_flick.g"		;	CLEAN UP THE MESS
;M98 P"/macros/moveto/smallzhopdown.g"	;	SMALL Z HOP DOWN
M400
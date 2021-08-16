; Pause macro file
M83					; relative extruder moves
G1 E-20 F2500		; retract 20mm
G91					; relative moves
G1 Z2 F5000			; raise nozzle 2mm
G90					; absolute moves
M98 P"/macros/moveto/stage_xyz.g"	; move to stage point

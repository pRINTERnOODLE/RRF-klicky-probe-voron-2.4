;IT'S A QUICK FLICK OF THE TIP
M400
G60 S0								;	Save current tool position to slot 0
G91									;	relative pos
M98 P"/macros/moveto/smallzhopup.g"	;	small z hop
G90									;	absolute pos
M98 P"/macros/moveto/keyholein.g"	;	move in through the keyhole
									;	
									;	
M98 P"/macros/wipe/scripts/wipe.g"	;	run the wipe
									;	
M98 P"/macros/moveto/keyholeout.g"	;	move out through the keyhole

G1 R0 X0 Y0 Z2 F99999
M98 P"/macros/moveto/smallzhopdown.g"	;	small z hop

;M98 P"/macros/tones/wipecomplete.g"
M400
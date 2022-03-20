;M98 P"/macros/moveto/hominghopup.g"
;M98 P"/macros/moveto/clickstage.g"
;G91
;G1 Y60 F20000
;G1 X30
;G90
;M98 P"/macros/moveto/clickstage.g"
;M98 P"/macros/moveto/hominghopdown.g"

; Macro to dock the Mag probe
; check for probe trigger here
	M98 P"/macros/zprobe/clicky_status.g"
if global.clicky_status != "docked"
	echo "Docking Mag Probe"
	; approach the dock
	G90 
	M98 P"/macros/moveto/clickstage.g"
	M400 ; wait
	G91 ; relative
	G1 Y60 F20000 ; move in
	G1 X30 ; wipe off
	G90 ; absolute
	M98 P"/macros/moveto/clickstage.g"
	M98 P"/macros/moveto/hominghopup.g"	; raise Z if homed already
	M400
	; check for probe trigger here
	M98 P"/macros/zprobe/clicky_status.g"
	;echo sensors.probes[0].value[0]
M400
if global.clicky_status = "docked"
	echo "Probe is DOCKED"
else
	echo "Error probe not docked - aborting"
	abort

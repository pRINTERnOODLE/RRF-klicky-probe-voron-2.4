;M98 P"/macros/moveto/hominghopup.g"
;M98 P"/macros/moveto/clickstage.g"
;G91
;G1 Y60 F20000
;G1 Y-60
;G90

; Macro to dock the Mag probe

if global.clicky_status != "attached"
	; approach the dock
	M98 P"/macros/moveto/hominghopup.g"
	M98 P"/macros/moveto/clickstage.g"
	G91
	G1 Y60 F20000
	G1 Y-60
	G90
	M400
	; check for probe trigger here
	M98 P"/macros/zprobe/clicky_status.g"
	echo sensors.probes[0].value[0]

if global.clicky_status = "attached"
		echo "Probe ATTACHED"
else
	echo "Error probe not attached - aborting"
	abort
; finish
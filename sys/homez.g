M290 R0 S0									; RESET BABY STEPPING
if sensors.probes[0].value[0] = 1000
	M98 P"/macros/homing/homezm.g"
	M98 P"/macros/wipe/homing_flick.g"
	M98 P"/macros/wipe/homing_flick.g"
	M98 P"/macros/homing/homezm.g"
if sensors.probes[0].value[0] = 0
	M98 P"/macros/zprobe/unloadclicky.g"
M98 P"/macros/homing/homezm.g"
M98 P"/macros/wipe/homing_flick.g"
M98 P"/macros/wipe/homing_flick.g"
M98 P"/macros/homing/homezm.g"
;else
	;echo "Probe is attached, unloading"
	
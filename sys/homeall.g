;; Slightly optimized XYZ home without performing extra z hops
M290 R0 S0									; RESET BABY STEPPING

if sensors.probes[0].value[0] = 1000
	M98 P"/macros/homing/scripts/zhop_up.g"
	M98 P"/macros/homing/scripts/probe_x.g"
	M98 P"/macros/homing/scripts/probe_y.g"
	M98 P"/macros/homing/scripts/probe_zm.g"
	M98 P"/macros/homing/scripts/zhop_up.g"
	M98 P"/macros/wipe/homing_flick.g"
	M98 P"/macros/wipe/homing_flick.g"
	M98 P"/macros/homing/scripts/probe_zm.g"
	M98 P"/macros/homing/scripts/zhop_up.g"
	M98 P"/macros/wipe/homing_flick.g"
	M98 P"/macros/moveto/stage_xyz.g"
else
	echo "REMOVE THE PROBE"
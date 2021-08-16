if sensors.probes[0].value[0] = 1000
	M98 P"/macros/homing/scripts/zhop_up.g"
	M98 P"/macros/homing/scripts/probe_y.g"
	M98 P"/macros/homing/scripts/zhop_down.g"
else
	echo "REMOVE THE PROBE"




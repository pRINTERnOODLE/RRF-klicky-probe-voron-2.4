M98 P"/macros/zprobe/loadclicky.g"
M98 P"/macros/zprobe/use_itall.g"
M98 P"/macros/homing/scripts/probe_zlevel_start.g"
M98 P"/macros/homing/scripts/probe_zlevel_start.g"
M98 P"/macros/zprobe/use_islow.g"
M98 P"/macros/zprobe/unloadclicky.g"
M98 P"/macros/moveto/stage_xyz.g"
if exists(global.derack)
	set global.derack=true
	echo global.derack
else
	global derack=true

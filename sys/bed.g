M561                            ; clear bed transform
while global.derack=false
	M98 P"/macros/startup/scripts/deracking.g"

if global.derack=true
	G90
	M290 R0 S0									; RESET BABY STEPPING
	M98 p"/macros/zprobe/loadclicky.g"
	M98 P"/macros/zprobe/use_islow.g"
	M98 P"/macros/zprobe/set_iheight.g"
	M98 P"/macros/homing/scripts/probe_zlevel.g"
	M98 P"/macros/homing/scripts/probe_zlevel.g"
	M98 p"/macros/zprobe/unloadclicky.g"	
	M98 P"/macros/drive/z_fullcurrent.g"
	break
	
G28 Z0

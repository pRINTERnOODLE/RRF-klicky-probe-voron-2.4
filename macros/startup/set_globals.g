
if !exists(global.derack)
	global derack = false

if !exists(global.qgl)
	global qgl = false

if !exists(global.clicky_status)
	global clicky_status = "none"

if !exists(global.job_completion)
	global job_completion = 0

if !exists(global.debug_mode)
	global debug_mode = true

; output current values
;echo "global.bed_temp defined. Value : " , global.bed_temp
;echo "global.hotend_temp defined. Value : " , global.hotend_temp
echo "global.clicky_status defined. Value : " , global.clicky_status
echo "global.job_completion defined. Value : " , global.job_completion
echo "global.debug_mode defined. Value : " , global.debug_mode
; macro to check the magprobe triggered status

; global.clicky_status
; = docked 
; = attached 

echo "MagProbe trigger value : " , sensors.probes[0].value[0]

if sensors.probes[0].value[0] = 0
	set global.clicky_status = "attached"
elif sensors.probes[0].value[0] = 1000
	set global.clicky_status = "docked"

;echo global.clicky_status
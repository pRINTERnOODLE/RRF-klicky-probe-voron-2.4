;	TEMPS
T0											; Select tool 0
M104 S185									; SET EXTRUDER TEMP READY FOR SCRUBBING AND CONTINUE
;M140 S105 R80 								; set bed temp and continue
;M141 S55									; set chamber temp
M116 H1 S10									; wait for configured EXTRUDER temperatures within Sn
;M116 H0 S5									; wait for configured BED temperatures within Sn
;M116 H2 S6									; wait for configured CHAMBER temperatures within Sn

;	BED SENSING
M400										; WAIT
M106 P0 S0									; SET PART FAN TO OFF
G28											; Home HOT with a wipe
M400										; WAIT
;G32										; Run precise machine compensation
M400										; WAIT
G29 S1										; Load Bed mesh data

;	SPEEDS AND FEEDS
M220 S100									; RESET FEED RATE 
M221 S100									; RESET EXTRUSION FACTOR
M290 R0 S0									; RESET BABY STEPPING

G92 E0										; RELATIVE EXTRUSION
G1 E20 F99999								; PRIMING NOZZLE
G92 E0										; RELATIVE EXTRUSION
;M98 P"/macros/wipe/do_wipe.g"				; WIPE THE NOZZLE
G0 X200 Y20 Z50								;	RAPID CENTERING MOVE 
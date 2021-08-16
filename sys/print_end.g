;; Macro to be called manually from the slicer code at the end of a print

;Retract the filament
G92 E0 ;SET EXTRUDER TO ZERO POS
G91   ;RELATIVE MOVES

G1 Y55 F99999
G1 E-20 F99999
G90 ;ABSOLUTE MOVES
M83 ;relative extrusion mode

M98 P"/macros/homing/scripts/zhop_up.g"
M98 P"/macros/moveto/stage_xyz.g"
M400                    ; wait for moves to complete

M140 R00 S0               ; set bed standby temperature R80 to magic PEI part removal temp ACTIVE TEMP S90
;M140 R100 S100               ; set bed standby temperature R0 ACTIVE TEMP S90
M144                    ; set bed to standby
;M568 P0 R165 S235 A1	; set tool 0 active S235 and standby R160 in standby A1
M568 P0 R0 S235 A1	; set tool 0 active S235 and standby R0 in standby A1
M141 S0								; set chamber temp to 0
M107                    ; fan off


;; Option 1: Turn off tool heaters
;M568 P0 R0 S0
;M568 P1 R0 S0

;M98 P"/macros/tones/mario.g"
;; Option 2: Disable tools, switching them back to standby temperature.
;; NOTE this requires you to have a suitable standby temparature set,
;; and for your gcode to have not overwritten it.
;T-1                     ; deactivate current tool

M561                                            ; clear bed transform
M557 X10:390 Y25:390 S23.75                     ; DEFINE BED MESH GRID X35:365 Y25:355 S33
G29 S2                                          ; DISABLE ANY MESH
M98 P"/macros/homing/scripts/zhop_up.g"         ; HOP UP
;G32
;M98 P"/macros/leveling/mesh_derack.g"			; MAKE SURE THE RACK AINT WHACK
M98 P"/macros/zprobe/loadclicky.g"
M98 P"/macros/zprobe/use_imesh.g"               ; USE INDUCTIVE PROBE ON MESH SPEED SETTING
M400                                            ; WAIT FOR ALL MOVES TO FINISH
M201 Z100
M98 P"/macros/zprobe/set_iheight.g"             ; SET THE TRIGGER HEIGHT OF INDUCTIVE PROBE
M400                                            ; WAIT FOR ALL MOVES TO FINISH
M201 Z100										; maximum acceleration (mm^2/s)
G29 S0                                          ; CREATE MESH BY PROBING
M400                                            ; WAIT FOR ALL MOVES TO FINISH
M98 P"/macros/zprobe/use_islow.g"               ; USE INDUCTIVE PROBE ON MESH SPEED SETTING
M376 H10                                        ; SET BED COMPENSATION TAPER 10MM
M98
M98 P"/macros/zprobe/unloadclicky.g"
G28 Z                                           ; HOME Z AXIS
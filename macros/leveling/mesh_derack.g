M561
;M291 P"CLEAR BUILD AREA FOR GANTRY DE-RACK!!" R"WARNING" S3 T0

G28
M98 P"/macros/zprobe/use_islow.g"
M98 P"/macros/homing/scripts/probe_zlevel.g"
M98 P"/macros/zprobe/use_islow.g"
M98 P"/macros/moveto/stage_xyz.g"
;G4 S2
;M98 P"/macros/tones/startup.g"
;M140 R70 S90               ; set bed standby temperature to magic PEI part removal temp
;M144                    ; set bed to standby
;M568 P0 R160 S235 A1	; set tool 0 active S235 and standby R160 in standby A1
M561
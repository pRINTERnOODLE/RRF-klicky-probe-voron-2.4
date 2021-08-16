M561															;	clear bed transform
M291 P"CLEAR BUILD AREA FOR GANTRY DE-RACK!!" R"WARNING" S3 T0 	;	issue warning prompt
M141 S70														;	set chamber temp for preheat
M140 R70 S90               										;	set bed standby temperature to magic PEI part removal temp
M144                    										;	set bed to standby
M568 P0 R165 S235 A1											;	set tool 0 active S235 and standby R165 in standby A1
G28																;	home all
M98 P"/macros/startup/scripts/deracking.g"						;	de-rack
M98 P"/macros/preheat.g"										;	preheat the entire printer
G4 S2															;	dwell for 2 seconds
M98 P"/macros/tones/startup.g"									;	play startup success sound
M561															;	clear bed transform
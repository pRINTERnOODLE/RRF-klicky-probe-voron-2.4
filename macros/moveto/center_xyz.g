;; There's nothing special about the center,
;; but it's a convenient place to go
;; to give the user access to both the bed and the X-carriage.
;;
;; *ADJUST* these coordinates based on your build volume
M106 P0 S0.8
G90                             ; absolute positioning
G1 x312 Y350 F99999								;EASE IN/OUT
;G1 X200 Y405 Z25 F99999      ; move to a centerpoint

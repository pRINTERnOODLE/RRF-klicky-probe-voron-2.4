;; Pressure Advance can make seams really pretty.
;; It's super noisy though, so I don't use it all the time.
;; This file enables it.
;;
;;   https://duet3d.com/wiki/Pressure_advance
;;
;; *ADJUST* based on your retraction tuning WITH pressure advance

M207 S0.15 R0.0 F3900 T3900 Z0.0
M572 D0 S0.04 ; 0.45

M592 D0 A0.0125 B0.002 L0.2 ; Non-linear extrusion D0 A0.015 B0.0012 L0.2 
;The amount of extrusion requested is multiplied by (1 + min(L, A*v + B*v^2)) 
;where v is the requested extrusion speed (calculated from the actual speed at 
;which the move will take place) in mm/sec.

;M593 P"daa" F36							;	use daa to cancel ringing at 36hz
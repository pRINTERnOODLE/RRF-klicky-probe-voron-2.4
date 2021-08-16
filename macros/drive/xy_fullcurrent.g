;; In order to consolidate motor current and physics settings,
;; and to enable switching between full- and low-current profiles,
;; these motor settings live in this related set of macros.
;;
;; The "fullcurrent" files specify normal operating values.
;;
;; *ADJUST* all values. What works for you will depend on your build size,
;; motors, and the material of your printed printer parts.
;M915 X Y S1 F1 R2      ; stallguard settings 
M913 X100 Y100          ; restore motor current percentage to 100%
M906 X1550 Y1550        ; motor drive current

M203 X45000 Y45000      ; maximum speed (mm/min)
M201 X3000 Y3000      ; maximum acceleration (mm/s²)
M566 X220 Y220          ; instantaneous speed change / jerk (mm/min) 
;M205 X4 Y5             ; instantaneous speed change / jerk (mm/s)
M593 P"daa" F35 			; use DAA to cancel ringing at 40.5Hz;M593 P"daa" F35              
; Dynamic Accelaration : filter 57Hz STOCK 
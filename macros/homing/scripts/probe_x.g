;; For homing X, perform a double-tap to locate the endstop.
;; First move fast to save time, then move slow for precision.
;;
;; *ADJUST* based on your X size as indicated below

;G91                                    ; relative positioning
;M98 P"/macros/drive/xy_downcurrent.g"
;G1 H1 X410 F6000                       ; +X probe move, fast. (*ADJUST* to 10mm larger than your X size)
;M98 P"/macros/drive/xy_fullcurrent.g"
;G1 H2 X-1.5 F6000                      ; back off from the endstop
;G1 H1 X3 F60                           ; +X probe move, slow
;G1 H2 X-5 F6000                        ; back off from the endstop

;; For homing X, perform a double-tap to locate the endstop.
;; First move fast to save time, then move slow for precision.
;;
;; *ADJUST* based on your X size as indicated below

G91                                    ; relative positioning
M915 X Y S2 F0 R0                     ;set stall detect drives, S-threshold (-64 to 63), F0 unfiltered, R 0 = no action (default), 1 = just log it, 2 = pause print, 3 = pause print, execute /sys/rehome.g, and resume print
M98 P"/macros/drive/xy_downcurrent.g"
G1 H1 X410 F6000                       ; +X probe move, fast. (*ADJUST* to 10mm larger than your X size)
M98 P"/macros/drive/xy_fullcurrent.g"
G1 H2 X-10 F6000                      ; back off from the endstop
M98 P"/macros/drive/xy_downcurrent.g"
G1 H1 X11 F6000                           ; +X probe move, slow
G1 H2 X-10 F6000                        ; back off from the endstop
M98 P"/macros/drive/xy_fullcurrent.g"
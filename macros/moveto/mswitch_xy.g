;; Mover over mechanical z switch
;; *ADJUST* these coordinates for your mechanical switch position

G90                               ; absolute positioning
M98 P"/macros/moveto/stage_xyz.g"							;EASE IN
G1 X345 Y403 F99999           ; move to directly above mechanical Z-switch


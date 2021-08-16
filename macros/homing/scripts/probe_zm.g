; For homing Z, perform a double-tap using the mechanical switch.

M98 P"/macros/moveto/mswitch_xy.g"
M208 X0 Y0 Z-10.0 S1						; set axis mminima to -5.0mm
M98 P"/macros/drive/z_downcurrent.g"

M98 P"/macros/zprobe/use_mfast.g"     ; activate endstop switch as z-probe for fast probing
G30                                   ; z-probe as configured

M98 P"/macros/drive/z_precisionhoming.g"

M98 P"/macros/zprobe/use_mslow.g"     ; activate endstop switch as z-probe for slow probing
G30                                   ; z-probe as configured
M208 X0 Y0 Z0 S1						;set axis minima to 0mm
M98 P"/macros/zprobe/use_islow.g"     ; restore default probe (inductive probe) settings

M98 P"/macros/drive/z_fullcurrent.g"
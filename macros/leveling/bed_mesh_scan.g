;; This script will perform a repeatable G29 scan, allow DWC to display the results,
;; and then remove the mapping and reset leveling to the mechanical zero.
;;
;; In order to perform a G29 bed mesh scan with the result values centered on Z0,
;; first we need to re-home the Z-axis based on the inductive probe height.
;; Note that when performing the scan, we need to use the same inductive probe speed
;; as was used for leveling (i.e. islow).
;; Since the inductive probe has a slight delay in triggering based on distance,
;; when probing fast vs. slow it will generate different trigger heights.
;; If instead we "G29" with the opposite probe configuration vs. the "/macros/homing/homezi",
;; the resultant height map would be offset from 0 by the difference in
;; Z activation characteristics. (This script avoids that problem.)
;;
;; The resultant heightmap should be displayed by DWC automatically.
;; If it is not, you can view it by selecting "Show Mesh Grid Heightmap"
;; under the dropdown by "Auto Bed Compensation".


G29 S2                                     ; remove any bed mesh compensation currently in play
M98 P"/macros/homing/scripts/zhop_up.g"
;M98 P"/macros/homing/scripts/probe_zi.g"
;M98 P"/macros/zprobe/use_islow.g"         ; switch back to slow probing
 
G1 X200 Y200 Z5                            ; Now move to middle of the bed, for initial probing
; P8:       connected to Zmin SIG and GND
; I0:       P8 expects NC, TL-Q5MC2-Z is also NC
; T18000:   Move to probe points at 300mm/s 
; F1200:    Probing Speed: 20mm/s F75 is somewhot slower
; H5:       Dive height: 5mm
; A5 S0.01  Perform up to 5 touches until change is below 0.01mm
; R0.1      Set z-Probe recovery time to 0.1 seconds
; B0        Leave heater on during probing

M558 P8 C"zprobe.in" I0 H5 A5 S0.01 R0.1 F75 T18000 B0      ; define probe with slow parameters
G31 P1000 X0 Y24 Z0                                         ; define probe offset
G30 S-3                                                     ; probe and set the offset of the probe to trigger height (S-3)



G29                             ; perform mesh scan as configured, saving to heightmap.csv
G29 S2                          ; and deactivate compensation, because we don't want to print with it
M98 P"/macros/moveto/stage_xyz.g"                 ; move to center pos
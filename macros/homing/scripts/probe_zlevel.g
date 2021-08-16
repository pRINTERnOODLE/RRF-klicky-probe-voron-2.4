;; Perform one pass at gantry leveling.
;; (The inductive probe should be activated.)
;;
;; *ADJUST* X/Y coordinates based on your bed dimensions
;; *ADJUST* H-values if your probe consistently triggers at different offsets per point
;; i.e. if "level" leaves you with a consistent gantry tilt.

G30 P0 X390 Y390 Z-10000 H+0.00
G30 P1 X390 Y025 Z-10000 H+0.00
G30 P2 X010 Y025 Z-10000 H+0.00
G30 P3 X010 Y390 Z-10000 H+0.00 S4

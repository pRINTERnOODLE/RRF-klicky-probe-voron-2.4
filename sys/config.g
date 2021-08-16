; system and network --------------------------------------
M111 S0                     ; Debug off
M550 P"HULK"			        ; Machine name and Netbios name (can be anything you like)
M551 P"**********"            ; Machine password (used for FTP)

M552 S1			            ; start network module (must have been configured first with M587)
M586 P1 S1                  ; disable FTP
M586 P2 S0                  ; disable Telnet

;M555 P2					; Set output to look like Marlin
G21					    	; Work in millimetres
G90					    	; Send absolute coordinates...
M83						    ; ...but relative extruder moves

; geometry ------------------------------------------------

M669 K1                     ; corexy mode
M208 X0 Y0 Z-0.5 S1   	    ; S1 = set axes minima
M208 X400 Y404 Z404 S0      ; S0 = set axes maxima

; endstops
M574 X2 S4                  ; configure sensorless endstop for high end on X
M574 Y2 S4                  ; configure sensorless endstop for high end on y
M574 Z1 S1 P"zstop"         ; Z min active low endstop switch

; firmware retraction -------------------------------------
; Choose one as your default:
;M98 P"/macros/retraction/quiet_nozhop.g
;M98 P"/macros/retraction/quiet_zhop.g
M98 P"/macros/retraction/pa_nozhop.g"
;M98 P"/macros/retraction/pa_zhop.g"


; drive ---------------------------------------------------
;   ----+----   Z-Drives
;   | 7 | 3 |
;   ----+----
;   | 5 | 6 |
;   ----+----
;     Front

M569 P0 S1      ; X motor direction
M569 P1 S1      ; Y motor direction
M569 P5 S0      ; Z0 motor direction
M569 P7 S1      ; Z1 motor direction
M569 P3 S0      ; Z2 motor direction
M569 P6 S1      ; Z3 motor direction
M569 P2 S1      ; E0 motor direction

M584 R0 X0 Y1 Z5:7:3:6 E2			; motor bindings
M906 I30							; Idle current percentage
M84 S60                            ; motor idle timeout

;M92 X80 Y80 Z400					; set axis steps/mm
;M92 E350							; set extruder 0 steps/mm
;M350 X16 Y16 Z16 E32			; set microstepping

M350 X16 Y16 Z16 E16 I1            ; set microstepping
M92 X81 Y81 Z400 E406          		; set microsteps per mm e406

; velocity, acceleration, and current settings are in these macros
M98 P"/macros/drive/xy_fullcurrent.g"
M98 P"/macros/drive/z_fullcurrent.g"
M98 P"/macros/drive/e_fullcurrent.g"

; Bed leveling params
M671 X-60:-60:460:460 Y5:484:484:5 S20	        ; Z leadscrews positions


; thermal section ----------------------------------------------
M308 S3 Y"mcu-temp" A"CPU" ; Board thermal sensor
M912 P0 S-8                  ; MCU tempurature sensor correction (subtract 8°c)

;Bed heater dual thermistor setup
M308 S0 P"bedtemp" Y"thermistor" T100000 B4725 A"Bed Pad"   ; configure sensor 0 as thermistor on pin bedtemp (pad sensor) 3950
M308 S2 P"e1temp" Y"thermistor" T100000 B4725 A"Bed Plate"  ; configure sensor 2 as thermistor on pin e1temp (plate sensor)
M950 H0 C"bedheat" T2 Q60                                   ; create bed heater output on out0 and map it to sensor 2 (plate sensor). Set PWM frequency to 60Hz
M140 P0 H0                                                  ; Mark heater H0 as bed heater (for DWC)
M143 H0 P1 T0 A2 S120 C0                                    ; Regulate (A2) bed heater (H0) to have pad sensor (T0) below 110°C. Use Heater monitor 1 for it
M143 H0 P2 T0 A1 S135 C0                                    ; Shut off (A1) bed heater (H0) if pad sensor (T0) exceeds 120°C. Use Heater monitor 2 for it
M143 H0 S110                                                ; Set bed heater max temperature to 120°C, use implict monitor 0 which is implicitly configured for heater fault
M307 H0 B0 R0.121 C2018.1 D21.44 S0.60 V24.0                ; disable bang-bang mode for the bed heater and set PWM limit M307 H0 B0 R0.168 C1269.4 D15.79 S0.60 V24.0

;CHAMBER heater dual thermistor setup
M308 S9 P"duex.e2temp" Y"thermistor" T100000 B4725 A"Chamber HEATER" ; configure sensor 9 as thermistor on pin temp1 (CHAMBER HEATER)  C7.060000e-8
M308 S7 P"spi.cs6" Y"dht22" A"Chamber Temp"          ; define DHT22 CHAMBER ACTUAL temperature sensor (CHAMBER TEMP)
;M308 S8 P"S7.1" Y"dhthumidity" A"Chamber Hum[%]"        ; Attach DHT22 humidity sensor to secondary output of temperature sensor
M950 H2 C"duex.e3heat" T9 Q60                                   ; create bed heater output on duex pwwm 2 and map it to sensor 7 (CHAMBER TEMP). Set PWM frequency to 60Hz
M141 P0 H2                                                  ; Mark heater H2 as CHAMBER heater (for DWC)
M143 H2 P1 T9 A2 S120 C0                                    ; Regulate (A2) CHAMBER HEATER (H2) to keep thermister (T9) below 200°C. Use Heater monitor 1 for it
M143 H2 P2 T9 A1 S150 C0                                    ; Shut off (A1) bed heater (H2) if pad sensor (T9) exceeds 120°C. Use Heater monitor 2 for it
M143 H2 S140                                                ; Set chamber heat max temperature to 56°C, use monitor 2 which is configured
M307 H2 B1 F60 S20                                          ; disable bang-bang mode for the bed heater and set PWM limit M307 H2 B0 R0.020 C2704.5 D93.10 S1.00  

;HotEnd
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend" ; configure sensor 1 as thermistor (ATC Semitec 104GT2)
M950 H1 C"e0heat" T1                                                 ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S310                                                         ; set temperature limit for heater 1 to 310°C
M307 H1 R2.909 C216.551:216.551 D4.98 S1.00 V24 B0                 ; disable bang-bang mode for the nozzle heater and set PWM limit



; fans ----------------------------------------------------
; part cooler
M950 F0 C"fan0" Q120               ; part cooler, set to 20Hz PWM
M106 P0 S0 H-1 C"TOOL FAN" L0.25 B0.1            ; Name it "PartCooler"

;Hot End
M950 F1 C"fan1" Q120                                  ; create fan 1 on pin fan1 and set its frequency
M106 P1 H1 T45:270 C"HotEndFan" L0.25 B0.1               ; set fan 1 value. Thermostatic control is turned on

; controller / electronics fan
M950 F2 C"fan2" Q120                                  ; create fan 2 on pin fan2 and set its frequency
M106 P2 H3 T20:35 C"ElectronicsFan" L0.40 B0.1           ; fan is activated when MCU reports 35°C; runs on full speed from 50°C on H100:101:102


M950 F3 C"duex.fan3" Q120                                    ; create fan 3 on pin fan0 and set its frequency
M106 P3 H0 T20:80 L0.30 X0.5 C"CHASSIS FAN" B0.1               ; (max speed X0.50) set fan 0 value. Thermostatic control is turned on, Minimum speed when on 25 percent, Optional B4 full power for 4 seconds

M950 F4 C"duex.pwm1" Q120                                    ; create fan 3 on pin fan0 and set its frequency
M106 P4 H9 T40:60 L0.20 C"Chamber Fan" B0.3               ; set fan 4 value. Thermostatic control is turned on, Minimum speed when on 25 percent, Optional B4 full power for 4 seconds


; chamber Fan
;M950 F3 C"duex.fan4" Q20          ; chamber fan on duex, set to 20Hz PWM
;M106 P3 T40:45 H7 C"ChamberFan"   ; Chamberfan is activated when chamber thermistor reached 40°C; runs on full speed from 45°C on


; tools ---------------------------------------------------
M563 P0 D0 H1       ; bind tool 0 to drive and heater
G10 P0 X0 Y0 Z0     ; tool offset
G10 P0 S0 R0        ; tool active and standby temp
T0                  ; activate tool 0


; paneldue --------------------------
M575 P1 S1 B57600			; activate paneldue 57600


; define the z-probe, unsure, might not been needed
M558 P5 C"zprobe.in" I1 A5 H1.45 R0.1 F65 T7000 A5 S0.01 B1

; read config-override.g
M501
;; Global Variables ------------------------------
M98 P"/macros/startup/set_globals.g"



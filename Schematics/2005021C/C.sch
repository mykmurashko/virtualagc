EESchema Schematic File Version 4
LIBS:module-cache
EELAYER 26 0
EELAYER END
$Descr E 44000 34000
encoding utf-8
Sheet 35 63
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 38425 31900 0    225  ~ 45
SCHEMATIC & FLOW DIAGRAM
Text Notes 40875 33100 0    250  ~ 50
2005021
Text Notes 38250 33100 0    250  ~ 50
80230
Text Notes 39400 32325 0    180  ~ 36
INTERFACE A25 - 26
Text Notes 38900 33425 0    140  ~ 28
____
Wire Notes Line width 6 style solid
	43500 1300 36461 1300
Wire Notes Line width 6 style solid
	43500 1600 36461 1600
Wire Notes Line width 6 style solid
	43500 1900 36460 1900
Wire Notes Line width 6 style solid
	36461 1900 36461 975 
Wire Notes Line width 6 style solid
	36839 1900 36839 975 
Wire Notes Line width 6 style solid
	37350 1899 37350 974 
Wire Notes Line width 6 style solid
	40831 1899 40831 974 
Wire Notes Line width 6 style solid
	41331 1899 41331 974 
Wire Notes Line width 6 style solid
	41831 1899 41831 974 
Wire Notes Line width 6 style solid
	42480 1899 42480 974 
Text Notes 36575 1250 0    160  ~ 32
A      REVISED PER TDRR 21853
Text Notes 36550 1575 0    160  ~ 32
B      REVISED PER TDRR 25017
Text Notes 36550 1875 0    160  ~ 32
C      REVISED PER TDRR ?????
Text Notes 42400 33450 0    140  ~ 28
5     6
Wire Notes Line style solid
	550  2050 25200 2050
Wire Notes Line style solid
	25200 2050 25200 13350
Wire Notes Line style solid
	550  8875 25200 8875
Wire Notes Line style solid
	17200 2050 17200 8850
Wire Notes Line
	17200 8850 17225 8850
Wire Notes Line
	17225 8850 17225 8875
Wire Notes Line style solid
	20325 8875 20325 13350
Wire Notes Line style solid
	12425 8875 12425 13350
Wire Notes Line style solid
	550  13350 25200 13350
$Comp
L AGC_DSKY:Transistor-NPN Q4701
U 1 1 5CD4D7E4
P 14475 11000
AR Path="/5B992554/5CD4D7E4" Ref="Q4701"  Part="1" 
AR Path="/5B991F4D/5CD4D7E4" Ref="Q3001"  Part="1" 
AR Path="/5B991F60/5CD4D7E4" Ref="Q3101"  Part="1" 
AR Path="/5B991FBA/5CD4D7E4" Ref="Q3201"  Part="1" 
AR Path="/5B992014/5CD4D7E4" Ref="Q3301"  Part="1" 
AR Path="/5B99206E/5CD4D7E4" Ref="Q3401"  Part="1" 
AR Path="/5B9920C8/5CD4D7E4" Ref="Q3501"  Part="1" 
AR Path="/5B992122/5CD4D7E4" Ref="Q3601"  Part="1" 
AR Path="/5B99217C/5CD4D7E4" Ref="Q3701"  Part="1" 
AR Path="/5B9921D6/5CD4D7E4" Ref="Q3801"  Part="1" 
AR Path="/5B992230/5CD4D7E4" Ref="Q3901"  Part="1" 
AR Path="/5B99228A/5CD4D7E4" Ref="Q4001"  Part="1" 
AR Path="/5B9922E4/5CD4D7E4" Ref="Q4101"  Part="1" 
AR Path="/5B99233E/5CD4D7E4" Ref="Q4201"  Part="1" 
AR Path="/5B9923EC/5CD4D7E4" Ref="Q4301"  Part="1" 
AR Path="/5B992446/5CD4D7E4" Ref="Q4401"  Part="1" 
AR Path="/5B9924A0/5CD4D7E4" Ref="Q4501"  Part="1" 
AR Path="/5B9924FA/5CD4D7E4" Ref="Q4601"  Part="1" 
AR Path="/5B9925AE/5CD4D7E4" Ref="Q4801"  Part="1" 
AR Path="/5B992608/5CD4D7E4" Ref="Q4901"  Part="1" 
AR Path="/5B992662/5CD4D7E4" Ref="Q5001"  Part="1" 
AR Path="/5B9926BC/5CD4D7E4" Ref="Q5101"  Part="1" 
AR Path="/5B992716/5CD4D7E4" Ref="Q5201"  Part="1" 
AR Path="/5B992770/5CD4D7E4" Ref="Q5301"  Part="1" 
AR Path="/5B9927CA/5CD4D7E4" Ref="Q5401"  Part="1" 
AR Path="/5B992824/5CD4D7E4" Ref="Q5501"  Part="1" 
AR Path="/5B99287E/5CD4D7E4" Ref="Q5601"  Part="1" 
AR Path="/5B9928D8/5CD4D7E4" Ref="Q5701"  Part="1" 
AR Path="/5B992932/5CD4D7E4" Ref="Q5801"  Part="1" 
AR Path="/5B99298C/5CD4D7E4" Ref="Q5901"  Part="1" 
AR Path="/5B9929E6/5CD4D7E4" Ref="Q6001"  Part="1" 
AR Path="/5B992A40/5CD4D7E4" Ref="Q6101"  Part="1" 
AR Path="/5B992A9A/5CD4D7E4" Ref="Q6201"  Part="1" 
AR Path="/5B992AF4/5CD4D7E4" Ref="Q6301"  Part="1" 
AR Path="/5CD4D7E4" Ref="Q2"  Part="1" 
F 0 "Q3501" H 15250 10950 130 0001 C CNN
F 1 "Transistor-NPN" H 14475 11565 130 0001 C CNN
F 2 "" H 14475 11250 130 0001 C CNN
F 3 "" H 14475 11250 130 0001 C CNN
F 4 "Q2" H 15025 11000 140 0000 C CNN "baseRefd"
	1    14475 11000
	1    0    0    -1  
$EndComp
$Comp
L AGC_DSKY:Resistor R4701
U 1 1 5CD4D82D
P 15525 10100
AR Path="/5B992554/5CD4D82D" Ref="R4701"  Part="1" 
AR Path="/5B991F4D/5CD4D82D" Ref="R3001"  Part="1" 
AR Path="/5B991F60/5CD4D82D" Ref="R3101"  Part="1" 
AR Path="/5B991FBA/5CD4D82D" Ref="R3201"  Part="1" 
AR Path="/5B992014/5CD4D82D" Ref="R3301"  Part="1" 
AR Path="/5B99206E/5CD4D82D" Ref="R3401"  Part="1" 
AR Path="/5B9920C8/5CD4D82D" Ref="R3501"  Part="1" 
AR Path="/5B992122/5CD4D82D" Ref="R3601"  Part="1" 
AR Path="/5B99217C/5CD4D82D" Ref="R3701"  Part="1" 
AR Path="/5B9921D6/5CD4D82D" Ref="R3801"  Part="1" 
AR Path="/5B992230/5CD4D82D" Ref="R3901"  Part="1" 
AR Path="/5B99228A/5CD4D82D" Ref="R4001"  Part="1" 
AR Path="/5B9922E4/5CD4D82D" Ref="R4101"  Part="1" 
AR Path="/5B99233E/5CD4D82D" Ref="R4201"  Part="1" 
AR Path="/5B9923EC/5CD4D82D" Ref="R4301"  Part="1" 
AR Path="/5B992446/5CD4D82D" Ref="R4401"  Part="1" 
AR Path="/5B9924A0/5CD4D82D" Ref="R4501"  Part="1" 
AR Path="/5B9924FA/5CD4D82D" Ref="R4601"  Part="1" 
AR Path="/5B9925AE/5CD4D82D" Ref="R4801"  Part="1" 
AR Path="/5B992608/5CD4D82D" Ref="R4901"  Part="1" 
AR Path="/5B992662/5CD4D82D" Ref="R5001"  Part="1" 
AR Path="/5B9926BC/5CD4D82D" Ref="R5101"  Part="1" 
AR Path="/5B992716/5CD4D82D" Ref="R5201"  Part="1" 
AR Path="/5B992770/5CD4D82D" Ref="R5301"  Part="1" 
AR Path="/5B9927CA/5CD4D82D" Ref="R5401"  Part="1" 
AR Path="/5B992824/5CD4D82D" Ref="R5501"  Part="1" 
AR Path="/5B99287E/5CD4D82D" Ref="R5601"  Part="1" 
AR Path="/5B9928D8/5CD4D82D" Ref="R5701"  Part="1" 
AR Path="/5B992932/5CD4D82D" Ref="R5801"  Part="1" 
AR Path="/5B99298C/5CD4D82D" Ref="R5901"  Part="1" 
AR Path="/5B9929E6/5CD4D82D" Ref="R6001"  Part="1" 
AR Path="/5B992A40/5CD4D82D" Ref="R6101"  Part="1" 
AR Path="/5B992A9A/5CD4D82D" Ref="R6201"  Part="1" 
AR Path="/5B992AF4/5CD4D82D" Ref="R6301"  Part="1" 
AR Path="/5CD4D82D" Ref="R6"  Part="1" 
F 0 "R3501" H 15425 10550 130 0001 C CNN
F 1 "2000" H 15475 10325 130 0000 C CNN
F 2 "" H 15525 10100 130 0001 C CNN
F 3 "" H 15525 10100 130 0001 C CNN
F 4 "R6" H 15475 10525 140 0000 C CNN "baseRefd"
	1    15525 10100
	1    0    0    -1  
$EndComp
Text HLabel 16525 10100 2    140  Output ~ 28
L
Text HLabel 13375 11000 0    140  Input ~ 28
K
Text HLabel 14550 12025 0    140  UnSpc ~ 28
G
Wire Wire Line
	13375 11000 14175 11000
Wire Wire Line
	15925 10100 16525 10100
Wire Wire Line
	14550 12025 14625 12025
Wire Wire Line
	14625 12025 14625 11250
Text Notes 15975 9300 0    200  ~ 40
C CIRCUIT
Wire Wire Line
	15125 10100 14625 10100
Wire Wire Line
	14625 10100 14625 10750
Wire Notes Line style solid
	17550 11400 17550 12375
Wire Notes Line style solid
	17550 12375 18550 12375
Wire Notes Line style solid
	18550 12375 18550 11400
Wire Notes Line style solid
	18550 11400 17550 11400
$Comp
L AGC_DSKY:HierBody N3001
U 1 1 5CF3E844
P 17650 11875
AR Path="/5B991F4D/5CF3E844" Ref="N3001"  Part="1" 
AR Path="/5B991F60/5CF3E844" Ref="N3101"  Part="1" 
AR Path="/5B991FBA/5CF3E844" Ref="N3201"  Part="1" 
AR Path="/5B992014/5CF3E844" Ref="N3301"  Part="1" 
AR Path="/5B99206E/5CF3E844" Ref="N3401"  Part="1" 
AR Path="/5B9920C8/5CF3E844" Ref="N3501"  Part="1" 
AR Path="/5B992122/5CF3E844" Ref="N3601"  Part="1" 
AR Path="/5B99217C/5CF3E844" Ref="N3701"  Part="1" 
AR Path="/5B9921D6/5CF3E844" Ref="N3801"  Part="1" 
AR Path="/5B992230/5CF3E844" Ref="N3901"  Part="1" 
AR Path="/5B99228A/5CF3E844" Ref="N4001"  Part="1" 
AR Path="/5B9922E4/5CF3E844" Ref="N4101"  Part="1" 
AR Path="/5B99233E/5CF3E844" Ref="N4201"  Part="1" 
AR Path="/5B9923EC/5CF3E844" Ref="N4301"  Part="1" 
AR Path="/5B992446/5CF3E844" Ref="N4401"  Part="1" 
AR Path="/5B9924A0/5CF3E844" Ref="N4501"  Part="1" 
AR Path="/5B9924FA/5CF3E844" Ref="N4601"  Part="1" 
AR Path="/5B992554/5CF3E844" Ref="N4701"  Part="1" 
AR Path="/5B9925AE/5CF3E844" Ref="N4801"  Part="1" 
AR Path="/5B992608/5CF3E844" Ref="N4901"  Part="1" 
AR Path="/5B992662/5CF3E844" Ref="N5001"  Part="1" 
AR Path="/5B9926BC/5CF3E844" Ref="N5101"  Part="1" 
AR Path="/5B992716/5CF3E844" Ref="N5201"  Part="1" 
AR Path="/5B992770/5CF3E844" Ref="N5301"  Part="1" 
AR Path="/5B9927CA/5CF3E844" Ref="N5401"  Part="1" 
AR Path="/5B992824/5CF3E844" Ref="N5501"  Part="1" 
AR Path="/5B99287E/5CF3E844" Ref="N5601"  Part="1" 
AR Path="/5B9928D8/5CF3E844" Ref="N5701"  Part="1" 
AR Path="/5B992932/5CF3E844" Ref="N5801"  Part="1" 
AR Path="/5B99298C/5CF3E844" Ref="N5901"  Part="1" 
AR Path="/5B9929E6/5CF3E844" Ref="N6001"  Part="1" 
AR Path="/5B992A40/5CF3E844" Ref="N6101"  Part="1" 
AR Path="/5B992A9A/5CF3E844" Ref="N6201"  Part="1" 
AR Path="/5B992AF4/5CF3E844" Ref="N6301"  Part="1" 
F 0 "N3501" H 17635 11675 140 0001 C CNN
F 1 "HierBody" H 17655 12055 140 0001 C CNN
F 2 "" H 17650 11875 140 0001 C CNN
F 3 "" H 17650 11875 140 0001 C CNN
F 4 "K" H 17825 11875 140 0000 C CNB "Caption2"
	1    17650 11875
	1    0    0    -1  
$EndComp
$Comp
L AGC_DSKY:HierBody N3002
U 1 1 5CF3E86C
P 17650 12200
AR Path="/5B991F4D/5CF3E86C" Ref="N3002"  Part="1" 
AR Path="/5B991F60/5CF3E86C" Ref="N3102"  Part="1" 
AR Path="/5B991FBA/5CF3E86C" Ref="N3202"  Part="1" 
AR Path="/5B992014/5CF3E86C" Ref="N3302"  Part="1" 
AR Path="/5B99206E/5CF3E86C" Ref="N3402"  Part="1" 
AR Path="/5B9920C8/5CF3E86C" Ref="N3502"  Part="1" 
AR Path="/5B992122/5CF3E86C" Ref="N3602"  Part="1" 
AR Path="/5B99217C/5CF3E86C" Ref="N3702"  Part="1" 
AR Path="/5B9921D6/5CF3E86C" Ref="N3802"  Part="1" 
AR Path="/5B992230/5CF3E86C" Ref="N3902"  Part="1" 
AR Path="/5B99228A/5CF3E86C" Ref="N4002"  Part="1" 
AR Path="/5B9922E4/5CF3E86C" Ref="N4102"  Part="1" 
AR Path="/5B99233E/5CF3E86C" Ref="N4202"  Part="1" 
AR Path="/5B9923EC/5CF3E86C" Ref="N4302"  Part="1" 
AR Path="/5B992446/5CF3E86C" Ref="N4402"  Part="1" 
AR Path="/5B9924A0/5CF3E86C" Ref="N4502"  Part="1" 
AR Path="/5B9924FA/5CF3E86C" Ref="N4602"  Part="1" 
AR Path="/5B992554/5CF3E86C" Ref="N4702"  Part="1" 
AR Path="/5B9925AE/5CF3E86C" Ref="N4802"  Part="1" 
AR Path="/5B992608/5CF3E86C" Ref="N4902"  Part="1" 
AR Path="/5B992662/5CF3E86C" Ref="N5002"  Part="1" 
AR Path="/5B9926BC/5CF3E86C" Ref="N5102"  Part="1" 
AR Path="/5B992716/5CF3E86C" Ref="N5202"  Part="1" 
AR Path="/5B992770/5CF3E86C" Ref="N5302"  Part="1" 
AR Path="/5B9927CA/5CF3E86C" Ref="N5402"  Part="1" 
AR Path="/5B992824/5CF3E86C" Ref="N5502"  Part="1" 
AR Path="/5B99287E/5CF3E86C" Ref="N5602"  Part="1" 
AR Path="/5B9928D8/5CF3E86C" Ref="N5702"  Part="1" 
AR Path="/5B992932/5CF3E86C" Ref="N5802"  Part="1" 
AR Path="/5B99298C/5CF3E86C" Ref="N5902"  Part="1" 
AR Path="/5B9929E6/5CF3E86C" Ref="N6002"  Part="1" 
AR Path="/5B992A40/5CF3E86C" Ref="N6102"  Part="1" 
AR Path="/5B992A9A/5CF3E86C" Ref="N6202"  Part="1" 
AR Path="/5B992AF4/5CF3E86C" Ref="N6302"  Part="1" 
F 0 "N3502" H 17635 12000 140 0001 C CNN
F 1 "HierBody" H 17655 12380 140 0001 C CNN
F 2 "" H 17650 12200 140 0001 C CNN
F 3 "" H 17650 12200 140 0001 C CNN
F 4 "G" H 17825 12200 140 0000 C CNB "Caption2"
	1    17650 12200
	1    0    0    -1  
$EndComp
$Comp
L AGC_DSKY:HierBody N3003
U 1 1 5CF3E894
P 18450 11875
AR Path="/5B991F4D/5CF3E894" Ref="N3003"  Part="1" 
AR Path="/5B991F60/5CF3E894" Ref="N3103"  Part="1" 
AR Path="/5B991FBA/5CF3E894" Ref="N3203"  Part="1" 
AR Path="/5B992014/5CF3E894" Ref="N3303"  Part="1" 
AR Path="/5B99206E/5CF3E894" Ref="N3403"  Part="1" 
AR Path="/5B9920C8/5CF3E894" Ref="N3503"  Part="1" 
AR Path="/5B992122/5CF3E894" Ref="N3603"  Part="1" 
AR Path="/5B99217C/5CF3E894" Ref="N3703"  Part="1" 
AR Path="/5B9921D6/5CF3E894" Ref="N3803"  Part="1" 
AR Path="/5B992230/5CF3E894" Ref="N3903"  Part="1" 
AR Path="/5B99228A/5CF3E894" Ref="N4003"  Part="1" 
AR Path="/5B9922E4/5CF3E894" Ref="N4103"  Part="1" 
AR Path="/5B99233E/5CF3E894" Ref="N4203"  Part="1" 
AR Path="/5B9923EC/5CF3E894" Ref="N4303"  Part="1" 
AR Path="/5B992446/5CF3E894" Ref="N4403"  Part="1" 
AR Path="/5B9924A0/5CF3E894" Ref="N4503"  Part="1" 
AR Path="/5B9924FA/5CF3E894" Ref="N4603"  Part="1" 
AR Path="/5B992554/5CF3E894" Ref="N4703"  Part="1" 
AR Path="/5B9925AE/5CF3E894" Ref="N4803"  Part="1" 
AR Path="/5B992608/5CF3E894" Ref="N4903"  Part="1" 
AR Path="/5B992662/5CF3E894" Ref="N5003"  Part="1" 
AR Path="/5B9926BC/5CF3E894" Ref="N5103"  Part="1" 
AR Path="/5B992716/5CF3E894" Ref="N5203"  Part="1" 
AR Path="/5B992770/5CF3E894" Ref="N5303"  Part="1" 
AR Path="/5B9927CA/5CF3E894" Ref="N5403"  Part="1" 
AR Path="/5B992824/5CF3E894" Ref="N5503"  Part="1" 
AR Path="/5B99287E/5CF3E894" Ref="N5603"  Part="1" 
AR Path="/5B9928D8/5CF3E894" Ref="N5703"  Part="1" 
AR Path="/5B992932/5CF3E894" Ref="N5803"  Part="1" 
AR Path="/5B99298C/5CF3E894" Ref="N5903"  Part="1" 
AR Path="/5B9929E6/5CF3E894" Ref="N6003"  Part="1" 
AR Path="/5B992A40/5CF3E894" Ref="N6103"  Part="1" 
AR Path="/5B992A9A/5CF3E894" Ref="N6203"  Part="1" 
AR Path="/5B992AF4/5CF3E894" Ref="N6303"  Part="1" 
F 0 "N3503" H 18435 11675 140 0001 C CNN
F 1 "HierBody" H 18455 12055 140 0001 C CNN
F 2 "" H 18450 11875 140 0001 C CNN
F 3 "" H 18450 11875 140 0001 C CNN
F 4 "L" H 18275 11875 140 0000 C CNB "Caption2"
	1    18450 11875
	1    0    0    -1  
$EndComp
Text Notes 18625 12625 2    140  ~ 0
File: C.sch
Text Notes 18500 11350 2    140  ~ 0
Sheet: C
$EndSCHEMATC

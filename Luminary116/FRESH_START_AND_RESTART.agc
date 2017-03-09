### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    FRESH_START_AND_RESTART.agc
## Purpose:     A section of Luminary revision 116.
##              It is part of the source code for the Lunar Module's (LM)
##              Apollo Guidance Computer (AGC) for Apollo 12.
##              This file is intended to be a faithful transcription, except
##              that the code format has been changed to conform to the
##              requirements of the yaYUL assembler rather than the
##              original YUL assembler.
## Reference:   pp. 212-237
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2017-01-22 MAS  Created from Luminary 99.
##              2017-02-19 HG   Transcribed and partially reconstructed

## Page 212
                BANK            10
                SETLOC          FRANDRES
                BANK

                EBANK=          LST1

                COUNT*          $$/START                        # FRESH AND RESTART
SLAP1           INHINT                                          # FRESH START. COMES HERE FROM PINBALL.
                TC              STARTSUB                        # SUBROUTINE DOES MOST OF THE WORK.

STARTSW         TCF             SKIPSIM                         # PATCH....TCF STARTSIM...FOR SIMULATION
STARTSIM        CAF             BIT14
                TC              FINDVAC
SIM2CADR        OCT             77777                           # PATCH 2CADR (AND EBANK DESIGNATION) OF
                OCT             77777                           # SIMULATION START ADDRESS.

SKIPSIM         CA              DSPTAB          +11D
                MASK            BITS4&6                         # TURN OFF ALL DSPTAB +11D LAMPS
                AD              BIT15                           # EXCEPT THE GIMBAL LOCK & NO ATT ONLY ON
                TS              DSPTAB          +11D            # REQUESTED FRESH START.

                CA              ZERO
                TS              ERCOUNT
                TS              FAILREG
                TS              FAILREG         +1
                TS              FAILREG         +2
                TS              REDOCTR

                CS              PRIO12
                TS              DSRUPTSW

DOFSTART        CAF             BIT14                           # INSURE ENGINE IS OFF.
                EXTEND
                WRITE           DSALMOUT
                CS              ZERO
                TS              THRUST

DOFSTRT1        CAF             FOUR
                TS              RCSFLAGS                        # INITIALIZE ATTITUDE ERROR DISPLAYS.
                CA              PRIO30
                TS              RESTREG                         # SUPER BANK PRIORITY FOR DISPLAYS.

                CA              ZERO
                TS              ABDELV                          # DAP INITIALIZATION
                TS              NVSAVE
                TS              EBANKTEM
                TS              CH5MASK
                TS              CH6MASK
                TS              PVALVEST                        # FOR RCS FAILURE MONITOR

## Page 213
                TS              ERESTORE                        # ***** MUST NOT BE REMOVED FROM DOFSTART
                TS              SMODE                           # ***** MUST NOT BE REMOVED FROM DOFSTART
                TS              DNLSTCOD                        # SELECT POO DOWNLIST
                TS              AGSWORD                         # ALLOW AGS INITIALIZATION
                TS              UPSVFLAG                        # ZERO UPDATE STATE VECTOR REQUEST FLAGWRD
                EXTEND
                WRITE           CHAN5                           # TURN OFF RCS JETS.
                EXTEND
                WRITE           CHAN6                           # TURN OFF RCS JETS.
                EXTEND
                WRITE           CHAN12
                EXTEND
                WRITE           CHAN13
                EXTEND
                WRITE           CHAN14
                CS              DSPTAB          +11D
                MASK            BITS4&6
                CCS             A
                TC              +4
                CA              BITS4&6
                EXTEND                                          # THE IMU WAS IN COARSE ALIGN IN GIMBAL
                WOR             CHAN12                          # LOCK, SO PUT IT BACK INTO COARSE ALIGN.
   +4           TC              MR.KLEAN

                CS              ZERO
                TS              MODREG

                CAF             IM30INIF                        # FRESH START IMU INITIALIZATION.
                TS              IMODES30

                CAF             MAXDB
                TS              DB
                CAF             FOUR
                TS              RATEINDX                        # INITIALIZE KALCMANU RATE
                CA              BOOLSTRT
                TS              DAPBOOLS
                CAF             EBANK6
                TS              EBANK
                EBANK=          HIASCENT

                CA              STIKSTRT
                TS              STIKSENS
                CA              RATESTRT
                TS              -RATEDB
                CAF             FULLAPS                         # INITIALIZE MAXIMUM ASCENT MASS FOR USE
                TS              HIASCENT                        #   BY 1/ACCS UNTIL THE PAD LOAD IS DONE.
                CA              77001OCT                        #    LOAD DAP FILTER GAINS PAD LOAD
                TS              DKTRAP                          #    TO BEST PRESENT ESTIMATE OF GOODIES
                TS              LMTRAP                          # .14 DEG
                CA              60DEC

## Page 214
                TS              DKKAOSN
                TS              LMKAOSN                         # 6 SEC GAIN FOR ALPHA
                CA              ZERO
                TS              LMOMEGAN                        # UNITY GAIN
                CA              TEN
                TS              DKOMEGAN                        # 1 SEC GAIN FOR OMEGA
                CAF             BIT8                            # SET DOCKED DB TO 1.4 DEG.  MAY OVERWRITE
                TS              DKDB                            #   WITH PAD LOAD.
                CAF             IM33INIT
                AD              BIT6                            # KEEP BOTH DAP AND ERROR-NEEDLES DISPLAY
                TS              IMODES33                        #   OFF UNTIL ICDU ZERO IS FINISHED.

                EXTEND                                          # INITIALIZE SWITCHES ONLY ON FRESH START.
                DCA             SWINIT
                DXCH            STATE
                CA              SWINIT          +2
                TS              STATE           +2
                CA              REFSMBIT                        # DO NOT ALTER REFSMFLG ON FRESH START.
                MASK            STATE           +3
                AD              SWINIT          +3
                TS              STATE           +3
                EXTEND
                DCA             SWINIT          +4
                DXCH            STATE           +4
                EXTEND
                DCA             SWINIT          +6
                DXCH            STATE           +6
                CA              SURFFBIT                        # DO NOT ALTER  SURFFLAG ON FRESH START.
                AD              CMOONBIT                        #               CMOONFLG
                AD              LMOONBIT                        #               LMOONFLG
                MASK            STATE           +8D
                AD              SWINIT          +8D
                TS              STATE           +8D
                CA              SWINIT          +9D
                TS              STATE           +9D
                CA              APSFLBIT                        # DO NOT ALTER APSFLAG ON FRESH START.
                MASK            STATE           +10D
                AD              SWINIT          +10D
                TS              STATE           +10D
                CAF             SWINIT          +11D
                TS              STATE           +11D

ENDRSTRT        TC              POSTJUMP                        # NOW IN ANOTHER BANK.
                CADR            DUMMYJOB        +2              # PICKS UP AT RELINT.   (DONT ZERO NEWJOB)

MR.KLEAN        INHINT
                EXTEND
                DCA             NEG0
                DXCH            -PHASE2

## Page 215
POOKLEAN        EXTEND
                DCA             NEG0
                DXCH            -PHASE4
V37KLEAN        EXTEND
                DCA             NEG0
                DXCH            -PHASE1
ABTKLEAN        EXTEND
                DCA             NEG0
                DXCH            -PHASE3
                EXTEND
                DCA             NEG0
                DXCH            -PHASE5
                EXTEND
                DCA             NEG0
                DXCH            -PHASE6
                TC              Q

## Page 216
#          COMES HERE FROM LOCATION 4000, GOJAM. RESTART ANY PROGRAMS WHICH MAY HAVE BEEN RUNNING AT THE TIME

                EBANK=          LST1
GOPROG          INCR            REDOCTR                         # ADVANCE RESTART COUNTER.

                LXCH            Q
                EXTEND
                ROR             SUPERBNK
                DXCH            RSBBQ
                CA              DSPTAB          +11D
                MASK            BIT4
                EXTEND
                BZF             +4
                AD              BIT6                            # SET ERROR COUNTER ENABLE
                EXTEND
                WOR             CHAN12                          # ISS WAS IN COARS ALIGN SO GO BACK TO
BUTTONS         TC              LIGHTSET

#                                           ERASCHK TEMPORARILY STORES THE CONTENTS OF TWO ERASABLE LOCATIONS, X
#                                           AND X+1 INTO SKEEP5 AND SKEEP6. IT ALSO STORES X INTO SKEEP7 AND
#                                           ERESTORE. IF ERASCHK IS INTERRUPTED BY A RESTART, C(ERESTORE) SHOULD
#                                           EQUAL C(SKEEP7),AND BE A + NUMBER LESS THAN 2000 OCT. OTHERWISE
#                                           C(ERESTORE) SHOULD EQUAL +0.

                CAF             HI5
                MASK            ERESTORE
                EXTEND
                BZF             +2                              # IF ERESTORE NOT = +0 OR +N LESS THAN 2K,
                TCF             NONAVKEY        +3              # DO FRESH START - E MEMORY MIGHT BE BAD
                CS              ERESTORE
                EXTEND
                BZF             DORSTART                        # = +0 CONTINUE WITH RESTART.
                AD              SKEEP7
                EXTEND
                BZF             +2                              # = SKEEP7, RESTORE E MEMORY.
                TCF             NONAVKEY        +3              # DO FRESH START - E MEMORY MIGHT BE BAD
                CA              SKEEP4
                TS              EBANK                           # EBANK OF E MEMORY THAT WAS UNDER TEST.
                EXTEND                                          # (NOT DXCH SINCE THIS MIGHT HAPPEN AGAIN)

## Note: The rest of this page and some subsequent ones are missing from the original scan for Luminary 116.
##       The contents are being reconstructed using listings for Luminary 099 and Luminary 131
##       Obviously it can not be guranteed that the comments are 100% correct.
##       Comparing Luminary 099 with Luminary131 should give confidence that they are close to
##       the original.
                DCA             SKEEP5
                INDEX           SKEEP7
                DXCH            0000                            # E MEMORY RESTORED.
                CA              ZERO
                TS              ERESTORE
DORSTART        TC              STARTSUB                        # DO INITIALIZATION AFTER ERASE RESTORE.

SETINFL         CS              INTFLBIT
                MASK            FLGWRD10
                TS              FLGWRD10

## Page 217
## Note: Reconstructed from Luminary 099 p. 216/ Luminary 131 p. 218
                CA              9,6,4                           # LEAVE PROG ALARM,GIMBAL LOCK, NO ATT
                MASK            DSPTAB          +11D            # LAMPS INTACT ON HARDWARE RESTART
                AD              BIT15
                XCH             DSPTAB          +11D
                CAF             IFAILINH                        # LEAVE IMU FAILURE INHIBITS INTACT ON
                MASK            IMODES30                        # HARDWARE RESTART. RESET ALL FAILURE
                AD              IM30INIR                        # CODES.
                TS              IMODES30

                CA              AGSWORD                         # BE SURE OF CORRECT DOWNLIST
                TS              DNLSTCOD

                CA              BIT4                            # TURN ON THROTTLE COUNTER
                EXTEND
                WOR             CHAN14                          # TURN ON THRUST DRIVE
                CS              FLAGWRD5
                MASK            ENGONBIT
                CCS             A
                TCF             +5
                CAF             BIT13
                EXTEND
                WOR             DSALMOUT                        # TURN ENGINE ON
                TCF             GOPROG3
   +5           CAF             BIT14
                EXTEND
                WOR             DSALMOUT                        # TURN ENGINE OFF.
                TCF             GOPROG3

ENEMA           INHINT
                TC              STARTSB1
                TCF             GOPROG2A
GOPROG2         TC              STARTSB2
GOPROG2A        TC              LIGHTSET
                CS              RSFLGBTS                        # CLEAR BITS 7 AND 14.
                MASK            FLGWRD10
                TS              FLGWRD10

GOPROG3         CAF             NUMGRPS                         # VERIFY PHASE TABLE AGREEMENTS
PCLOOP          TS              MPAC            +5
                DOUBLE
                EXTEND
                INDEX           A
                DCA             -PHASE1                         # COMPLEMENT INTO A, DIRECT INTO L.
                EXTEND
                RXOR            LCHAN                           # RESULT MUST BE -0 FOR AGREEMENT.
                CCS             A
                TCF             PTBAD                           # RESTART FAILURE.
                TCF             PTBAD
                TCF             PTBAD

## Page 218
## Note: Reconstructed from Luminary 099 p. 217/ Luminary 131 p. 219
                CCS             MPAC            +5              # PROCESS ALL RESTART GROUPS.
                TCF             PCLOOP

                TS              MPAC            +6              # SET TO +0.
                TC              MMDSPLAY                        # DISPLAY MAJOR MODE

                INHINT                                          # RELINT DONE IN MMDSPLAY

                CS              DIDFLBIT                        # CLEAR DIDFLAG IN ORDER TO FORCE R10 TO
                MASK            FLAGWRD1                        # RE-INITIALIZE ITSELF IF IT HAD BEEN
                TS              FLAGWRD1                        # OPERATING AT THE TIME OF THE RESTART.

                CS              RODFLBIT                        # CLEAR RODFLAG.  IF P66 IS IN OPERATION
                MASK            FLAGWRD1                        #      IT WILL RE-INITIALIZE ITSELF AND
                TS              FLAGWRD1                        #      CONTINUE.

                CS              P21FLBIT                        # CLEAR P21 FLAG SO THAT P21 WILL COMPUTE
                MASK            FLAGWRD0                        # NEW BASE STATE VECTORS.
                TS              FLAGWRD0

                CAF             NUMGRPS                         # SEE IF ANY GROUPS RUNNING.
NXTRST          TS              MPAC            +5
                DOUBLE
                INDEX           A
                CCS             PHASE1
                TCF             PACTIVE                         # PNZ - GROUP ACTIVE.
                TCF             PINACT                          # +0 - GROUP NOT RUNNING.

PACTIVE         TS              MPAC
                INCR            MPAC                            # ABS OF PHASE.
                INCR            MPAC            +6              # INDICATE GROUP DEMANDS PRESENT.
                CA              RACTCADR
                TC              SWCALL                          # MUST RETURN TO SWRETURN.

PINACT          CCS             MPAC            +5              # PROCESS ALL RESTART GROUPS.
                TCF             NXTRST

                CCS             MPAC            +6              # NO, CHECK PHASE ACTIVITY FLAG
                TCF             ENDRSTRT                        # PHASE ACTIVE
                CAF             BIT15                           # IS MODE -0
                MASK            MODREG
                EXTEND
                BZF             GOTOPOOH                        # NO
                TCF             ENDRSTRT                        # YES
PTBAD           TC              ALARM                           # SET ALARM TO SHOW PHASE TABLE FAILURE.
                OCT             1107

                TCF             DOFSTRT1

## Page 219
## Note: Reconstructed from Luminary 099 p. 217/ Luminary 131 p. 219
# DO NOT USE GOPROG2 OR ENEMA WITHOUT CONSULTING POOH PEOPLE

OCT10000        =               BIT13
OCT30000        =               PRIO30
OCT7777         OCT             7777
STIKSTRT        DEC             0.825268                        # 20 D/S MAXIMUM COMPANDED RATE
RATESTRT        DEC             -218
RACTCADR        CADR            RESTARTS
BOOLSTRT        OCT             21312
77001OCT        OCT             77001                           # .14 DEG SCALED AT 4.5 DEG
60DEC           DEC             60
RSFLGBTS        OCT             20100
MAXDB           OCTAL           03434                           # 5 DEG ATTITUDE DEADBAND. SCALED AT 45.

LIGHTSET        CAF             BIT5                            # CHECK FOR MARK REJECT AND ERROR RESET
                EXTEND
                RAND            NAVKEYIN
                EXTEND
                BZF             NONAVKEY                        # NO MARK REJECT
                EXTEND
                READ            MNKEYIN                         # CHECK IF KEYS 2M AND 5M ON
                AD              -ELR                            # MAIN DSKY KEYCODE(BITS 1-5)
                EXTEND
                BZF             +2

NONAVKEY        TC              Q

                TC              STARTSUB
                TCF             DOFSTART
   +3           TC              STARTSUB
                TCF             DOFSTRT1                        # DO FRESH START BUT DON'T TOUCH ENGINE

## Page 220
## Note: Reconstructed from Luminary 099 p. 218/ Luminary 131 p. 220
#          INITIALIZATION COMMON TO BOTH FRESH START AND RESTART.

                EBANK=          AOSQ
STARTSUB        CAF             LDNPHAS1                        # SET POINTER SO NEXT 20MS DOWNRUPT WILL
                TS              DNTMGOTO                        # CAUSE THE CURRENT DOWNLIST TO BE
                                                                # INTERRUPTED AND START SENDING FROM THE
                                                                # BEGINNING OF THE CURRENT DOWNLIST.
                CAF             BIT6
                EXTEND
                RAND            CHAN33
                AD              RMODINIT
                TS              RADMODES

STARTSB1        CAF             POSMAX
                TS              TIME3
                AD              MINUS2
                TS              TIME4
                AD              NEGONE
                TS              TIME5

                CAF             EBANK6
                TS              EBANK

                CS              BIT13                           # CAUSE DAPIDLER TO CALL 1/ACCS
                MASK            RCSFLAGS
                TS              RCSFLAGS                        # ZERO BIT 13
                CAF             POSMAX                          # DISABLE TIME6 CLOCK.  JUST IN CASE A T6
                TS              T6NEXT                          #   RUPT IS ALREADY IN THE PRIORITY CHAIN,
                EXTEND                                          #   ENSURE THAT IT'S INPUTS WILL RENDER IT
                WAND            CHAN13                          #   INEFFECTUAL.
                CAF             ZERO
                TS              NXT6ADR
                TS              NEXTP

                CS              ACCSOKAY
                MASK            DAPBOOLS
                TS              DAPBOOLS

                EXTEND                                          # SET T5RUPT FOR DAPIDLER PROGRAM.
                DCA             IDLEADR
                DXCH            T5ADR

STARTSB2        CAF             OCT30001                        # DURING SOFTWARE RESTART, DO NOT DISTURB
                EXTEND                                          # ENGINE ON, OFF AND ISS WARNING.
                WAND            DSALMOUT

                CS              READRBIT                        # CLEAR READRFLG FOR R29.
                MASK            FLAGWRD3
                TS              FLAGWRD3
## Note: This is the end of the reconstructed pages 216-220.

## Page 221

                CS              FLAGWRD3                        # DURING SOFTWARE RESTART,CLEAR TURNON,
                MASK            NR29FBIT                        # REPOSITION,CDU ZERO AND REMODE BITS
                EXTEND                                          # IN RADMODES,SINCE TASKS ASSOCIATED
                BZF             +2                              # WITH THESE BITS HAVE BEEN KILLED
                CAF             BIT10                           # ALSO IF R29 HAD BEEN REQUESTED,
                AD              OCT32001                        # (NOR29FLG = 0) CLEAR BIT 10 RADMODES
                COM                                             # TO MAKE R29 FORGET IT HAD STARTED
                MASK            RADMODES                        # DESIGNATING
                TS              RADMODES
                CAF             OCT27470                        # DURING SOFTWARE RESTART, DO NOT DISTURB
                EXTEND                                          # IMU FLAGS. (COURSE ALIGN ENABLE, ZERO
                WAND            CHAN12                          # IMU CDUS, ENABLE IMU COUNTER) AND GIMBAL
                                                                # TRIM DRIVES. LEAVE RR LOCKON ENABLE
                                                                # ALONE.

                CS              NORRMBIT                        # ENABLE R25.
                MASK            FLAGWRD5
                TS              FLAGWRD5

                CS              R77FLBIT                        # CLEAR R77FLAG
                MASK            FLAGWRD5
                TS              FLAGWRD5
                CAF             OCT74160                        # DURING SOFTWARE RESTART, DO NOT DUSTURB
                EXTEND                                          # TELEMETRY FLAGS, RESET TRAP FLAGS, AND
                WAND            CHAN13                          # ENABLE T6RUPT FLAG.

                CAF             BIT12                           # REENABLE RUPT10 (RUPT QUICKLY
                EXTEND                                          #   RESUMES EXCEPT DURING P64)
                WOR             CHAN13

                CAF             BIT6                            # DURING SOFTWARE RESTART, DO NOT DISTURB
                EXTEND                                          # GYRO ENABLE FLAG.
                WAND            CHAN14

                EBANK=          LST1
                CAF             STARTEB
                TS              EBANK                           # SET FOR E3

                CAF             NEG1/2                          # INITIALIZE WAITLIST DELTA-TS.
                TS              LST1            +7
                TS              LST1            +6
                TS              LST1            +5
                TS              LST1            +4
                TS              LST1            +3
                TS              LST1            +2
                TS              LST1            +1
                TS              LST1

                CS              ENDTASK
                TS              LST2

## Page 222
                TS              LST2            +2
                TS              LST2            +4
                TS              LST2            +6
                TS              LST2            +8D
                TS              LST2            +10D
                TS              LST2            +12D
                TS              LST2            +14D
                TS              LST2            +16D
                CS              ENDTASK         +1
                TS              LST2            +1
                TS              LST2            +3
                TS              LST2            +5
                TS              LST2            +7
                TS              LST2            +9D
                TS              LST2            +11D
                TS              LST2            +13D
                TS              LST2            +15D
                TS              LST2            +17D

                CS              ZERO                            # MAKE ALL EXECUTIVE REGISTER SETS
                TS              PRIORITY                        # AVAILABLE.
                TS              PRIORITY        +12D
                TS              PRIORITY        +24D
                TS              PRIORITY        +36D
                TS              PRIORITY        +48D
                TS              PRIORITY        +60D
                TS              PRIORITY        +72D
                TS              PRIORITY        +84D

                TS              DSRUPTSW
                TS              NEWJOB                          # SHOWS NO ACTIVE JOBS.

                CAF             VAC1ADRC                        # MAKE ALL VAC AREAS AVAILABLE.
                TS              VAC1USE
                AD              LTHVACA
                TS              VAC2USE
                AD              LTHVACA
                TS              VAC3USE
                AD              LTHVACA
                TS              VAC4USE
                AD              LTHVACA
                TS              VAC5USE

                CAF             TEN
DSPOFF          TS              MPAC                            # R1, R2, R3).
                CS              BIT12
                INDEX           MPAC
                TS              DSPTAB
                CCS             MPAC
                TCF             DSPOFF

## Page 223
                TS              DELAYLOC
                TS              DELAYLOC        +1
                TS              DELAYLOC        +2
                TS              R1SAVE
                TS              INLINK
                TS              DSPCNT
                TS              CADRSTOR
                TS              REQRET
                TS              CLPASS
                TS              DSPLOCK
                TS              MONSAVE                         # KILL MONITOR
                TS              MONSAVE1
                TS              VERBREG
                TS              NOUNREG
                TS              DSPLIST
                TS              MARKSTAT
                TS              EXTVBACT                        # MAKE EXTENDED VERBS AVAILABLE
                TS              IMUCADR
                TS              OPTCADR
                TS              RADCADR
                TS              ATTCADR
                TS              LGYRO
                TS              FLAGWRD4                        # KILL INTERFACE DISPLAYS
                CAF             NOUTCON
                TS              NOUT

                CS              ONE
                TS              SAMPLIM
                CAF             BIT6
                MASK            IMODES33                        # LEAVE BIT 6 UNCHANGED
                AD              IM33INIT                        # NO PIP OR TM FAILS.BIT6=0 IN THIS WORD.
                TS              IMODES33

                CAF             LESCHK                          # SELF CHECK GO-TO REGISTER.
                TS              SELFRET

                CS              VD1
                TS              DSPCOUNT

                TC              Q
                EBANK=          AOSQ
IDLEADR         2CADR           DAPIDLER

IFAILINH        OCT             435
LDNPHAS1        GENADR          DNPHASE1
LESCHK          GENADR          SELFCHK
VAC1ADRC        ADRES           VAC1USE
OCT32001        OCT             32001
LTHVACA         DEC             44

## Page 224
OCT27470        OCT             27470
OCT74160        OCT             74160
OCT30001        OCT             30001
STARTEB         EQUALS          EBANK3
NUMGRPS         EQUALS          FIVE
-ELR            OCT             -22                             # -ERROR LIGHT RESET KEY CODE.
IM30INIF        OCT             37411                           # INHIBITS IMU FAIL FOR 5 SEC AND PIP ISSW
IM30INIR        OCT             37000
IM33INIT        =               PRIO16                          # NO PIP OR TM FAIL SIGNALS.
9,6,4           OCT             450
RMODINIT        OCT             00102
SWINIT          OCT             0
                OCT             0
                OCT             0
                OCT             02000                           # BIT 11 = NOR29FLG
                OCT             0
                OCT             0
                OCT             0
                OCT             00100

                OCT             0
                OCT             0
                OCT             0
                OCT             40000                           # BIT 15 = LRBYPASS.

## Page 225
# PROGRAM NAME    GOTOPOOH                  ASSEMBLY      SUNDANCE
# LOG SECTION     FRESH START AND RESTART

# FUNCTIONAL DESCRIPTION

#       FLASH V 37 ON DSKY %MM CHANGE REQUEST "

# INPUT/OUTPUT INFORMATION

#       A. CALLING SEQUENCE        TC GOTOPOOH

#       B. ERASABLE INITIALIZATION       NONE

#       C. OUTPUT FLASH V 37 ON DSKY

#       D. DEBRIS       L

# PROGRAM ANALYSIS

#       A. SUBROUTINES CALLED PRIODSPR,  LINUS

#       B. NORMAL EXIT        TCF ENDOFJOB

#       C. ALARM AND ABORT EXITS       NONE

                BLOCK           03
                SETLOC          FFTAG5
                BANK

                COUNT*          $$/P00
GOTOPOOH        CAF             OCT33                           # 4.33SPOT FOR GOPOOFIX
                TS              L
                COM
                DXCH            -PHASE4

                TC              POSTJUMP
                CADR            GOPOOFIX
OCT24           MM              20
OCT31           MM              25

                BANK            20
                SETLOC          VERB37
                BANK

                COUNT*          $$/P00                          # VERB 37 AND P00 IN BANK 4.
GOPOOFIX        TC              DOWNFLAG                        # ALLOW X-AXIS OVERRIDE
                ADRES           XOVINFLG

                TC              DOWNFLAG                        # INSURE THAT ULLAGE IS OFF
                ADRES           ULLAGFLG

## Page 226
## Note: Page 226 is missing from the original scan of Luminary131.
##       This page is reconstructed using Luminary099 p. 225 / Lumiary 131 p. 225
                TC              CLEARMRK        +2              # RELEASE MARK DISPLAY SYSTEM.
                CAF             V37N99
                TC              BANKCALL
                CADR            GOFLASH
                TCF             -3
                TCF             -4
                TCF             -5

V37N99          VN              3799

## Page 227
# PROGRAM NAME    V37                       ASSEMBLY      SUNDANCE

# LOG SECTION     FRESH START AND RESTART

# FUNCTIONAL DESCRIPTION

#       1. CHECK IF NEW PROGRAM ALLOWED. IF BIT 1 OF FLAGWRD2(NODOFLAG) IS SET, AN ALARM 1520 IS CALLED.
#       2. CHECK FOR VALIDITY OF PROGRAM SELECTED. IF AN INVALID PROGRAM  IS SELECTED, THE OPERATOR ERROR LIGHT IS
#          SET AND CURRENT ACTIVITY, IF ANY, CONTINUES.
#       3. SERVICER IS TERMINATED IF IT HAS BEEN RUNNING.
#       4. INSTALL IS EXECUTED TO AVOID INTERRUPTING INTEGRATION.
#       5. THE ENGINE IS TURNED OFF AND THE DAP IS INITIALIZED FOR COAST.
#       6. TRACK AND UPDATE FLAGS ARE SET TO ZERO.
#       7. DISPLAY SYSTEM IS RELEASED.
#       8. THE FOLLOWING ARE PERFORMED FOR EACH OF THE THREE CASES.
#         A. PROGRAM SELECTED IS P00.
#            1. RENDEZVOUS AND P25 FLAGS ARE RESET.(KILL P20 AND P25)
#            2. STATINT1     IS SCHEDULED BY SETTING RESTART GROUP 2.
#            3. MAJOR MODE 00 IS STORED IN THE MODE REGISTER(MODREG).
#            4. SUPERBANK 3 IS SELECTED.
#            5. NODOFLAG IS RESET.
#            6. ALL RESTART GROUPS EXCEPT GROUP2 ARE CLEARED. CONTROL ISTRANSFERRED TO RESTART PROGRAM (GOPROG2)
#               WHICH CAUSES ALL CURRENT ACTIVITY TO BE DISCONTINUED AND A 9 MINUTE INTEGRATION CYCLE TO BE
#               INITIATED.
#         B. PROGRAM SELECTES IS P20 OR P25.
#            1. IF THE CURRENT MAJOR MODE IS THE SAME AS THE SELECTED NEWPROGRAM, THE PROGRAM IS RE-INITIALIZED
#               VIA V37XEQ, ALL RESTART GROUPS, EXCEPT GROUP 4 ARE CLEARED.
#            2. IF THE CURRENT MAJOR MODE IS NOT EQUAL TO THE NEW REQUEST, A CHECK IS MADE TO SEE IF THE REQUEST-
#               ED MAJOR MODE HAS BEEN RUNNING IN THE BACKGROUND,
#               AND IF IT HAS, NO NEW PROGRAM IS SCHEDULED, THE EXISTING
#               P20 OR P25 IS RESTARTED TO CONTINUE, AND ITS M M IS SET.
#            3. CONTROL IS TRANSFERRED TO GOPROG2.
#         C. PROGRAM SELECTED IS NEITHER P00,P20, NOR P25
#            1. V37XEQ IS SCHEDULED (AS A JOB) BY SETTING RESTART GROUP 4
#            2. ALL CURRENT ACTIVITY EXCEPT RENDEZVOUS AND TRACKING IS DISCONTINUED BY CLEARING ALL RESTART
#               GROUPS. IF THE RENDEZVOUS OR THE P25 FLAG IS ON, GROUP 2 IS NOT CLEARED, ALLOWING THESE PROGRAMS
#               TO CONTINUE.

# INPUT/OUTPUT INFORMATION

#       A. CALLING SEQUENCE

#           CONTROL IS DIRECTED TO V37 BY THE VERBFAN ROUTINE.
#              VERBFAN GOES TO C(VERBTAB+C(VERBREG)). VERB 37 = MMCHANG.
#              MMCHANG EXECUTES A   TC POSTJUMP. CADR V37.

#       B. ERASABLE INITIALIZATION      NONE

#
#       C. OUTPUT

## Page 228
#           MAJOR MODE CHANGE

#       D. DEBRIS
#            MMNUMBER, MPAC +1, MINDEX, BASETEMP +C(MINDEX), FLAGWRD0, FLAGWRD1, FLAGWRD2, MODREG, GOLOC -1,
#            GOLOC, GOLOC +1, GOLOC +2, BASETEMP, -PHASE2, PHASE2, -PHASE4

# PROGRAM ANALYSIS

#       A. SUBROUTINES CALLED
#            ALARM, RELDSP, PINBRNCH, INTSTALL, ENGINOF2, ALLCOAST, V37KLEAN, GOPROG2, FALTON, FINDVAC, SUPERSW,
#            DSPMM

#       B. NORMAL EXIT        TC ENDOFJOB

#       C. ALARMS      1520 (MAJOR MODE CHANGE NOT PERMITTED)

V37             TS              MMNUMBER                        # SAVE MAJOR MODE
                CAF             PRIO30                          # RESTART AT PINBALL PRIORITY
                TS              RESTREG

                CA              IMODES30                        # IS IMU BEINB INITIALIZED
                MASK            BIT6
                CCS             A
                TCF             CANTROD

                CS              MMNUMBER                        # IS P70 REQUESTED?
                AD              DEC70
                EXTEND
                BZF             SETUP70                         # YES
                AD              ONE                             # IS P71 REQUESTED?
                EXTEND
                BZF             SETUP71                         # YES

                CA              MMNUMBER                        # IS NEW REQUEST POO
                EXTEND
                BZF             ISSERVON                        # YES, CHECK SERVICER STATUS

                CS              FLAGWRD2                        # NO, IS NODO V37 FLAG SET
                MASK            NODOBIT
                CCS             A
                TCF             CHECKTAB                        # NO
CANTROD         TC              ALARM
                OCT             1520

V37BAD          TC              RELDSP                          # RELEASES DISPLAY FROM ASTRONAUT

                TC              POSTJUMP                        # BRING BACK LAST NORMAL DISPLAY IF THERE
                CADR            PINBRNCH                        # WAS ONE. OTHERWISE DO AN EOJ.

CHECKTAB        CA              NOV37MM                         # INDEX FOR MM TABLES.

## Page 229
AGAINMM         TS              MPAC            +1
                NDX             MPAC            +1
                CA              PREMM1                          # OBTAIN WHICH MM THIS IS FOR
                MASK            LOW7
                COM
                AD              MMNUMBER
                CCS             A
                CCS             MPAC            +1              # IF GR, SEE IF ANY MORE IN LIST
                TCF             AGAINMM                         # YES, GET NEXT ONE
                TCF             V37NONO                         # LAST TIME OR PASSED MM

                CA              MPAC            +1
                TS              MINDEX                          # SAVE INDEX FOR LATER

ISSERVON        CS              FLAGWRD7                        # V37 FLAG SET - I.E. IS SERVICER GOING
                MASK            V37FLBIT
                CCS             A
                TCF             CANV37                          # NO

                TC              DOWNFLAG                        # YES, TURN OFF THE AVERAGE FLAG AND
                ADRES           AVEGFLAG                        # WAIT FOR SERVICER TO RETURN TO V37RET.

                TCF             ENDOFJOB

V37RET          CS              FLAGWRD0                        # IS P20 OR P22 RUNNING?
                MASK            RNDVZBIT
                CCS             A
                TCF             +2                              # NO. CHECK FOR P25.
                TCF             2.7SPT                          # YES.  DO 2.7SPOT
                CS              FLAGWRD0                        # IS P25 RUNNING?
                MASK            P25FLBIT
                CCS             A
2.0SPT          CA              OCT37667
2.11SPT         AD              BIT5
2.7SPT          AD              OCT40072
                TC              PHSCHNGA

CANV37          CAF             ZERO
                EXTEND
                WRITE           SUPERBNK

                CAF             ROOAD
                TS              TEMPFLSH

                TC              PHASCHNG
                OCT             14

ROO             TC              INTPRET

                CALL                                            # WAIT FOR INTEGRATION TO FINISH

## Page 230
                                INTSTALL
DUMMYAD         EXIT

                TC              DOWNFLAG
                ADRES           3AXISFLG                        # RESET 3-AXIS FLAG

                TC              DOWNFLAG
                ADRES           POOHFLAG

                CAF             LRBYBIT                         # CLEAN UP THE R12 FLAGWORD.
                TS              FLGWRD11

                TC              DOWNFLAG                        # INSURE THAT THE R04FLAG IS CLEAR.
                ADRES           R04FLAG

                TC              DOWNFLAG
                ADRES           GLOKFAIL                        # FLAGWORD 3 BIT 14

                TC              DOWNFLAG                        # INSURE MUNFLAG IS CLEAR.
                ADRES           MUNFLAG

                TC              DOWNFLAG                        # ALLOW X-AXIS OVERRIDE.
                ADRES           XOVINFLG
                CCS             MMNUMBER                        # IS THIS A POOH REQUEST
                TCF             NOUVEAU                         # NO, PICK UP NEW PROGRAM

POOH            TC              RELDSP                          # RELEASE DISPLAY SYSTEM

                CAF             PRIO5                           # SET VARIABLE RESTART PRIORITY FOR
                TS              PHSPRDT2                        # P00 INTEGRATION.

                TC              CLRADMOD                        # CLRADMOD DOES AN INHINT.

                CS              NODOBIT                         # TURN OFF NODOFLAG.
                MASK            FLAGWRD2
                TS              FLAGWRD2

                CA              FIVE                            # SET RESTART FOR STATEINT1
                TS              L
                COM
                DXCH            -PHASE2

                CS              OCT700                          # TURN OFF P20,P25,IMU IN USE FLAG
                MASK            FLAGWRD0
                TS              FLAGWRD0                        #                        RENDFLG

                CAF             DNLADP00

SEUDOPOO        TS              DNLSTCOD                        # SET UP APPROPRIATE DOWNLIST CODE
                TS              AGSWORD                         #  (CURRENT LIST WILL BE COMPLETED BEFORE

## Page 231
                                                                #   NEW ONE IS STARTED)
                TC              IBNKCALL
                CADR            ENGINOF1

                TC              IBNKCALL                        # INSURE ALLCOAST.
                CADR            ALLCOAST                        # DOES A RESTORDB.

                CS              OCT120                          # TURN OFF TRACK, UPDATE FLAGS
                TS              EBANKTEM
                MASK            FLAGWRD1
                TS              FLAGWRD1

                TC              IBNKCALL                        # KILL GROUPS 1,3,5,6
                CADR            V37KLEAN

                CCS             MMNUMBER                        # IS IT POOH
                TCF             RENDVOO                         # NO
GOMOD           TC              IBNKCALL                        # REDUNDANT EXCEPT FOR GROUP 4
                CADR            POOKLEAN

                CA              MMNUMBER
                TS              MODREG

GOGOPROG        TC              POSTJUMP
                CADR            GOPROG2

RENDVOO         CS              MODREG                          # IS CURRENT PROGRAM 22
                AD              OCT26
                EXTEND
                BZF             RESET22                         # YES - CLEAR RENDEZVOUS FLAG

                CS              MMNUMBER                        # IS NEW PROGRAM P22
                AD              OCT26
                EXTEND
                BZF             RESET22


                AD              NEG2                            # IS NEW PROGRAM = P20 OR P25
                EXTEND
                BZF             RENDNOO                         # YES
                AD              FIVE                            # 25
                EXTEND
                BZF             RENDNOO                         # YES

                CA              OCT500                          # NO, IS EITHER P20 OR P25 RUNNING
                MASK            FLAGWRD0
                CCS             A
                TCF             POOFIZZ                         # YES, LEAVE GROUP 2 TO PICK UP P20 OR P25

## Page 232

RESET22         CS              OCT700                          # CLEAR RENDEZVOUS, P25
                MASK            FLAGWRD0                        # AND IMU IN USE FLAGS
                TS              FLAGWRD0
                TC              CLRADMOD

KILL2           EXTEND                                          # NO, KILL 2
                DCA             NEG0
                DXCH            -PHASE2

POOFIZZ         CAF             V37QCAD                         # RESTART POINT FOR V37XEQ
                TS              TEMPFLSH

                TCF             GOGOPROG

RENDNOO         CS              MODREG
                AD              OCT24
                EXTEND
                BZF             KILL2                           # P20 OR P25 ON TOP OF P20 OR P25 -

                AD              FIVE
                EXTEND
                BZF             KILL2

                CA              OCT500
                MASK            FLAGWRD0
                AD              MMNUMBER
                COM
                AD              P20REG                          # IS IT 20 AND IS RENDEZVOUS FLAG ON
                EXTEND
                BZF             STATQUO                         # YES
                AD              OCT305                          # IS IT 25 AND IS P25 BIT ON
                EXTEND
                BZF             STATQUO                         # YES, LEAVE AS IS
                TCF             KILL2

STATQUO         CS              FLAGWRD1                        # SET TRACKFLAG
                MASK            OCT120                          #     UPDATE FLAG
                ADS             FLAGWRD1

                TCF             GOMOD

NOUVEAU         CAF             OCT500                          # IS P20 OR P25 FLAG SET
                MASK            FLAGWRD0
                CCS             A
                TCF             +3                              # YES
                TC              DOWNFLAG                        # NO,RESET IMUINUSE FLAG
                ADRES           IMUSE

                INDEX           MINDEX
                CAF             DNLADMM1                        # OBTAIN APPROPRIATE DOWNLIST ADDRESS

## Page 233
                INHINT
                TCF             SEUDOPOO

V37NONO         TC              FALTON                          # COME HERE IF MM REQUESTED DOESNT EXIST

                TCF             V37BAD

OCT00010        EQUALS          BIT4
OCT500          OCT             500                             # BITS 7 AND 9
OCT305          OCT             305
OCT26           OCT             26
P20REG          OCT             124

V37XEQ          INHINT
                INDEX           MINDEX
                CAF             PREMM1                          # OBTAIN PRIO, EBANK, AND MM
                TS              MMTEMP
                TS              CYR                             # SHIFT RIGHT TO BITS 14 - 10

                CA              CYR
                MASK            PRIO37
                TS              PHSPRDT4                        # PRESET GROUP 4 RESTART PRIORITY
                TS              NEWPRIO                         # STORE PRIO FOR SPVAC

                CA              MMTEMP                          # OBTAIN EBANK - BITS 8, 9, 10 OF MMTEMP.
                EXTEND
                MP              BIT8
                MASK            LOW3
                TS              L

                INDEX           MINDEX
                CAF             FCADRMM1
                TS              BASETEMP                        # MAKE BBCON BY ADDING HI5 OF FCADR
                MASK            HI5
                ADS             L

                CA              BASETEMP                        # OBTAIN GENADR PORTION OF 2CADR.
                MASK            LOW10
                AD              BIT11

                TC              SPVAC

V37XEQC         CA              MMTEMP                          # UPON RETURN FROM FINDVAC PLACE THE
                MASK            LOW7                            # NEW MM IN MODREG (THE LOW 7 BITS OF
                TC              NEWMODEA                        # PHSPRDT1)

                TC              RELDSP                          # RELEASE DISPLAY
                TC              ENDOFJOB                        # AND EXIT

NEG7            EQUALS          OCT77770

## Page 234

MMTEMP          EQUALS          PHSPRDT3
BASETEMP        EQUALS          TBASE4
V37QCAD         CADR            V37XEQ          +3
ROOAD           CADR            DUMMYAD
OCT37667        OCT             37667
OCT40072        OCT             40072
OCT700          OCT             700

SETUP71         CAF             THREE
SETUP70         TS              Q
                EXTEND
                DCA             P70CADR
                AD              Q
                DTCB

DEC70           DEC             70
                EBANK=          R
P70CADR         2CADR           P70
# FOR VERB 37 TWO TABLES ARE MAINTAINED. EACH TABLE HAS AN ENTRY FOR EACH
# MAJOR MODE THAT CAN BE STARTED FROM THE KEYBOARD. THE ENTRIES ARE PUT
# INTO THE TABLE WITH THE ENTRY FOR THE HIGHEST MAJOR MODE COMING FIRST,

# TO THE LOWEST MAJOR MODE WHICH IS THE LAST ENTRY IN EACH TABLE.

#          THE FCADRMM TABLE CONTAINS THE FCADR OF THE STARTING JOB OF
# THE MAJOR MODE.   FOR EXAMPLE,

#                                         FCADRMM1 FCADR  P79             START OF P 79
#                                                  FCADR  PROG18          START OF P 18
#                                                  FCADR  P01             START OF P 01

# NOTE:         THE FIRST ENTRY MUST BE LABLED FCADRMM1.
# -----

FCADRMM1        FCADR           P76
                FCADR           P75
                FCADR           P74
                FCADR           P73
                FCADR           P72
                FCADR           LANDJUNK
                FCADR           P63LM
                FCADR           P57
                FCADR           PROG52
                FCADR           P51
                FCADR           P47LM
                FCADR           P42LM
                FCADR           P41LM
                FCADR           P40LM
                FCADR           P35

## Page 235
                FCADR           P34
                FCADR           P33
                FCADR           P32
                FCADR           P30
                FCADR           PROG25
                FCADR           PROG22
                FCADR           PROG21
                FCADR           PROG20
                FCADR           P12LM
                FCADR           P06
#          THE PREMM TABLE CONTAINS THE E-BANK,MAJOR MODE, AND PRIORITY
# INFORMATION, IT IS IN THE FOLLOWING FORM,

#          PPP PPE EEM MMM MMM

#          WHERE THE 7 M BITS CONTAIN THE MAJOR MODE NUMBER
#                     3 E BITS CONTAIN THE E-BANK NUMBER
#                     5 P BITS CONTAIN THE PRIORITY AT WHICH THE JOB IS
#                         TO BE STARTED

#          FOR EXAMPLE,

#                                         PREMM1   OCT    67213           PRIORITY      33
#                                                                         E-BANK         5
#                                                                         MAJOR MODE    11
#                                                  OCT    25437           PRIORITY       12
#                                                                         E-BANK         6
#                                                                         MAJOR MODE    31

# NOTE,    THE FIRST ENTRY MUST BE LABELED PREMM1

PREMM1          OCT             27714                           # MM 76  EBANK 7  PRIO 13
                OCT             27713                           # MM 75  EBANK 7  PRIO 13
                OCT             27712                           # MM 74  EBANK 7  PRIO 13
                OCT             27711                           # MM 73  EBANK 7  PRIO 13
                OCT             27710                           # MM 72  EBANK 7  PRIO 13
                OCT             27704                           # MM 68  EBANK 7  PRIO 13
                OCT             27677                           # MM 63  EBANK 7  PRIO 13
                OCT             27271                           # MM 57  EBANK 5  PRIO 13
                OCT             27264                           # MM 52  EBANK 5  PRIO 13
                OCT             27263                           # MM 51  EBANK 5  PRIO 13
                OCT             27657                           # MM 47  EBANK 7  PRIO 13
                OCT             27652                           # MM 42  EBANK 7  PRIO 13
                OCT             27651                           # MM 41  EBANK 7  PRIO 13
                OCT             27650                           # MM 40  EBANK 7  PRIO 13
                OCT             27643                           # MM 35  EBANK 7  PRIO 13
                OCT             27642                           # MM 34  EBANK 7  PRIO 13
                OCT             27641                           # MM 33  EBANK 7  PRIO 13
                OCT             27640                           # MM 32  EBANK 7  PRIO 13
                OCT             27636                           # MM 30  EBANK 7  PRIO 13
                OCT             27631                           # MM 25  EBANK 7  PRIO 13

## Page 236
                OCT             27626                           # MM 22  EBANK 7  PRIO 13
                OCT             27625                           # MM 21  EBANK 7  PRIO 13
                OCT             27624                           # MM 20  EBANK 7  PRIO 13
                OCT             27614                           # MM 12  EBANK 7  PRIO 13
                OCT             27006                           # MM 06  EBANK 4  PRIO 13
# NOTE,    THE FOLLOWING CONSTANT IS THE NUMBER OF ENTRIES IN EACH OF
# ----     THE ABOVE LISTS-1(IE, THE NUMBER OF MAJOR MODES(EXCEPT P00)
#          THAT CAN BE CALLED FROM THE KEYBOARD MINUS ONE)

NOV37MM         DEC             24                              # MM'S -1

DNLADMM1        ADRES           RENDEZVU                        # P76
                ADRES           RENDEZVU                        # P75
                ADRES           RENDEZVU                        # P74
                ADRES           RENDEZVU                        # P73
                ADRES           RENDEZVU                        # P72
                ADRES           DESASCNT                        # P68
                ADRES           DESASCNT                        # P63
                ADRES           LUNRSALN                        # P57
                ADRES           COSTALIN                        # P52
                ADRES           COSTALIN                        # P51
                ADRES           ORBMANUV                        # P47
                ADRES           ORBMANUV                        # P42
                ADRES           ORBMANUV                        # P41
                ADRES           ORBMANUV                        # P40
                ADRES           RENDEZVU                        # P35
                ADRES           RENDEZVU                        # P34
                ADRES           RENDEZVU                        # P33
                ADRES           RENDEZVU                        # P32
                ADRES           RENDEZVU                        # P30
                ADRES           RENDEZVU                        # P25
                ADRES           LUNRSALN                        # P22
                ADRES           RENDEZVU                        # P21
                ADRES           RENDEZVU                        # P20
                ADRES           DESASCNT                        # P12
                ADRES           COSTALIN                        # P06
DNLADP00        =               ZERO
COSTALIN        =               0
AGSUPDAT        =               1
RENDEZVU        =               2
ORBMANUV        =               3
DESASCNT        =               4
LUNRSALN        =               5
                BANK            13
                SETLOC          INTINIT
                BANK

                COUNT*          $$/INTIN

                EBANK=          RRECTCSM

## Page 237
# THIS ROUTINE DOES THE POO INTEGRATION

STATEUP         SET             BOF                             # EXTRAPOLATE CM STATE VECTOR
                                VINTFLAG
                                SURFFLAG                        # ALSO 6X6 W-MATRIX IF LM ON LUNAR
                                DOINT                           #      SURFACE AND W-MATRIX VALID
                BOF             SET                             #      FOR RENDEZVOUS NAVIGATION.
                                RENDWFLG
                                DOINT
                                DIM0FLAG
DOINT           CLEAR           CALL
                                PRECIFLG                        # ENGAGES 4-TIME STEP LOGIC IN INTEGRATION
                                INTEGRV                         # WHEN MODREG = 0

                BON             DLOAD
                                SURFFLAG
                                NO-INT
                                TETCSM
                STCALL          TDEC1
                                INTSTALL
                CLEAR           CALL                            # EXTRAPOLATE LM STATE VECTOR
                                VINTFLAG
                                SETIFLGS
                BOF                                             # ALSO 9X9 W-MATRIX IF W IS VALID
                                RENDWFLG
                                DOINT2
                SET             SET
                                DIM0FLAG
                                D6OR9FLG
DOINT2          SET             CALL
                                PRECIFLG                        # DISENGAGE 4 TIME STEP LOGIC IN INTEG.
                                INTEGRV
NO-INT          CLRGO
                                NODOFLAG
                                ENDINT


# THISVINT IS CALLED BY MIDTOAV1 AND 2

THISVINT        CLEAR           RVQ
                                VINTFLAG
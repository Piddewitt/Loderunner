; --------------------------------------------------------------------------------------------------------------------- ;
;  Lode Runner - Zero Page Equates
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_LodeRuCol               = $03                           ;       loderunner actual col on level ctrl data
LRZ_LodeRuRow               = $04                           ;       loderunner actual row on level ctrl data
LRZ_LodeRuOnImgPosX         = $05                           ;       loderunner pos on image left/right
LRZ_LodeRuOnImgPosX_Min       = $00                         ; 
LRZ_LodeRuOnImgPosX_Mid       = $02                         ;       loderunner pos on image left/right - $02=center
LRZ_LodeRuOnImgPosX_Max       = $04                         ; 
LRZ_LodeRuOnImgPosY         = $06                           ;       loderunner pos on image up/down
LRZ_LodeRuOnImgPosY_Min       = $00                         ; 
LRZ_LodeRuOnImgPosY_Mid       = $02                         ;       loderunner pos on image up/down    - $02=center
LRZ_LodeRuOnImgPosY_Max       = $04                         ; 
LRZ_LodeRuSprtNum           = $07                           ;       loderunner sprite number
LRZ_LodeRuSprtNumRunLe_00     = $00                         ;       run    left 01
LRZ_LodeRuSprtNumRunLe_01     = $01                         ;       run    left 02
LRZ_LodeRuSprtNumRunLe_02     = $02                         ;       run    left 03
LRZ_LodeRuSprtNumPoleLe_00    = $03                         ;       pole   left 01
LRZ_LodeRuSprtNumPoleLe_01    = $04                         ;       pole   left 02
LRZ_LodeRuSprtNumPoleLe_02    = $05                         ;       pole   left 03
LRZ_LodeRuSprtNumShootLe      = $06                         ;       fire   left
LRZ_LodeRuSprtNumFallLe       = $07                         ;       fall   left
LRZ_LodeRuSprtNumRunRi_00     = $08                         ;       run    right 01
LRZ_LodeRuSprtNumRunRi_01     = $09                         ;       run    right 02
LRZ_LodeRuSprtNumRunRi_02     = $0a                         ;       run    right 03
LRZ_LodeRuSprtNumPoleRi_00    = $0b                         ;       pole   right 01
LRZ_LodeRuSprtNumPoleRi_01    = $0c                         ;       pole   right 02
LRZ_LodeRuSprtNumPoleRi_02    = $0d                         ;       pole   right 03
LRZ_LodeRuSprtNumShootRi      = $0e                         ;       fire   right
LRZ_LodeRuSprtNumFallRi       = $0f                         ;       fall   right
LRZ_LodeRuSprtNumLadder_00    = $10                         ;       ladder up/down 01
LRZ_LodeRuSprtNumLadder_01    = $11                         ;       ladder up/down 02
LRZ_LodeRuShootMode         = $08                           ; 
LRZ_LodeRuShootMode_Back      = $01                         ;       loderunner shoots against view direction
LRZ_LodeRuShootMode_Front     = $ff                         ;       loderunner shoots in view direction
; --------------------------------------------------------------------------------------------------------------------- ;
; pointers
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_LevelDataGamePtrRow     = $09                           ; ptr:  expanded level data rows $0800-$09c3
LRZ_LevelDataGamePtrRow_Lo    = $09                         ;       in game modified with lr/enemy/hole tiles
LRZ_LevelDataGamePtrRow_Hi    = $0a                         ; 
                            
LRZ_LevelDataCtrlPtrRow     = $0b                           ; ptr:  expanded level data rows $0a00-$0bc3
LRZ_LevelDataCtrlPtrRow_Lo    = $0b                         ;       original level structure without lr/enemy/hole tiles
LRZ_LevelDataCtrlPtrRow_Hi    = $0c                         ; 
                            
LRZ_StartGfxDisplay         = $0d                           ; ptr:  start screen gfx ouput
LRZ_StartGfxDisplay_Lo        = $0d                         ; 
LRZ_StartGfxDisplay_Hi        = $0e                         ; 
                            
LRZ_ImageDataOffPtr         = $0d                           ; ptr:  image data offsets
LRZ_ImageDataOffPtr_Lo        = $0d                         ; 
LRZ_ImageDataOffPtr_Hi        = $0e                         ; 

LRZ_SignRowNumberTabPtr     = $0d                           ; ptr:  image game over singn data offsets
LRZ_SignRowNumberTabPtr_Lo    = $0d                         ; 
LRZ_SignRowNumberTabPtr_Hi    = $0e                         ; 

LRZ_ScreenGfxPtr            = $0f                           ; ptr:  copy graphic data start address
LRZ_ScreenGfxPtr_Lo           = $0f                         ; 
LRZ_ScreenGfxPtr_Hi           = $10                         ; 
                            
LRZ_ScreenGfxDisplayPtr     = $0f                           ; ptr:  hires display graphic prepare screen
LRZ_ScreenRowDisplayPtr_Lo    = $0f                         ; 
LRZ_ScreenRowDisplayPtr_Hi    = $10                         ; 
                            
LRZ_ScreenRowPreparePtr     = $11                           ; ptr:  hires display graphic display screen
LRZ_ScreenRowPreparePtr_Lo    = $11                         ; 
LRZ_ScreenRowPreparePtr_Hi    = $12                         ; 
                            
LRZ_InputTextOutPtr         = $13                           ; ptr:  to $00 delimited text output string
LRZ_InputTextOutPtr_Lo        = $13                         ; 
LRZ_InputTextOutPtr_Hi        = $14                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_EnemyCol                = $15                           ;       actual enemy col on level ctrl data
LRZ_EnemyRow                = $16                           ;       actual enemy row on level ctrl data
LRZ_EnemySprtNum            = $17                           ;       actual enemy sprite number
LRZ_EnemySprtNum_Run_Le_00    = $00                         ;       run    left 01
LRZ_EnemySprtNum_Run_Le_01    = $01                         ;       run    left 02
LRZ_EnemySprtNum_Run_Le_02    = $02                         ;       run    left 03
LRZ_EnemySprtNum_Pole_Le_00   = $03                         ;       pole   left 01
LRZ_EnemySprtNum_Pole_Le_01   = $04                         ;       pole   left 02
LRZ_EnemySprtNum_Pole_Le_02   = $05                         ;       pole   left 03
LRZ_EnemySprtNum_Fall_Le      = $06                         ;       fall   left
LRZ_EnemySprtNum_Run_Ri_00    = $07                         ;       run    right 01
LRZ_EnemySprtNum_Run_Ri_01    = $08                         ;       run    right 02
LRZ_EnemySprtNum_Run_Ri_02    = $09                         ;       run    right 03
LRZ_EnemySprtNum_Pole_Ri_00   = $0a                         ;       pole   right 01
LRZ_EnemySprtNum_Pole_Ri_01   = $0b                         ;       pole   right 02
LRZ_EnemySprtNum_Pole_Ri_02   = $0c                         ;       pole   right 03
LRZ_EnemySprtNum_Fall_Ri      = $0d                         ;       fall   right
LRZ_EnemySprtNum_Ladder_00    = $0e                         ;       ladder up/down 01
LRZ_EnemySprtNum_Ladder_01    = $0f                         ;       ladder up/down 02
LRZ_EnemyViewDir            = $18                           ;       actual enemy dir right/left  $ff=left  $01=right
LRZ_EnemyViewDir_None         = $00                         ; 
LRZ_EnemyViewDir_Ri           = $01                         ; 
LRZ_EnemyViewDir_Le           = $ff                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; if negative: enemy has gold       - timer is counted up   to $00
; if positive: enemy sits in a hole - timer is counted down to $00
; ------------------------------------------------------------------------------------------------------------- ;
LRZ_EnemyHoleGoldTime       = $19                           ;       time in hole / time carry gold
LRZ_EnemyHoleGoldTime_None    = $00                         ;       time in hole / time carry gold exhausted
LRZ_EnemyHoleGoldTime_Shake   = $0d                         ;       in hole time - start to shiver if lower
LRZ_EnemyHoleGoldTime_Shake_X = $07                         ;       in hole time - get out of hole if lower
LRZ_EnemyHoleGoldTime_Ini     = $ff                         ;       gold timer start value - randomized by LR_EnemyBirthCol
; ------------------------------------------------------------------------------------------------------------- ;
LRZ_EnemyOnImgPosX          = $1a                           ;       actual enemy pos on image left/right
LRZ_EnemyOnImgPosX_Min        = $00                         ; 
LRZ_EnemyOnImgPosX_Mid        = $02                         ;       enemy pos on image left/right - $02=center
LRZ_EnemyOnImgPosX_Max        = $04                         ; 
LRZ_EnemyOnImgPosY          = $1b                           ;       actual enemy pos on image up/down
LRZ_EnemyOnImgPosY_Min        = $00                         ; 
LRZ_EnemyOnImgPosY_Mid        = $02                         ;       enemy pos on image up/down - $02=center
LRZ_EnemyOnImgPosY_Max        = $04                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_Notused_01              = $1c                           ; 
LRZ_Notused_02              = $1d                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_WorkStartGfxDataCount   = $1e                           ; work: start grafic output data counter/offset
LRZ_WorkGameOverParmTabOff  = $1e                           ; work: offse game over sign row number parm table
LRZ_WorkJoystickMove        = $1e                           ; work: save CIA register value for joysick move checks
LRZ_WorkDiskRC              = $1e                           ; work: disk operation return code
LRZ_WorkTargetDir           = $1e                           ; work: get enemy move target dir
LRZ_WorkEnemyParmSave       = $1e                           ; work: save enemy col/row value for subtraction
LRZ_WorkLevelDataPartCtrl   = $1e                           ; work: flag left or right nibble disk data byte procecssing
LRZ_WorkCopyProtTabOff      = $1e                           ; work: offset to copy protection value table
LRZ_WorkHiresRowStartAdr_Lo = $1e                           ; work: hires row address LO
LRZ_WorkHiresRowStartAdr_Hi = $1f                           ; work: hires row address HI
LRZ_WorkStartGfxData        = $1f                           ; work: start grafic output data byte
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_ScreenSpinColOff        = $20                           ;       game over sign column position
LRZ_ScreenSpinColOff_Left     = $70                         ;       game over sign start column
LRZ_ScreenGfxRowPosY        = $20                           ;       grafic screen row column offset
LRZ_EnemyMoveMaxRow         = $20                           ;       actual row for scan enemy move col max left/right
LRZ_WorkSpritePosX          = $21                           ; work: gfx screen PosX
LRZ_ImageHeight             = $22                           ;       image height
LRZ_ImageHeight_Max           = LR_ImageHeight              ;       $0b
LRZ_WorkScoreEntryLen       = $22                           ; work: score buffer entry length
LRZ_WorkKeyNew              = $23                           ; work: new input key check
LRZ_ImageNumber             = $23                           ;       image number $00-$67 ($66/$67 unnused)
LRZ_ImageNumber_Blank         = $00                  ;      ;       level tile
LRZ_ImageNumber_Level_Tiles   = $01                  ; -$09 ;       level tiles
LRZ_ImageNumber_Blank_Rev     = $0a                  ;      ;       reversed blank
LRZ_ImageNumber_Sprt_LodeRu   = $0b                  ; -$27 ;       loderunner sprites
LRZ_ImageNumber_Sprt_Enemy    = $28                  ; -$36 ;       enemy sprites
LRZ_ImageNumber_Hole_Close    = $37                  ; -$38 ;       close holes
LRZ_ImageNumber_Rebirth       = $39                  ; -$3a ;       enemy rebirth
LRZ_ImageNumber_Digit         = $3b                  ; -$44 ;       digits
LRZ_ImageNumber_Char          = $45                  ; -$5e ;       chars A-Z  
LRZ_ImageNumber_Char_Special  = $5f                  ; -$65 ;       chars special  > . ( ) / - <
LRZ_WorkImgOffsetPosX       = $23                           ; work: save immage offset
LRZ_ImageOutputScreen       = $24                           ;       target output screen $20=$2000 $40=$4000
LRZ_WorkChkDiskIdResult     = $25                           ; 
LRZ_GfxImageClearLeft       = $25                           ;       prepare screen image byte for insertion of the buffer image byte
LRZ_GfxImageClearRight      = $26                           ;       prepare screen image byte for insertion of the buffer image byte
LRZ_LodeRuEnemyCollision    = $27                           ;       loderunner-enemy sprite collision value
LRZ_ScoreBoardRank          = $28                           ; work: actual rank
LRZ_EnemyMoveColStart       = $28                           ;       fix enemy move start col
LRZ_ScoreBoardOff           = $29                           ; work: score board offset
LRZ_EnemyMoveRowStart       = $29                           ; work: fix enemy move start row
LRZ_EnemyMoveLodeRuColGap   = $2a                           ;       scan gap between enemy and loderunner if both are on same row
LRZ_EnemyMoveDir            = $2b                           ;       actual enemy move direction
LRZ_EnemyMoveDir_Ini          = $00                         ;       
LRZ_EnemyMoveDir_Le           = $01                         ;       left
LRZ_EnemyMoveDir_Up           = $02                         ;       up
LRZ_EnemyMoveDir_Ri           = $03                         ;       right
LRZ_EnemyMoveDir_Do           = $04                         ;       down
LRZ_EnemyMoveDistMin        = $2c                           ; work: try to find the nex enemy move dir if not on same row as loderunner
LRZ_EnemyMoveDistMin_Ini      = $ff                         ;       init to -1
LRZ_EnemyMoveMaxCol_Le      = $2d                           ;       maximum move enemy left if no obstacles in the way
LRZ_EnemyMoveMaxCol_Ri      = $2e                           ;       maximum move enemy right if no obstacles in the way
LRZ_EnemyMoveScanRowMax     = $2f                           ; work: save max enemy move scan row found 
LRZ_SfxScoreSub             = $2f                           ;       add score tune subtraction value
LRZ_SfxScoreSub_Base          = $40                         ;       add score tune
LRZ_SfxScoreSub_Start         = LR_Score_FinishLevel / 100 - $01 ;  score sub start value - each dec scores 100 points
LRZ_EnemyMoveScanCol        = $30                           ;       enemy move target row
LRZ_EnemyMoveScanRow        = $31                           ;       enemy move target col
LRZ_EnemyMoveCycle          = $0032                         ;       enemy move cycles tab
LRZ_EnemyMoveCycle_01         = $32                         ;       enemy move cycles tab value 1
LRZ_EnemyMoveCycle_02         = $33                         ;       enemy move cycles tab value 2
LRZ_EnemyMoveCycle_03         = $34                         ;       enemy move cycles tab value 3
LRZ_EnemyMoveCycleWork      = $35                           ;       enemy move work value
LRZ_EnemyMoveCycleOff       = $36                           ;       enemy move pointer actual cycles ($32-$34)
LRZ_EnemyMoveCycleOff_Min     = $00                         ; 
LRZ_EnemyMoveCycleOff_Max     = LRZ_EnemyMoveCycle_03 - LRZ_EnemyMoveCycle + $01 ; $03
LRZ_CircleCounter_Lo        = $37                           ; 
LRZ_CircleCounter_Hi        = $38                           ; 
LRZ_WorkScoreNewEntryNum    = $39                           ; work: save number of new leaderboard entry
LRZ_CircleRadiusWork_Lo     = $39                           ; 
LRZ_CircleRadiusWork_Hi     = $3a                           ; 
LRZ_CircleDiameter_Lo       = $3b                           ; 
LRZ_CircleDiameter_Hi       = $3c                           ; 
LRZ_CircleRadius            = $3d                           ; 
LRZ_CircleRadius_Min          = $01                         ; 
LRZ_CircleRadius_Max          = $a4                         ; 
LRZ_CircleRadiusCenter_PosX   = $a0                         ; 
LRZ_CircleRadiusCenter_PosY   = $58                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_Notused_3e              = $3e                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_WorkCircleColNum        = $3f                           ; work: 
LRZ_CircleStep_Lo           = $3f                           ; 
LRZ_CircleStep_Hi           = $40                           ; 
LRZ_ScreenGfxPartPosY       = $41                           ;       image y-position part number  (bits 0-1 of LRZ_ScreenCol substitution)
LRZ_CircleDirection         = $42                           ; flag: circle open/close direction
LRZ_CircleDirection_Open      = $01                         ;       
LRZ_CircleDirection_Close     = $00                         ;       
LRZ_CirclePosY              = $43                           ;       
LRZ_CirclePosY_Max            = $b0                         ;       
LRZ_CirclePosY_Oc34         = $43                           ;       
LRZ_CirclePosY_Oc78         = $44                           ;       
LRZ_CirclePosY_Oc56         = $45                           ;       
LRZ_CirclePosY_Oc12         = $46                           ;       
LRZ_CircleColNum            = $47                           ; 
LRZ_CircleColNum_Max          = $28                         ; 
LRZ_CircleColNum_Oc56       = $47                           ; 
LRZ_CircleColNum_Oc24       = $48                           ; 
LRZ_CircleColNum_Oc13       = $49                           ; 
LRZ_CircleColNum_Oc78       = $4a                           ; 
LRZ_CircleClearTabOff_Oc68  = $4b                           ;       octant 6 and 8
LRZ_CircleClearTabOff_Min     = $00                         ; 
LRZ_CircleClearTabOff_Max     = TabCircleTileClear_Len + $01; 
LRZ_CircleClearTabOff_Oc24  = $4c                           ; 
LRZ_CircleClearTabOff_Oc13  = $4d                           ; 
LRZ_CircleClearTabOff_Oc57  = $4e                           ; 
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_ScreenCol               = $4f                           ;       screen col  (00-1b)
LRZ_ScreenCol_Min             = $00                         ; 
LRZ_ScreenCol_Status_Score    = $05                         ;       column offset for score output in status line
LRZ_ScreenCol_Status_Lives    = $10                         ;       column offset for lives output in status line
LRZ_ScreenCol_Status_Level    = $19                         ;       column offset for level output in status line
LRZ_ScreenCol_Max             = $1b                         ; 
LRZ_ScreenRow               = $50                           ;       screen row  (00-0f)
LRZ_ScreenRow_Min             = $00                         ; 
LRZ_ScreenRow_Max             = $0f                         ; 
LRZ_ScreenRow_BED_Input_Min   = $00                         ;       min screen row for board editor commands
LRZ_ScreenRow_BED_Input_Max   = $09                         ;       max screen row for board editor commands
LRZ_ScreenRow_Status_Sep      = $10                         ;       status row number separator line
LRZ_ScreenRow_Spin            = $50                         ;       screen row game over sign
LRZ_WaitForDemoCounter      = $50                           ;       wait for demo counter
LRZ_TargetGfxOutput         = $51                           ;       target output indicator -  $20=$2000 $40=$4000
LRZ_HoleOpenTimeTabOff      = $52                           ;       offset open hole time table
LRZ_LevelDiskDataOff        = $53                           ;       offset into packed level data loaded from disk
LRZ_ShootStepCtrl           = $54                           ;       loderunner shoot step image table offset
LRZ_ShootStepCtrl_Switch_Le   = $06                         ;       
LRZ_ShootStepCtrl_Switch_Ri   = $12                         ;       
LRZ_DemoMoveDataPtr         = $55                           ; ptr:  Demo move data table
LRZ_DemoMoveDataPtr_Lo        = $55                         ; 
LRZ_DemoMoveDataPtr_Hi        = $56                         ; 
LRZ_DemoMoveType            = $57                           ;       type of demo move (l/r/u/d/fire)
LRZ_DemoMoveDuration        = $58                           ;       duration demo move
LRZ_DemoNoFunction          = $59                           ; flag: used but has no function
LRZ_LevelModified           = $5a                           ; flag: level editor modification
LRZ_LevelModified_No          = $01                         ;       
LRZ_LevelModified_Yes         = $00                         ;       
; --------------------------------------------------------------------------------------------------------------------- ;
; image buffer containinh the generated image bytes
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_ImageBuffer_Long        = $005b                         ; buf:  generated image bytes - $5b-$7b (LRZ_005b - LRZ_005b_Len)
LRZ_ImageBuffer             = $5b                           ; 
LRZ_ImageBufferRowPos_01      = $5b                         ; 
LRZ_ImageBufferRowPos_02      = $5c                         ; 
LRZ_ImageBufferRowPos_03      = $5d                         ; 
LRZ_005b_Len = LR_ImageHeight * $03                         ;       image buffer length ($03 bytes for each $0b image rows)
; --------------------------------------------------------------------------------------------------------------------- ;
LRZ_TuneValueVoice_01       = $7c                           ;       tune value voice 1
LRZ_JingleDataPtr           = $7d                           ; ptr:  jingle Data
LRZ_JingleDataPtr_Lo          = $7d                         ; 
LRZ_JingleDataPtr_Hi          = $7e                         ; 
; --------------------------------------------------------------------------------------------------------------------- ;

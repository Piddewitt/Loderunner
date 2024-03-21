; ------------------------------------------------------------------------------------------------------------- ;
; Lode Runner - Game Variables and Fields
; ------------------------------------------------------------------------------------------------------------- ;
; memory layout
; ------------------------------------------------------------------------------------------------------------- ;
LR_MemScreenMC              = $0400 ; multi colors screen
LR_MemLevelGameData         = $0800 ; expanded level data - modified with    lr/en replacements/holes
LR_MemLevelCtrlData         = $0a00 ; expanded level data - original without lr/en replacements/holes
LR_MemSpriteStore           = $0c00 ; sprite data store
LR_MemScreenGfxRowPtr_Lo    = $0e00 ; ptr hires rows start addresses LO
LR_MemScreenGfxRowPtr_Hi    = $0f00 ; ptr hires rows start addresses HI
LR_MemLevelDataDiskBuf      = $1000 ; packed level data buffer/game save buffer
LR_MemScoreDataDiskBuf      = $1100 ; high scores save/load buffer
LR_MemWorkArea              = $1200 ; game dynamic work area values
LR_MemGameVars              = $1300 ; game variables
LR_MemStartGfxData          = $1400 ; start graphic compressed input data - separately loaded
LR_MemScreenGfxDisplay      = $2000 ; display hires screen
LR_MemScreenGfxPrepare      = $4000 ; prepare hires screen for direct output
LR_MemTunePlayTime          = $c000 ; tune times buffer
LR_MemTuneDataPtrVoice2     = $c100 ; tune data pointer voice 2 buffer
LR_MemTuneDataPtrVoice3     = $c200 ; tune data pointer voice 3 buffer
LR_MemTuneSuReVol           = $c300 ; tune sustain/release/volume buffer
LR_MemUnused_01             = $c400 ; not used
LR_MemUnused_02             = $c500 ; not used
LR_MemUnused_03             = $c600 ; not used
LR_MemUnused_04             = $c700 ; not used
LR_MemScoreBufWork          = $c800 ; temp store for leaderboard update
LR_MemScoreBufWorkNew       = $c900 ; temp store for leaderboard update result
; ------------------------------------------------------------------------------------------------------------- ;
; game control tables
; ------------------------------------------------------------------------------------------------------------- ;
LR_LevelGameData            = LR_MemLevelGameData           ; 
LR_LevelCtrlData            = LR_MemLevelCtrlData           ; 
; ------------------------------------------------------------------------------------------------------------- ;
LR_HiresRowStartPtrTab_Lo   = LR_MemScreenGfxRowPtr_Lo      ;
LR_HiresRowStartPtrTab_Hi   = LR_MemScreenGfxRowPtr_Hi      ;
; ------------------------------------------------------------------------------------------------------------- ;
; start track number of level data blocks
; ------------------------------------------------------------------------------------------------------------- ;
LR_LevelDataStartTrackNum   = $03                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; level disc layout - the level data is compressed into one disk block (1 data byte = 2 level bytes)
; ------------------+------------------+----------------+------------------------------------------------------ ;
; TT / SS - TT / SS ! Disk Numbers    ! Level Numbers   ! 
; ------------------+-----------------+-----------------+------------------------------------------------------ ;
; $03/$00 - $03/$0f | Level 000 - 015 | Level 001 - 016 | each track contains 16 level blocks ($00-$0f)
; $04/$00 - $04/$0f | Level 016 - 031 | Level 017 - 032 | ----------------------------------------------------- ;
; $05/$00 - $05/$0f | Level 032 - 047 | Level 033 - 048 | Track_number  = INT(LR_LevelNumDisk/16) + $03
; $06/$00 - $06/$0f | Level 048 - 063 | Level 049 - 064 | Sector_number = LR_LevelNumDisk MOD 15
; $07/$00 - $07/$0f | Level 064 - 079 | Level 065 - 080 | 
; $08/$00 - $08/$0f | Level 080 - 095 | Level 081 - 096 | 
; $09/$00 - $09/$0f | Level 096 - 111 | Level 097 - 112 | 
; $0a/$00 - $0a/$0f | Level 112 - 127 | Level 113 - 128 | 
; $0b/$00 - $0b/$0f | Level 128 - 143 | Level 129 - 144 | 
; $0c/$00 - $0c/$05 | Level 144 - 149 | Level 145 - 150 | 
; ------------------+-----------------+-----------------+------------------------------------------------------ ;
;           $0c/$06 | Empty Block forces restart at level 001
;           $0c/$07 | Level  151 - Scores and Disk ID block
; ------------------+------------------------------------------------------------------------------------------ ;
; Level Data Block Layout - $1000
; ------------------------------------------------------------------------------------------------------------- ;
LR_LevelDataBuf             = LR_MemLevelDataDiskBuf        ; 
LR_LevelDataBuf_Tiles         = LR_LevelDataBuf          ; packed level data - 2 level tiles in one byte 
LR_LevelDataBuf_Empty         = LR_LevelDataBuf + $e0    ; <not used>
; ------------------------------------------------------------------------------------------------------------- ;
; high score block counter values
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufEntry_Max          = $0a                                         ; max 10 entries
LR_ScoreBufEntry_Len          = LR_ScoreBufValue_Lo  - LR_ScoreBuf + $01    ; $08 ($00-$07)
LR_ScoreBufTable_Len          = LR_ScoreBufEntry_Len * LR_ScoreBufEntry_Max ; $50
; ------------------------------------------------------------------------------------------------------------- ;
; flags for ScoreDiskHandler checking
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufCheck_Bad          = $00                         ; loderunner disk ID not found
LR_ScoreBufCheck_Mod_No       = $01                         ; loderunner master disk - not modifiable
LR_ScoreBufCheck_Mod_Yes      = $ff                         ; loderunner user level data disk - modifiable
; ------------------------------------------------------------------------------------------------------------- ;
; High Score Table Block layout - $1100 - Level Number $97(151) - At Disk TT=$0c/SS=$07
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBuf                 = LR_MemScoreDataDiskBuf        ; high scores
LR_ScoreBuf_Len             = $fb                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; 10 leaderboard entries
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufID               = LR_ScoreBuf         + $00     ; 3 chr scorer id
LR_ScoreBufID_Len             = $03                         ; len championship loderunner name
LR_ScoreBufID_Char1           = LR_ScoreBufID     + $00     ; 
LR_ScoreBufID_Char2           = LR_ScoreBufID     + $01     ; 
LR_ScoreBufID_Char3           = LR_ScoreBufID     + $02     ; 
LR_ScoreBufLevel            = LR_ScoreBuf         + $03     ; level reached - sort crit 01
LR_ScoreBufValue            = LR_ScoreBuf         + $04     ; score reached - sort crit 02
LR_ScoreBufValue_Hi           = LR_ScoreBufValue  + $00     ; packed decimal - two digits in one byte
LR_ScoreBufValue_Mid_Hi       = LR_ScoreBufValue  + $01     ; 
LR_ScoreBufValue_Mid_Lo       = LR_ScoreBufValue  + $02     ; 
LR_ScoreBufValue_Lo           = LR_ScoreBufValue  + $03     ; 
; ------------------------------------------------------------------------------------------------------------- ;
; unused space
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufEmpty_01         = LR_ScoreBuf + $50             ; not used
LR_ScoreBufEmpty_01_Len       = $a0                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; loderunner disk ID
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufDiskId           = LR_ScoreBuf + $f0             ; DANE BIGHAM
LR_ScoreBufDiskId_Len         = $0a                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; loderunner disk flag
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufDiskFlag         = LR_ScoreBuf + $fb             ; LR user/master disk indicator
LR_ScoreBufDiskFlag_User      = $00                         ; loderunner user level data disk
LR_ScoreBufDiskFlag_Master    = $ff                         ; loderunner master disk
; ------------------------------------------------------------------------------------------------------------- ;
; rest to complete 255 block bytes
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufEmpty_02         = LR_ScoreBuf + $fc             ; not used
LR_ScoreBufEmpty_02_Len       = $04                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
; move high score data one position up to prepare insertion
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufEntryFrom        = LR_ScoreBuf
LR_ScoreBufEntryTo          = LR_ScoreBuf + LR_ScoreBufEntry_Len ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Color Positions on Start Screen
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScreenStartGfx           = LR_MemScreenMC                ; 
LR_ScreenStartGfx_BroderB1  = LR_ScreenMC + $0000           ; Broderbund Software
LR_ScreenStartGfx_BroderB2  = LR_ScreenMC + $0018           ; Broderbund Software
LR_ScreenStartGfx_LR        = LR_ScreenMC + $0168           ; LODE RUNNER
LR_ScreenStartGfx_Presents  = LR_ScreenMC + $0118           ; Presents
LR_ScreenStartGfx_By        = LR_ScreenMC + $0258           ; By
LR_ScreenStartGfx_Bigham    = LR_ScreenMC + $02d0           ; DOUG SMITH AND DANE BIGHAM
LR_ScreenStartGfx_CoRi      = LR_ScreenMC + $0348           ; (c) Copyright 1983
                            
LR_ScreenMC                 = LR_MemScreenMC                ; 
LR_ScreenMC_Page0           = LR_ScreenMC + $0000           ; 
LR_ScreenMC_Page1           = LR_ScreenMC + $0100           ; 
LR_ScreenMC_Page2           = LR_ScreenMC + $0200           ; 
LR_ScreenMC_Page3           = LR_ScreenMC + $02f8           ; 
LR_ScreenMC_Status          = LR_ScreenMC + $0370           ; 
LR_ScreenMC_Title           = LR_ScreenMC + $0398           ; title scores
LR_ScreenMC_Msg             = LR_ScreenMC + $03aa           ; message
                            
LR_ColorRam_Page0           = COLORAM_PAGE_0                ; 
LR_ColorRam_Page1           = COLORAM_PAGE_1                ; 
LR_ColorRam_Page2           = COLORAM_PAGE_2                ; 
LR_ColorRam_Page3           = COLORAM_PAGE_3                ; 
                            
LR_ColorRam_Status          = COLORAM_PAGE_3 + $b0          ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Misc Values
; ------------------------------------------------------------------------------------------------------------- ;
; Lode Runner Level Data Tile Numbers
; ------------------------------------------------------------------------------------------------------------- ;
LR_TileNum_Empty            = $00                           ; 
LR_TileNum_BrickSoft        = $01                           ; 
LR_TileNum_BrickHard        = $02                           ; 
LR_TileNum_Ladder           = $03                           ; 
LR_TileNum_Pole             = $04                           ; 
LR_TileNum_BrickTrap        = $05                           ; 
LR_TileNum_LadderExit       = $06                           ; 
LR_TileNum_Gold             = $07                           ; 
LR_TileNum_Enemy            = $08                           ; 
LR_TileNum_LodeRunner       = $09                           ; 
                            
LR_TileNum_Max              = LR_TileNum_LodeRunner + $01   ; valid tile number range is $00-$09
; ------------------------------------------------------------------------------------------------------------- ;
; leader board offsets
; ------------------------------------------------------------------------------------------------------------- ;
LR_BoardHeaderRows          = $04                           ; rows to be bypassed to get to the 1st board entry
LR_BoardEntryCol_Id         = $07                           ; col number of the board entry ID
LR_BoardEntryCol_Id_Len       = $02                         ; maximum length of each high score ID
LR_BoardEntryCol_Level      = $0e                           ; col number of the board entry level reached
LR_BoardEntryCol_Score      = $13                           ; col number of the board entry scores achieved
                            
LR_ScreenCols_Min           = $00                           ; screen position - max left
LR_ScreenCols_Max           = $1b                           ; screen position - max right
LR_ScreenRows_Min           = $00                           ; screen position - max up
LR_ScreenRows_Max           = $0f                           ; screen position - max down
                            
LR_EnemyMoveDir_None        = $00                           ; for save enemy status
LR_EnemyMoveDir_Le          = $01                           ; 
LR_EnemyMoveDir_Ri          = $02                           ; 
LR_EnemyMoveDir_Up          = $03                           ; 
LR_EnemyMoveDir_Do          = $04                           ; 
                            
LR_ImageHeight              = $0b                           ; image dimensions
LR_ImageWidth               = $0a                           ; 
                            
LR_PosOnImage_Min           = $00                           ; 
LR_PosOnImage_Center        = $02                           ; position on image
LR_PosOnImage_Max           = $04                           ; 
; ------------------------------------------------------------------------------------------------------------- ;
; score values
; ------------------------------------------------------------------------------------------------------------- ;
LR_Score_EnemyDigIn         = $0075                         ; 2 byte bcd - score for gigging in enemies
LR_Score_EnemyRebirth       = $0075                         ; 2 byte bcd - score for enemy rebirth
LR_Score_Gold               = $0250                         ; 2 byte bcd - score for picking up gold
LR_Score_FinishLevel        =  1500                         ; decimal    - needed for score step calc in LRZ_ScoreTuneSub_Ini

LR_DiskRead                 = $01                           ; read  flag
LR_DiskWrite                = $02                           ; write flag
LR_DiskInit                 = $04                           ; init  flag
                            
LR_SpinSignSpeed_Fast       = $01                           ; fast speed flip sign
LR_SpinSignSpeed_Slow       = $64                           ; slow speed flip sign
; ------------------------------------------------------------------------------------------------------------- ;
; checksum control values
; ------------------------------------------------------------------------------------------------------------- ;
LR_ChecksumCalc_Start       = $db                           ; checksum seed
LR_ChecksumCalc_Flip        = %00000001                     ; checksum flip bit
LR_ChecksumCalc_Result      = $c8                           ; checksum result
; ------------------------------------------------------------------------------------------------------------- ;
; Sprite Pointers
; ------------------------------------------------------------------------------------------------------------- ;
LR_SpritePtr                = LR_MemScreenMC + SPNTR_OFFSET    ; sprite data pointers
LR_SpritePtr_00             = LR_SpritePtr + $00               ; sprite 0 data at $0c00
LR_SpritePtr_02             = LR_SpritePtr + $02               ; sprite 2 data at $0c40
LR_SpritePtr_03             = LR_SpritePtr + $03               ; sprite 3 data at $0c80
LR_SpritePtr_04             = LR_SpritePtr + $04               ; sprite 4 data at $0cc0
LR_SpritePtr_06             = LR_SpritePtr + $06               ; sprite 6 data at $0d00
LR_SpritePtr_07             = LR_SpritePtr + $07               ; sprite 7 data at $0d40
                            
LR_SpriteData               = LR_MemSpriteStore                ; sprite data storage
LR_SpriteData_00            = LR_SpriteData + SPRT_BLK_LEN * $00 ; sprite data store 0
LR_SpriteData_01            = LR_SpriteData + SPRT_BLK_LEN * $01 ; sprite data store 1
LR_SpriteData_02            = LR_SpriteData + SPRT_BLK_LEN * $02 ; sprite data store 2
LR_SpriteData_03            = LR_SpriteData + SPRT_BLK_LEN * $03 ; sprite data store 3
LR_SpriteData_04            = LR_SpriteData + SPRT_BLK_LEN * $04 ; sprite data store 4
LR_SpriteData_05            = LR_SpriteData + SPRT_BLK_LEN * $05 ; sprite data store 5
LR_SpriteData_06            = LR_SpriteData + SPRT_BLK_LEN * $06 ; sprite data store 6 - not used
LR_SpriteData_07            = LR_SpriteData + SPRT_BLK_LEN * $07 ; sprite data store 7 - not used
                            
LR_SpriteDataPage_01        = LR_MemSpriteStore + SPRT_BLK_LEN * $00 ; 
LR_SpriteDataPage_02        = LR_MemSpriteStore + SPRT_BLK_LEN * $04 ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Work Area Exit Ladders - start at $1200
; ------------------------------------------------------------------------------------------------------------- ;
LR_WA_ExitLadder            = LR_MemWorkArea                ; $1200 - hidden ladders col
LR_WA_ExitLadderBlock_Len     = $30                         ;         max number of hidden ladders
LR_WA_ExitLadder_Free         = $ff                         ;         free hidden ladder table pos
LR_WA_ExitLadderMark        = LR_MemWorkArea                ; $1200 - position one acts as a marker
LR_WA_ExitLadderMark_Free     = $00                         ;         marker is free
LR_WA_ExitLadderMark_Gold     = $01                         ;         marker hidden ladder replaced gold
LR_WA_ExitLadderCol         = LR_WA_ExitLadder + LR_WA_ExitLadderBlock_Len * $00 ; $1200 - hidden ladders col
LR_WA_ExitLadderRow         = LR_WA_ExitLadder + LR_WA_ExitLadderBlock_Len * $01 ; $1230 - hidden ladders row
; ------------------------------------------------------------------------------------------------------------- ;
; Save Area Enemies - start at $1260
; ------------------------------------------------------------------------------------------------------------- ;
LR_SA_Enemy                 = LR_WA_ExitLadderRow + LR_WA_ExitLadderBlock_Len ; $1260 - col num of actual enemy position
LR_SA_EnemyBlock_Len          = $08                                    ;         max number of enemies
LR_SA_EnemyCol              = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $00 ; $1260 - col num of actual enemy position
LR_SA_EnemyRow              = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $01 ; $1268 - row num of actual enemy position
LR_SA_EnemyHoleGoldTime     = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $02 ; $1270 - enemy either has gold or is locked in a hole
LR_SA_EnemyHoleGoldTime_Ini   = $7f                                    ;         initial value
LR_SA_EnemyPosOnImgPosX     = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $03 ; $1278 - actual enemy position on image left/right
LR_SA_EnemyPosOnImgPosY     = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $04 ; $1280 - actual enemy position on image up/down
LR_SA_EnemySprtNum          = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $05 ; $1288 - sprite number
LR_SA_EnemyViewDir          = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $06 ; $1290 - sprite move direction
LR_WA_EnemyBirthTime        = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $07 ; $1298 - actual enemy rebirth step time
LR_WA_EnemyBirth_Len          = $05                                    ;         0 - 5 = max 6 entries
LR_WA_EnemyBirthStep_Ini      = $14                                    ;         initial value
LR_WA_EnemyBirthStep_01       = $13                                    ;         1st mark to rebirth the enemy a bit
LR_WA_EnemyBirthStep_02       = $0a                                    ;         2nd mark to rebirth the enemy a bit
; ------------------------------------------------------------------------------------------------------------- ;
; Work Area Open Holes - start at $12e0
; ------------------------------------------------------------------------------------------------------------- ;
LR_WA_Hole                  = LR_SA_Enemy + LR_SA_EnemyBlock_Len * $08 ; $12e0 - col open holes
LR_WA_HoleBlock_Len           = $20                                    ;         max number of open holes
LR_WA_HoleMax                 = $1e                                    ;         max number of digged holes
LR_WA_HoleCol               = LR_WA_Hole + LR_WA_HoleBlock_Len * $00   ; $12e0 - col open holes
LR_WA_HoleRow               = LR_WA_Hole + LR_WA_HoleBlock_Len * $01   ; $12a0 - row open holes
LR_WA_HoleOpenTime          = LR_WA_Hole + LR_WA_HoleBlock_Len * $02   ; $12c0 - actual hole open time
LR_WA_HoleOpenTime_Ini        = $b4                                    ;         initial value
LR_WA_HoleOpenTimeStep_01     = $14                                    ;         1st mark to close the hole a bit
LR_WA_HoleOpenTimeStep_02     = $0a                                    ;         2nd mark to close the hole a bit
; ------------------------------------------------------------------------------------------------------------- ;
; In Game Vaiables - start at $1300
; ------------------------------------------------------------------------------------------------------------- ;
LR_GameVars                 = LR_MemGameVars                ; $1300
LR_LevelLoad                = LR_GameVars + $00             ; $1300 - level disk load control
LR_LevelLoad_No               = $00                         ;         level already loaded from disk - reinit only
LR_LevelLoad_Yes              = $01                         ;         force level reload from disk and init
LR_ExitLadderCount          = LR_GameVars + $01             ; $1301 - 
LR_ExitLadderCount_None       = $00                         ; 
LR_ExitLadderCount_Max        = LR_WA_ExitLadderBlock_Len   ; 
LR_TuneBeepFall             = LR_GameVars + $02             ; $1302 - 
LR_TuneBeepFall_Start         = $53                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
LR_Unused_1303              = LR_GameVars + $03             ; $1303 - <not used>
; ------------------------------------------------------------------------------------------------------------- ;
LR_CirclePhase              = LR_GameVars + $04             ; $1304 - show level start circle
LR_CirclePhase_Open           = $00                         ; 
LR_CirclePhase_Both           = $ff                         ; 
LR_LevelNumGame             = LR_GameVars + $05             ; $1305 - 001-250
LR_LevelNumGame_Min           = $01                         ;         do not use $00 - see LR_LevelDiskMin
LR_LevelNumGame_Max           = $96                         ;         do not use a value greater 250 ($fa) - see LR_LevelNumDiskMax
LR_LevelNumDemo_Max           = $04                         ;         maximum no of demo levels
LR_GameMode                 = LR_GameVars + $06             ; $1306 - $00=start $01=demo $02=game $03=play_level $05=edit
LR_GameMode_Start             = $00                         ;         show start grafic
LR_GameMode_Demo              = $01                         ;         show the 3 demo level play
LR_GameMode_Play              = $02                         ;         play a level / show the score screen
LR_GameMode_PlayFromEdit      = $03                         ;         play a level from a board editor session
LR_GameMode_Edit              = $05                         ;         board editor
LR_Digit                    = LR_GameVars + $07             ; $1307 - 
LR_Digit_100                  = LR_Digit  + $00             ; $1307 - 
LR_Digit_10                   = LR_Digit  + $01             ; $1308 - 
LR_Digit_1                    = LR_Digit  + $02             ; $1309 - 
LR_Score                    = LR_GameVars + $0a             ; $130a - 
LR_Score_Lo                   = LR_Score  + $00             ; $130a - 
LR_Score_MidLo                = LR_Score  + $01             ; $130b - 
LR_Score_MidHi                = LR_Score  + $02             ; $130c - 
LR_Score_Hi                   = LR_Score  + $03             ; $130d - 
; ------------------------------------------------------------------------------------------------------------- ;
LR_GoldToCollect            = LR_GameVars + $0e             ; $130e - 
LR_GoldToCollect_None         = $00                         ; 
LR_ControllerType           = LR_GameVars + $0f             ; $130f - 
LR_ControllerType_Joystick    = $ca                         ; 
LR_ControllerType_Keyboard    = $cb                         ; 
LR_LevelNumDisk             = LR_GameVars + $10             ; $1310 - 
LR_LevelNumDisk_Min           = LR_LevelNumGame_Min - $01   ;         000
LR_LevelNumDisk_Max           = LR_LevelNumGame_Max - $01   ;         149
LR_LevelNumDisk_Gap           = LR_LevelNumGame_Max         ;         150 - empty game restart block (a level without a lodrunner tile)
LR_LevelNumDisk_Score         = LR_LevelNumGame_Max + $01   ;         151 - highscores disk level - disk level 150 must be blank for restart
LR_LevelNumDisk_Demo_Max      = $03                         ;         003 - build in demeo levels
LR_GameSpeedCtrl            = LR_GameVars + $11             ; $1311 - game speed control value
LR_GameSpeedCtrl_Max          = $0a                         ; 
LR_NumLives                 = LR_GameVars + $12             ; $1312 - 
LR_NumLivesInit               = $05                         ; 
LR_NumLivesDemo               = $01                         ; 
LR_Volume                   = LR_GameVars + $13             ; $1313 - 
LR_Volume_Off                 = $00                         ; 
LR_Volume_Max                 = $ff                         ; 
LR_LodeRuState             = LR_GameVars + $14              ; $1314 - 
LR_LodeRuState_Death          = $00                         ; 
LR_LodeRuState_Alive          = $01                         ; 
LR_LodeRuFallsDown          = LR_GameVars + $15             ; $1315 - $00=fall $20=no fall $ff=init
LR_LodeRuFallsDown_Yes        = $00                         ; 
LR_LodeRuFallsDown_No         = $20                         ; 
LR_LodeRuShoot              = LR_GameVars + $16             ; $1316 - $00=no $01=right $ff=left
LR_LodeRuShoot_No             = $00                         ; 
LR_LodeRuShoot_Ri             = $01                         ; 
LR_LodeRuShoot_Le             = $ff                         ; 
LR_TuneShoot                = LR_GameVars + $17             ; $1317 - 
LR_TuneShoot_Start            = $00                         ; 
LR_TuneShoot_Step             = $20                         ; 
LR_Cheated                  = LR_GameVars + $18             ; $1318 - $01=no
LR_Cheated_Yes                = $00                         ; 
LR_Cheated_No                 = $01                         ; 
LR_JoystickMoveDirY         = LR_GameVars + $19             ; $1319 - Joystick direction up/down
LR_JoystickMoveDirY_Up        = $21                         ; 
LR_JoystickMoveDirY_Do        = $25                         ; 
LR_JoystickMoveDirX         = LR_GameVars + $1a             ; $131a - Joystick direction left/right
LR_JoystickMoveDirX_Le        = $22                         ; 
LR_JoystickMoveDirX_Ri        = $2a                         ; 
LR_JoystickMove_None          = $00                         ; 
LR_JoystickShoot_Le           = $1e                         ; 
LR_JoystickShoot_Ri           = $26                         ; 
LR_GameSpeed                = LR_GameVars + $1b             ; $131b - 
LR_GameSpeed_Min              = $03                         ; 
LR_GameSpeed_Normal           = $05                         ; 
LR_GameSpeed_Max              = $08                         ; 
LR_EnemyCount               = LR_GameVars + $1c             ; $131c - 
LR_EnemyCount_None            = $00                         ; 
LR_EnemyCount_Min             = $01                         ; 
LR_EnemyCount_Max             = $05                         ; 
LR_LodeRuGetGold            = LR_GameVars + $1d             ; $131d - get gold  0=just gets it
LR_LodeRuGetGold_Picking      = $00                         ; 
LR_LodeRuGetGold_Picked       = $01                         ; 
LR_EnemyBirthCol            = LR_GameVars + $1e             ; $131e - 
LR_EnemyBirthCol_Min          = $00                         ; 
LR_EnemyBirthCol_Max          = $1c                         ; 
LR_EnemyToMoveNum           = LR_GameVars + $1f             ; $131f - 
LR_EnemyToMoveNum_None        = $00                         ; 
LR_EnemyToMoveNum_Min         = $01                         ; 
LR_EnemyInHoleTime          = LR_GameVars + $20             ; $1320 - init values dynamically taken from in game:TabEnmyHoleTime
LR_StartCycle               = LR_GameVars + $21             ; $1321 - switch the level start circle on or off
LR_StartCycle_On              = $ff                         ;         
LR_StartCycle_Off             = $00                         ;         
LR_WaitTime_Lo              = LR_GameVars + $22             ; $1322 - 
LR_WaitTime_Hi              = LR_GameVars + $23             ; $1323 - 
LR_DisplayChr               = LR_GameVars + $24             ; $1324 - 
LR_HiresRowColNumAdd_Lo     = LR_GameVars + $25             ; $1325 - 
LR_HiresRowColNumAdd_Hi     = LR_GameVars + $26             ; $1326 - 
LR_HiresBlockCount          = LR_GameVars + $27             ; $1327 - 
LR_KeyNew                   = LR_GameVars + $28             ; $1328 - 
LR_KeyNew_None                = $00                         ; 
LR_KeyOld                   = LR_GameVars + $29             ; $1329 - 
LR_TuneDeath                = LR_GameVars + $2a             ; $132a - 
LR_TuneDeath_None             = $00                         
LR_TuneDeath_Step             = $04                         ; 
LR_TuneDeath_Ini              = $38                         ; 
; ------------------------------------------------------------------------------------------------------------- ;
LR_Unused_132b              = LR_GameVars + $2b             ; $132b - <not used>
; ------------------------------------------------------------------------------------------------------------- ;
LR_SpriteShow               = LR_GameVars + $2c             ; $132c - control sprite display
LR_SpriteShow_On              = $00                         ; 
LR_SpriteShow_Off             = $05                         ;         in edit mode
LR_CountIRQs                = LR_GameVars + $2d             ; $132d - 
LR_CountIRQs_Init             = $03                         ; 
LR_TuneToPlayOff            = LR_GameVars + $2e             ; $132e - offset tune to play
LR_TuneFreeBufferPosOff     = LR_GameVars + $2f             ; $132f - in Bufs
; ------------------------------------------------------------------------------------------------------------- ;
LR_Unused_1330              = LR_GameVars + $30             ; $1330 - <not used>
; ------------------------------------------------------------------------------------------------------------- ;
LR_GoldJingleBeamLimit      = LR_GameVars + $31             ; $1331 - 
LR_JingleNum                = LR_GameVars + $32             ; $1332 - 
LR_JingleHeight             = LR_GameVars + $33             ; $1333 - 
LR_ScoreShown               = LR_GameVars + $34             ; $1334 - avoid score redisplay in score
LR_GoldJingleRndSeed        = LR_GameVars + $35             ; $1335 - 
LR_GoldJingleBeamPos        = LR_GameVars + $36             ; $1336 - 
LR_WaveVoice2               = LR_GameVars + $37             ; $1337 - 
LR_WaveVoice3               = LR_GameVars + $38             ; $1338 - 
LR_LodeRuShootMode          = LR_GameVars + $39             ; $1339 - 
LR_LodeRuShootMode_Back       = $00                         ;         shoot behind loadrunner
LR_LodeRuShootMode_Front      = $ff                         ;         shoot in front of loderunner
; ------------------------------------------------------------------------------------------------------------- ;
LR_Unused_133a              = LR_GameVars + $3a             ; $133a - <not used>
; ------------------------------------------------------------------------------------------------------------- ;
LR_LevelReload              = LR_GameVars + $3b             ; $133b - level will be reloaded if <> LR_LevelNumDisk
LR_LevelReload_Force          = $ff                         ;         force level reload
; ------------------------------------------------------------------------------------------------------------- ;
; $133c - $13ff unused
; ------------------------------------------------------------------------------------------------------------- ;
; Start Grafic - $1400
; ------------------------------------------------------------------------------------------------------------- ;
LR_StartGfxData             = LR_MemStartGfxData            ; start gfx compressed input data
LR_StartGfxDataPtrOff_Lo      = $01                         ; offset to data pointer LO
LR_StartGfxDataPtrOff_Hi      = $02                         ; offset to data pointer HI

LR_StartGfxDataPtr_Len        = $02                         ; length of pointer pair
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Display Screen - $2000-$3fff
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScreenGfxDisplay         = LR_MemScreenGfxDisplay        ; 
LR_ScreenGfxDisplayEnd      = LR_ScreenGfxDisplay   + $1fff ; end of gfx screen display
; ------------------------------------------------------------------------------------------------------------- ;
; Status Separator Row in Hires Display Screen
; ------------------------------------------------------------------------------------------------------------- ;
LR_StatusRowNumber          = LR_ScreenRows_Max + $01       ; directly beyond max screen row
; ------------------------------------------------------------------------------------------------------------- ;
LR_StatusRowSepDisp         = LR_ScreenGfxDisplay   + $1b90 ; 
LR_StatusRowSepDisp_Le_00     = LR_StatusRowSepDisp + $0000 ; left start
LR_StatusRowSepDisp_Le_01     = LR_StatusRowSepDisp + $0001 ; 
LR_StatusRowSepDisp_Le_02     = LR_StatusRowSepDisp + $0002 ; 
LR_StatusRowSepDisp_Le_03     = LR_StatusRowSepDisp + $0003 ; 
                              
LR_StatusRowSepDisp_Mi_00     = LR_StatusRowSepDisp + $0008 ; middle part
                              
LR_StatusRowSepDisp_Ri_00     = LR_StatusRowSepDisp + $0118 ; right end
LR_StatusRowSepDisp_Ri_01     = LR_StatusRowSepDisp + $0119 ; 
LR_StatusRowSepDisp_Ri_02     = LR_StatusRowSepDisp + $011a ; 
LR_StatusRowSepDisp_Ri_03     = LR_StatusRowSepDisp + $011b ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Hires Prepare Screen - $4000-$5fff
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScreenGfxPrepare         = LR_MemScreenGfxPrepare        ; 
LR_ScreenGfxPrepareEnd      = LR_ScreenGfxPrepare   + $1fff ; end of gfx prepare area
; ------------------------------------------------------------------------------------------------------------- ;
; Status Separator Row in Hires Preparation Screen
; ------------------------------------------------------------------------------------------------------------- ;
LR_StatusRowSepPrep         = LR_ScreenGfxPrepare   + $1b90 ; left start
LR_StatusRowSepPrep_Le_00     = LR_StatusRowSepPrep + $0000 ; 
LR_StatusRowSepPrep_Le_01     = LR_StatusRowSepPrep + $0001 ; 
LR_StatusRowSepPrep_Le_02     = LR_StatusRowSepPrep + $0002 ; 
LR_StatusRowSepPrep_Le_03     = LR_StatusRowSepPrep + $0003 ; 
                              
LR_StatusRowSepPrep_Mi_00     = LR_StatusRowSepPrep + $0008 ; middle part
                              
LR_StatusRowSepPrep_Ri_00     = LR_StatusRowSepPrep + $0118 ; right end
LR_StatusRowSepPrep_Ri_01     = LR_StatusRowSepPrep + $0119 ; 
LR_StatusRowSepPrep_Ri_02     = LR_StatusRowSepPrep + $011a ; 
LR_StatusRowSepPrep_Ri_03     = LR_StatusRowSepPrep + $011b ; 
; ------------------------------------------------------------------------------------------------------------- ;
; Jingle Data Areas - $c000/$c100/$c200/$c300
; ------------------------------------------------------------------------------------------------------------- ;
LR_TunePlayTime             = LR_MemTunePlayTime            ; tune times
LR_TuneDataPtrVoice2        = LR_MemTuneDataPtrVoice2       ; tune data pointer voice 2
LR_TuneDataPtrVoice3        = LR_MemTuneDataPtrVoice3       ; tune data pointer voice 3
LR_TuneSuReVol              = LR_MemTuneSuReVol             ; tune s/r/volume
; ------------------------------------------------------------------------------------------------------------- ;
; score working buffer - $c800/$c900
; ------------------------------------------------------------------------------------------------------------- ;
LR_ScoreBufWork             = LR_MemScoreBufWork            ; 
LR_ScoreBufWorkNew          = LR_MemScoreBufWorkNew         ; 
; ------------------------------------------------------------------------------------------------------------- ;

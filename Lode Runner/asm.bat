@rem -----------------------------------------------------
@rem pick up filenames containing blanks
@rem -----------------------------------------------------
@set FNAM=%~1
@shift
:Get_Parms
@if "%1" == "" goto Start
@set FNAM=%FNAM% %1
@shift
@goto Get_Parms
@rem -----------------------------------------------------
:Start
@echo.
@echo ----------------------------------------------------
@echo.
@..\..\..\..\..\tools\64tass\64tass.exe -C -a -i -Wno-portable "asm\%FNAM%.asm" -o "prg\%FNAM%.prg" -L "lst\%FNAM%.lst" --tab-size=2 --line-numbers --export-labels -l "lst\%FNAM%.sym" -E "lst\%FNAM%.err" -I "inc" -I "..\inc"
@echo.
@echo ----------------------------------------------------
@echo Assembly ...
@echo ----------------------------------------------------
@if %ERRORLEVEL% NEQ 0 goto Fail

@echo.
@echo Source     : .\asm\%FNAM%.asm
@echo Executable : .\prg\%FNAM%.prg
@echo Listing    : .\lst\%FNAM%.txt

@echo.
@echo ----------------------------------------------------
@echo.

:Ok
@exit

:Fail
@echo.
@echo          ... failed with RC=%ERRORLEVEL%
@echo.
@echo ----------------------------------------------------
@echo.

@exit

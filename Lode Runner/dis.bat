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
@echo Disassem ...
@echo ----------------------------------------------------

@..\..\..\..\..\tools\DisAsm\65XXDIS\65XXDIS.exe "prg\%FNAM%.prg" >"dis\%FNAM%.dis"
@if %ERRORLEVEL% NEQ 0 goto Fail

@echo.
@echo Source     : .\dis\%FNAM%.dis

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

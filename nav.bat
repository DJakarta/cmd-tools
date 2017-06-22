@echo off
:: if no argument is given open the working directory
if [%1]==[] goto runInWD

:: if argument is present try to interpret it as command
set wlc=%cd%

:: write the output of the command to a temporary file and read it
call %* > %tmp%tmpCmd
set /p wlc=<%tmp%tmpCmd

:: check if it was empty meaning the argument was not a command outputing a path
type nul > %tmp%blank
fc %tmp%tmpCmd %tmp%blank > nul

:: if file is not empty run explorer at the result of the command
if errorlevel 1 goto navCmdRes

:: if file is empty run explorer with the arguments given because there was no command
echo Navigating to %* directory instead.
cd /D %*
goto:eof

:navCmdRes
	echo Navigating to %wlc%
	cd /D %wlc%
	goto:eof

:runInWd
	cd /D %cd%
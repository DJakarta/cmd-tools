@echo off
:: if no argument is given open the working directory
if [%1]==[] goto runInWD

:: if argument is present try to interpret it as command
set pln=%cd%
call %* > %tmp%tmpCmd
set /p pln=<%tmp%tmpCmd

type nul > %tmp%blank
fc %tmp%tmpCmd %tmp%blank > nul

:: if file is not empty run explorer at the result of the command
if errorlevel 1 goto openCmdRes

:: if file is empty run explorer with the arguments given because there was no command
echo Opening %* directory instead.
explorer.exe %*
goto:eof

:openCmdRes
	echo Opening %pln%
	explorer.exe %pln%
	goto:eof

:runInWd
	explorer.exe %cd%
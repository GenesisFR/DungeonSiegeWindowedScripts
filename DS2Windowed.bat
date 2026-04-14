@echo off

rem https://www.codeproject.com/Tips/119828/Running-a-bat-file-as-administrator-Correcting-cur
rem Correct the current directory when a script is run as admin
cd /d "%~dp0"

set "_SCRIPT_DIR=%~dp0"

rem No argument, use DungeonSiege2.exe by default
if "%~1"=="" (
	set "_EXE_NAME=DungeonSiege2.exe"
	set "_EXE_PATH=%_SCRIPT_DIR%DungeonSiege2.exe"
) else (
	set "_EXE_NAME=%~nx1"
	set "_EXE_PATH=%~1"
)

start "" "%_EXE_PATH%" fullscreen=false nointro=true noloadintro=true dpnsvr=false multi=true
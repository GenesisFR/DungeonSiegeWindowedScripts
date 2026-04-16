@echo off

rem Launch parameters (if empty, it'll use the value specified in the config file or a default value)
rem bpp = 16/32
set "_BPP=32"
rem fullscreen = true/false
set "_FULLSCREEN=false"
rem height = integer
set "_HEIGHT="
rem maxfps = integer
set "_MAX_FPS=0"
rem multi = true/false
set "_MULTI_INSTANCE=true"
rem nointro = true/false
set "_NO_INTRO=true"
rem noloadintro = true/false
set "_NO_LOAD_INTRO=true"
rem dpnsvr = true/false
set "_USE_DIRECTPLAY="
rem vsync = true/false
set "_VSYNC="
rem width = integer
set "_WIDTH="

rem https://www.codeproject.com/Tips/119828/Running-a-bat-file-as-administrator-Correcting-cur
rem Correct the current directory when a script is run as admin
cd /d "%~dp0"

rem No argument, use DungeonSiege2.exe by default
if "%~1"=="" (
	set "_EXE_PATH=%CD%\DungeonSiege2.exe"
) else (
	set "_EXE_PATH=%~1"
)

rem Build launch parameters
set "_LAUNCH_PARAMS=bltonly=true zonematch=true"
if defined _BPP set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% bpp=%_BPP%"
if defined _FULLSCREEN set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% fullscreen=%_FULLSCREEN%"
if defined _HEIGHT set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% height=%_HEIGHT%"
if defined _MAX_FPS set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% maxfps=%_MAX_FPS%"
if defined _MULTI_INSTANCE set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% multi=%_MULTI_INSTANCE%"
if defined _NO_INTRO set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% nointro=%_NO_INTRO%"
if defined _NO_LOAD_INTRO set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% noloadintro=%_NO_LOAD_INTRO%"
if defined _USE_DIRECTPLAY set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% dpnsvr=%_USE_DIRECTPLAY%"
if defined _VSYNC set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% vsync=%_VSYNC%"
if defined _WIDTH set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% width=%_WIDTH%"

start "" "%_EXE_PATH%" %_LAUNCH_PARAMS%

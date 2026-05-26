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
set "_NO_INTRO="
rem dpnsvr = true/false
set "_USE_DIRECTPLAY="
rem vsync = true/false
set "_VSYNC="
rem width = integer
set "_WIDTH="

rem https://www.codeproject.com/Tips/119828/Running-a-bat-file-as-administrator-Correcting-cur
rem Correct the current directory when a script is run as admin
cd /d "%~dp0"

rem No argument, use DungeonSiege.exe by default
if "%~1"=="" (
	set "_EXE_NAME=DungeonSiege.exe"
	set "_EXE_PATH=%CD%\DungeonSiege.exe"
) else (
	set "_EXE_NAME=%~nx1"
	set "_EXE_PATH=%~1"
)

rem Disable the HD textures if running development executables, otherwise enable them
if "%_EXE_NAME%" == "DSLOA.exe" call :toggleHD 1
if "%_EXE_NAME%" == "DungeonSiege.exe" call :toggleHD 1
if "%_EXE_NAME%" == "DSLOAMod.exe" call :toggleHD 0
if "%_EXE_NAME%" == "DSMod.exe" call :toggleHD 0
if "%_EXE_NAME%" == "SiegeEditor.exe" (
	call :toggleHD 0
	rem Wait for one second because running SiegeEditor right away seems to fail
	ping -n 2 127.0.0.1 > nul
	start "" %1
	exit
)

rem Build launch parameters
set "_LAUNCH_PARAMS=bltonly=true zonematch=true"
if defined _BPP set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% bpp=%_BPP%"
if defined _FULLSCREEN set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% fullscreen=%_FULLSCREEN%"
if defined _HEIGHT set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% height=%_HEIGHT%"
if defined _MAX_FPS set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% maxfps=%_MAX_FPS%"
if defined _MULTI_INSTANCE set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% multi=%_MULTI_INSTANCE%"
if defined _NO_INTRO set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% nointro=%_NO_INTRO%"
if defined _USE_DIRECTPLAY set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% dpnsvr=%_USE_DIRECTPLAY%"
if defined _VSYNC set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% vsync=%_VSYNC%"
if defined _WIDTH set "_LAUNCH_PARAMS=%_LAUNCH_PARAMS% width=%_WIDTH%"

start "" "%_EXE_PATH%" %_LAUNCH_PARAMS%
exit

:toggleHD
if %1 == 1 (
	(
		ren "%CD%\DSLOA\DSLOA_HRT_00.dsres.off" DSLOA_HRT_00.dsres
		ren "%CD%\Resources\DS_HRT_a_update.dsres.off" DS_HRT_a_update.dsres
		ren "%CD%\Resources\DS_HRT_c.dsres.off" DS_HRT_c.dsres
		ren "%CD%\Resources\DS_HRT_o.dsres.off" DS_HRT_o.dsres
		ren "%CD%\Resources\DS_HRT_t1.dsres.off" DS_HRT_t1.dsres
		ren "%CD%\Resources\DS_HRT_t2.dsres.off" DS_HRT_t2.dsres
		ren "%CD%\Resources\DS_HRT_t3.dsres.off" DS_HRT_t3.dsres
		ren "%CD%\Resources\DSLOA_HRT_00.dsres.off" DSLOA_HRT_00.dsres
	) > nul 2>&1
) else (
	(
		ren "%CD%\DSLOA\DSLOA_HRT_00.dsres" DSLOA_HRT_00.dsres.off
		ren "%CD%\Resources\DS_HRT_a_update.dsres" DS_HRT_a_update.dsres.off
		ren "%CD%\Resources\DS_HRT_c.dsres" DS_HRT_c.dsres.off
		ren "%CD%\Resources\DS_HRT_o.dsres" DS_HRT_o.dsres.off
		ren "%CD%\Resources\DS_HRT_t1.dsres" DS_HRT_t1.dsres.off
		ren "%CD%\Resources\DS_HRT_t2.dsres" DS_HRT_t2.dsres.off
		ren "%CD%\Resources\DS_HRT_t3.dsres" DS_HRT_t3.dsres.off
		ren "%CD%\Resources\DSLOA_HRT_00.dsres" DSLOA_HRT_00.dsres.off
	) > nul 2>&1
)

exit /B

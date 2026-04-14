@echo off

rem https://www.codeproject.com/Tips/119828/Running-a-bat-file-as-administrator-Correcting-cur
rem Correct the current directory when a script is run as admin
cd /d "%~dp0"

set "_SCRIPT_DIR=%~dp0"

rem No argument, use DungeonSiege.exe by default
if "%~1"=="" (
	set "_EXE_NAME=DungeonSiege.exe"
	set "_EXE_PATH=%_SCRIPT_DIR%DungeonSiege.exe"
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
	%1
	exit
)

start "" "%_EXE_PATH%" bltonly=true fullscreen=false nointro=true dpnsvr=false multi=true zonematch=true
exit

:toggleHD
if %1 == 1 (
	(
		ren "%_SCRIPT_DIR%Resources\DS_HRT_a_update.dsres.off" DS_HRT_a_update.dsres
		ren "%_SCRIPT_DIR%Resources\DS_HRT_c.dsres.off" DS_HRT_c.dsres
		ren "%_SCRIPT_DIR%Resources\DS_HRT_o.dsres.off" DS_HRT_o.dsres
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t1.dsres.off" DS_HRT_t1.dsres
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t2.dsres.off" DS_HRT_t2.dsres
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t3.dsres.off" DS_HRT_t3.dsres
	) > nul 2>&1
) else (
	(
		ren "%_SCRIPT_DIR%Resources\DS_HRT_a_update.dsres" DS_HRT_a_update.dsres.off
		ren "%_SCRIPT_DIR%Resources\DS_HRT_c.dsres" DS_HRT_c.dsres.off
		ren "%_SCRIPT_DIR%Resources\DS_HRT_o.dsres" DS_HRT_o.dsres.off
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t1.dsres" DS_HRT_t1.dsres.off
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t2.dsres" DS_HRT_t2.dsres.off
		ren "%_SCRIPT_DIR%Resources\DS_HRT_t3.dsres" DS_HRT_t3.dsres.off
	) > nul 2>&1
)

exit /B
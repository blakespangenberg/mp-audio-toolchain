@echo off
set SCRIPT_DIR=%cd%
call %SCRIPT_DIR%\tools\tools.bat

if exist %SCRIPT_DIR%\prime\pakdump rmdir %SCRIPT_DIR%\prime\pakdump /s /q

%SCRIPT_DIR%\tools\gcit\gcit.exe %SCRIPT_DIR%\prime.iso -f GCReEx -q -d %SCRIPT_DIR%\prime\pakdump\

for /d %%i in (%SCRIPT_DIR%\prime\pakdump\*) do (
ren "%%i" dump
)

echo %SCRIPT_DIR%\tools\paktool\PakTool.exe -x %SCRIPT_DIR%\prime\pakdump\dump\root\AudioGrp.pak -o %SCRIPT_DIR%\prime\pakdump\AudioGrp\

%SCRIPT_DIR%\tools\urde\hecl.exe extract -y prime.iso AudioGrp.pak

pause

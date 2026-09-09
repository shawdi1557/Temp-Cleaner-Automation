@echo off
echo Cleaning temp files...

:: Clean user temp folder (%temp%)
del /q /f /s "%temp%\*.*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1

:: Clean Windows temp folder (requires admin)
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" >nul 2>&1

echo Done cleaning temp files.
pause
@echo off
:licence info
echo m4a to mp3 script by medic17
echo licenced under GNU GENERAL PUBLIC LICENSE
echo. 
echo copy of licence is attached
echo special thanks to the FFMPEG project located at https://ffmpeg.org
echo.

:varibles
set ffmpeg=%cd%\ffmpeg\bin\ffmpeg.exe

:convert
cd files
for %%a in ("*.*") do (
    %ffmpeg% -loglevel error -i  "%%a" -codec:a libmp3lame "newfiles\%%~na.mp3"
    echo %%a converted
)
set /p a="Do you want your files moved to script directory? y/n "
if /I "%a%" EQU "Y" goto move_files
if /I "%a%" EQU "N" goto finished

:move_files
move %cd%\newfiles\*.mp3 %~dp0
goto exit

:finished
echo Done! files are in files\newfiles
pause
exit

:exit
echo Files are in your folder
pause

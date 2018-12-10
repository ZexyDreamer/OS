@echo off
set /P directory="" 
if "%directory%"=="/?" (
echo The program decodes files
pause
exit
) else ( 
if exist %directory% (
cd %directory%
if exist temp.txt (
echo Temp is already created 
pause
exit
)
) else (
echo Directory does not exist
pause
exit
)
FOR /R %DIR% %%f IN (*.txt) DO ( 
chcp 866>nul 
cmd /u /c type %%f > temp.txt 
type temp.txt > %%f 
chcp 65001>nul
)
del temp.txt
)
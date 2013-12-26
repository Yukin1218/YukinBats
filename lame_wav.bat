::lame_wav.bat
::convert .wav files to 320kbps 0q .mp3 files with lame
@echo off

::default
set _pwav=c:\users\freewind\Music\wave
set _pmp3=c:\users\freewind\Music\lame_mp3
set _case=normal
set _del=delete

:arg
if [%1]==[-?] (
echo Hello! 
echo lame_wav.bat convert .wav files to 320kbps 0q .mp3 files with lame.exe
echo.
echo CAUTION: ALL WAV FILES WILL BE DELETED WITHOUT ARGUMENT -n!
echo Default wav source filefold: c:\users\hp\Music\wave
echo Default mp3 destination filefold: c:\users\hp\Music\lame_mp3 
echo.
echo lame_wav [-?] [-d path] [-s path] [-w] [-m]
echo.
echo 	-? Display this message
echo 	-s Set the path of wav source filefold
echo 	-d Set the path of mp3 destination filefold
echo 	-w Display wav source filefold
echo 	-m Display mp3 destination filefold
echo 	-n do not delete source wav files
echo.
set _case=jump
goto bye
)
if [%1]==[-d] call :d %2
if [%1]==[-s] call :s %2
if [%1]==[-w] (
dir %_pwav%
set _case=jump
goto bye
)
if [%1]==[-m] (
dir %_pmp3%
set _case=jump
goto bye
)
if [%1]==[-n] set _del=not
shift /1
if [%1]hi==[]hi goto start
goto arg


:d
if [%1]hi==[]hi (
echo Error: Empty_Path
set _case=jump
) else (
set _pmp3=%1
)
goto :eof


:s
if [%1]hi==[]hi (
echo Error: Empty_Path
set _case=jump
) else (
set _pwav=%1
)
goto :eof


:start
if [%_case%]==[jump] goto bye
echo.
echo Hello! Now start laming...
echo.
call pushd %_pwav%

set _empty=yes
for %%f in (*.wav) do call :one_lame "%%f"
goto end


:one_lame
set _empty=no
lame -b 320 -q 0 %1
if [%_del%]==[delete] del %1

::record
echo. >> lw_record.txt
echo %1 lamed >> lw_record.txt
echo %date% %time% >> lw_record.txt
echo FROM %_pwav% TO %_pmp3% >> lw_record.txt
echo. >> lw_record.txt

echo.
echo !%1 o.k.
echo.
goto :eof


:end
if "%_empty%"=="yes" echo No wave to lame...
for %%m in (*.mp3) do move "%%m" %_pmp3%
echo.
echo All done.
:bye
set _pwav=
set _pmp3=
set _empty=
set _case=
set _del=
echo Have a good day!
call popd

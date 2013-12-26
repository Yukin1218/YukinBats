::Euclid.bat
::calculate gcd of %1 %2 (recursively)
@echo off
set _return=noreturn
call :start %1 %2
goto end

:start
if %2==0 (
set _return=%1
goto :eof
)
set _3=%2
::Modulus operator - note that in a batch script, (as opposed to on the command-line), you need to double up the % to %% 
set /a _4=(%1)%%(%2)
call :start %_3% %_4%
set /a _return=%_return%
goto :eof

:end
echo 	gcd(%1,%2)=%_return%
set _3=
set _4=

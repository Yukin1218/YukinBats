::nospace.bat
::elimate space in filenames
@echo off
set _file=a
for %%f in (%1) do call :nospace "%%f"
set _file=

:nospace
set _file=%1
ren %_file% %_file: =_%
goto :eof

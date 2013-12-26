@echo off
mkdir tmp
for %%f in (*.jpg) do (
copy %%f tmp
del %%~nf.avi
pushd tmp
for /L %%i in (1,1,25) do (
convert %%f %%~nf.%%i.png
)
ffmpeg -i %%~nf.%%d.png -vcodec huffyuv ..\%%~nf.avi
del %%~nf.*.png
del %%f
popd
)
for %%f in (*.png) do (
copy %%f tmp
del %%~nf.avi
pushd tmp
for /L %%i in (1,1,25) do (
convert %%f %%~nf.%%i.png
)
ffmpeg -i %%~nf.%%d.png -vcodec huffyuv ..\%%~nf.avi
del %%~nf.*.png
del %%f
popd
)
rmdir tmp
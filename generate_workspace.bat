@echo off

echo Copying data folder to root directory...
robocopy UtopianEngine\data data\ /MIR /NFL /NDL /NJH /NJS /nc /ns /np > NUL

echo Copying DLLs to build directory...
xcopy "UtopianEngine\libs\assimp\assimp-vc140-mt.dll" "bin\Debug\"     /I /Q /y > NUL

echo Generating workspace...
UtopianEngine\tools\premake5.exe --file=premake.lua vs2019

exit /b
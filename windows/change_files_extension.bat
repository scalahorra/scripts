@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set /p original_extension=Introduce la extensión origen de los archivos: 
set /p final_extension=Introduce la extensión destino de los archivos: 

for /r %%F in (*.%original_extension%) do (
    set "filepath=%%~dpF"
    set "filename=%%~nF"
    set "extension=%%~xF"
    echo Renombrando: "%%~nxF" a "!filename!.%final_extension%"
    ren "%%F" "!filename!.%final_extension%"
)

endlocal

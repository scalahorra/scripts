::Ayuda a organizar archivos llamandolos como el nombre de la carpeta
::en la que se encuentran y contandolos

@echo off
setlocal enabledelayedexpansion

::Directorio desde el que se ejecuta el script
set "basePath=%cd%"

set "counter=1"

::Iteramos sobre las carpetas
for /d %%F in (*) do (
  ::Guardamos el nombre de la carpeta sin el resto de directorios
  set "newFolderName=%%~nF"
  ::Reemplazamos espacios por guiones bajos
  set "newFolderName=!newFolderName: =_!"

  ::Cambia al directorio de la carpeta actual utilizando pushd, que también guarda el directorio anterior en una pila.
  pushd "%%F"

  ::Renombramos la carpeta si se modificó
  if not "%%~nF"=="!newFolderName!" ren "%%F" "!newFolderName!"

  ::Iteramos sobre los archivos
  for %%A in (*) do (
    ::Generamos el nuevo nombre
    set "newName=!newFolderName!_!counter!%%~xA"

    ::Renombramos el archivo
    ren "%%A" "!newName!"

    ::Incrementamos el contador
    set /a "counter+=1"
  )

  ::Resetamos el contador al cambiar de carpeta
  set "counter=1"

  ::Regresamos al directorio base
  popd
)

::Restauramos el directorio original
cd "%basePath%"

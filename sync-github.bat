@echo off
echo ========================================
echo    SINCRONIZACION AUTOMATICA CON GITHUB
echo ========================================
echo.

echo [1/4] Descargando cambios desde GitHub...
git pull origin main
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron descargar los cambios
    pause
    exit /b 1
)
echo ✓ Cambios descargados exitosamente

echo.
echo [2/4] Agregando todos los archivos modificados...
git add .
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron agregar los archivos
    pause
    exit /b 1
)
echo ✓ Archivos agregados

echo.
echo [3/4] Creando commit con timestamp...
set timestamp=%date% %time%
git commit -m "Auto-sync: %timestamp%"
if %errorlevel% neq 0 (
    echo ⚠ No hay cambios para hacer commit
) else (
    echo ✓ Commit creado
)

echo.
echo [4/4] Subiendo cambios a GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron subir los cambios
    pause
    exit /b 1
)
echo ✓ Cambios subidos a GitHub

echo.
echo ========================================
echo     ✓ SINCRONIZACION COMPLETADA ✓
echo ========================================
echo.
echo Presiona cualquier tecla para continuar...
pause > nul
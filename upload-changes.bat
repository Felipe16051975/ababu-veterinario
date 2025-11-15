@echo off
echo ========================================
echo    SUBIR CAMBIOS RAPIDOS A GITHUB
echo ========================================
echo.

if "%~1"=="" (
    set /p mensaje="Describe los cambios que hiciste: "
) else (
    set mensaje=%~1
)

echo [1/3] Agregando archivos...
git add .
echo ✓ Archivos agregados

echo.
echo [2/3] Creando commit: "%mensaje%"
git commit -m "%mensaje%"
if %errorlevel% neq 0 (
    echo ⚠ No hay cambios para hacer commit
    pause
    exit /b 0
)
echo ✓ Commit creado

echo.
echo [3/3] Subiendo a GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron subir los cambios
    pause
    exit /b 1
)
echo ✓ Cambios subidos exitosamente

echo.
echo ========================================
echo        ✓ CAMBIOS SUBIDOS ✓
echo ========================================
pause
@echo off
echo ========================================
echo    DESCARGAR CAMBIOS DESDE GITHUB
echo ========================================
echo.

echo Descargando últimos cambios desde GitHub...
git pull origin main
if %errorlevel% neq 0 (
    echo ERROR: No se pudieron descargar los cambios
    pause
    exit /b 1
)

echo.
echo ========================================
echo    ✓ ARCHIVOS ACTUALIZADOS ✓
echo ========================================
echo.
echo Tus archivos locales ahora tienen los
echo últimos cambios de GitHub.
echo.
pause
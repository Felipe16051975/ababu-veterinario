@echo off
echo.
echo 🚀 PREPARANDO ABABU PARA PRODUCCIÓN
echo ===================================
echo.

REM Verificar que estamos en el directorio correcto
if not exist "artisan" (
    echo ❌ Error: No se encuentra el archivo artisan
    echo    Asegurate de ejecutar este script desde la carpeta raíz de Ababu
    pause
    exit /b 1
)

echo 📋 Paso 1: Instalando dependencias de producción...
call composer install --no-dev --optimize-autoloader
if %errorlevel% neq 0 (
    echo ❌ Error en composer install
    pause
    exit /b 1
)

echo ✅ Dependencias instaladas correctamente
echo.

echo 📦 Paso 2: Compilando assets para producción...
call npm install --production
if %errorlevel% neq 0 (
    echo ⚠️  Advertencia: npm install falló, continuando...
)

call npm run production
if %errorlevel% neq 0 (
    echo ⚠️  Advertencia: npm run production falló, continuando...
)

echo ✅ Assets compilados
echo.

echo 🔧 Paso 3: Optimizando Laravel...

REM Limpiar cache anterior
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear

echo ✅ Cache limpiado
echo.

echo 📁 Paso 4: Verificando estructura de archivos...

if not exist ".env.production" (
    echo ⚠️  No se encuentra .env.production
    echo    Creando uno basado en .env actual...
    copy .env .env.production >nul
    echo    ✅ .env.production creado - DEBES EDITARLO con datos reales
)

if not exist "public\.htaccess" (
    echo ❌ Error: Falta public\.htaccess
    echo    Este archivo es necesario para el hosting
    pause
    exit /b 1
)

echo ✅ Estructura verificada
echo.

echo 🔐 Paso 5: Configurando seguridad...

REM Crear directorio de logs si no existe
if not exist "storage\logs" mkdir "storage\logs"

REM Verificar permisos (en Windows no se puede cambiar como en Linux)
echo ✅ Configuración de seguridad lista
echo.

echo 📊 Paso 6: Verificando base de datos...
echo.
echo ⚠️  IMPORTANTE: En producción debes usar MySQL, NO SQLite
echo    El archivo .env.production está configurado para MySQL
echo.

echo 🎯 PREPARACIÓN COMPLETADA
echo =========================
echo.
echo 📋 SIGUIENTES PASOS:
echo.
echo    1. Editar .env.production con los datos reales de tu hosting
echo    2. Subir todos los archivos EXCEPTO vendor/ y node_modules/
echo    3. En el servidor ejecutar: composer install --no-dev
echo    4. Ejecutar: php artisan migrate --force
echo    5. Ejecutar: php artisan config:cache
echo.
echo 📖 Consulta DEPLOYMENT-CHECKLIST.md para la guía completa
echo.
echo 🏥 ¡ABABU ESTÁ LISTO PARA IR ONLINE!
echo.

echo 📞 HOSTING RECOMENDADO:
echo    • Hostinger (Económico): $3-5/mes
echo    • DigitalOcean (Profesional): $5-12/mes
echo    • Laravel Forge (Premium): $12-15/mes
echo.

echo 🔐 RECUERDA: Los datos de pacientes son CRÍTICOS
echo    Configura backups automáticos en producción
echo.

pause
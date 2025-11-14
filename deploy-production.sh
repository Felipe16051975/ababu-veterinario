#!/bin/bash

echo "🚀 SCRIPT DE PREPARACIÓN PARA PRODUCCIÓN - ABABU"
echo "================================================"
echo ""

echo "📋 Este script prepara Ababu para ser desplegado en producción"
echo ""

# 1. Configuración de entorno
echo "1️⃣ CONFIGURACIÓN DE ENTORNO"
echo "   - Crear archivo .env basado en .env.production"
echo "   - Configurar APP_ENV=production"
echo "   - Configurar APP_DEBUG=false"
echo "   - Generar APP_KEY segura"
echo ""

# 2. Base de datos
echo "2️⃣ CONFIGURACIÓN DE BASE DE DATOS"
echo "   - Cambiar de SQLite a MySQL"
echo "   - Configurar credenciales de base de datos"
echo "   - Ejecutar migraciones en producción"
echo ""

# 3. Optimizaciones
echo "3️⃣ OPTIMIZACIONES"
echo "   - Instalar dependencias de producción (composer install --no-dev)"
echo "   - Compilar assets (npm run production)"
echo "   - Optimizar configuración (php artisan config:cache)"
echo "   - Optimizar rutas (php artisan route:cache)"
echo "   - Optimizar vistas (php artisan view:cache)"
echo ""

# 4. Seguridad
echo "4️⃣ SEGURIDAD"
echo "   - Configurar permisos de archivos"
echo "   - Configurar HTTPS"
echo "   - Configurar sessions seguras"
echo "   - Configurar CSRF protection"
echo ""

# 5. Hosting recomendado
echo "5️⃣ HOSTING RECOMENDADO"
echo ""
echo "   🌟 OPCIÓN ECONÓMICA - Shared Hosting"
echo "      • Hostinger: ~$3-5/mes"
echo "      • SiteGround: ~$4-8/mes"
echo "      • Incluye: PHP 7.4+, MySQL, SSL, Email"
echo ""
echo "   🚀 OPCIÓN PROFESIONAL - VPS"
echo "      • DigitalOcean: ~$5-10/mes"
echo "      • Vultr: ~$6-12/mes" 
echo "      • Control total del servidor"
echo ""
echo "   ⭐ OPCIÓN PREMIUM - Hosting Especializado"
echo "      • Laravel Forge + DigitalOcean: ~$12-15/mes"
echo "      • Backups automáticos, SSL, optimizado para Laravel"
echo ""

echo "6️⃣ COMANDOS DE PRODUCCIÓN"
echo ""
echo "   Para hosting compartido:"
echo "   composer install --optimize-autoloader --no-dev"
echo "   npm install && npm run production" 
echo "   php artisan migrate --force"
echo "   php artisan config:cache"
echo "   php artisan route:cache"
echo "   php artisan view:cache"
echo ""

echo "7️⃣ BACKUP Y SEGURIDAD DE DATOS"
echo ""
echo "   🔐 CRÍTICO: Configurar backups automáticos de MySQL"
echo "   📊 Los datos de pacientes son irreemplazables"
echo "   💾 Backup diario de base de datos recomendado"
echo "   🔄 Probar restauración de backups mensualmente"
echo ""

echo "📞 SIGUIENTES PASOS:"
echo "   1. Elegir proveedor de hosting"
echo "   2. Configurar dominio y SSL"
echo "   3. Configurar base de datos MySQL"
echo "   4. Subir archivos y configurar .env"
echo "   5. Ejecutar migraciones"
echo "   6. Configurar backups automáticos"
echo ""

echo "✅ ¿Listo para continuar con el deployment?"
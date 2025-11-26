#!/bin/bash
set -e

echo "🚀 Iniciando Ababu Veterinario..."

# Verificar que las variables de entorno críticas existan
if [ -z "$APP_KEY" ]; then
    echo "❌ ERROR: APP_KEY no está configurada"
    exit 1
fi

echo "✅ Variables de entorno verificadas"

# Limpiar cache de Laravel
echo "🧹 Limpiando cache..."
php artisan config:clear || true
php artisan cache:clear || true
php artisan view:clear || true

# Verificar conexión a base de datos
echo "🔍 Verificando conexión a base de datos..."
php artisan migrate:status || echo "⚠️  No se puede verificar estado de migraciones (puede ser normal en primera ejecución)"

# Ejecutar migraciones
echo "📊 Ejecutando migraciones..."
php artisan migrate --force || echo "⚠️  Migraciones ya ejecutadas o error"

# Seeders (opcional, comentado por defecto)
# echo "🌱 Ejecutando seeders..."
# php artisan db:seed --force || echo "⚠️  Seeders ya ejecutados o error"

echo "✅ Inicialización completa. Iniciando Apache..."

# Iniciar Apache
exec apache2-foreground

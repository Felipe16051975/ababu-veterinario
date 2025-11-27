#!/bin/sh
set -e

echo "=== Ababu Veterinario Startup ==="
echo "Limpiando cache..."
php artisan config:clear
php artisan cache:clear

echo "Ejecutando migraciones..."
php artisan migrate --force --verbose
if [ $? -eq 0 ]; then
    echo "✅ Migraciones completadas con éxito"
else
    echo "❌ Error al ejecutar migraciones"
fi

echo "🌱 Ejecutando seeders (poblado de datos)..."
php artisan db:seed --force || echo "⚠️ Advertencia: Algunos seeders pudieron fallar o ya existían datos."

echo "Iniciando Apache..."
exec apache2-foreground

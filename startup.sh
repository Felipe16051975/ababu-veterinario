#!/bin/sh
set -e

echo "=== Ababu Veterinario Startup ==="
echo "Limpiando cache..."
php artisan config:clear
php artisan cache:clear

echo "Ejecutando migraciones..."
php artisan migrate --force

echo "Iniciando Apache..."
exec apache2-foreground

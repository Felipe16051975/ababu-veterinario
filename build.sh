#!/bin/bash

# Vercel Build Script para Ababu Veterinario
# Este script optimiza la aplicación para producción en Vercel

echo "🚀 Iniciando build de Ababu para Vercel..."

# Limpiar caché de configuración
php artisan config:clear || true
php artisan cache:clear || true
php artisan route:clear || true
php artisan view:clear || true

# Optimizar para producción
php artisan config:cache || true
php artisan route:cache || true

echo "✅ Build completado para Vercel"
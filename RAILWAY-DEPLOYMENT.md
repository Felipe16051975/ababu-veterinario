# Guía de Despliegue en Railway.app

## Paso 1: Crear cuenta en Railway
1. Ve a [railway.app](https://railway.app)
2. Haz clic en "Start a New Project"
3. Conecta con tu cuenta de GitHub

## Paso 2: Crear nuevo proyecto
1. Selecciona "Deploy from GitHub repo"
2. Busca y selecciona `ababu-veterinario`
3. Railway detectará automáticamente el `Dockerfile`

## Paso 3: Agregar base de datos PostgreSQL
1. En tu proyecto, haz clic en "+ New"
2. Selecciona "Database" → "Add PostgreSQL"
3. Railway creará automáticamente la base de datos

## Paso 4: Configurar variables de entorno
1. Ve a la pestaña "Variables" de tu servicio web
2. Agrega las siguientes variables:

```
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG=false
APP_URL=${{RAILWAY_PUBLIC_DOMAIN}}

DB_CONNECTION=pgsql
DB_HOST=${{PGHOST}}
DB_PORT=${{PGPORT}}
DB_DATABASE=${{PGDATABASE}}
DB_USERNAME=${{PGUSER}}
DB_PASSWORD=${{PGPASSWORD}}

LOG_CHANNEL=stderr
SESSION_DRIVER=cookie
CACHE_DRIVER=array
QUEUE_CONNECTION=sync
```

**Nota:** Las variables `${{PGHOST}}`, `${{PGPORT}}`, etc. son automáticamente inyectadas por Railway cuando agregas la base de datos PostgreSQL.

## Paso 5: Ejecutar migraciones
1. Ve a la pestaña "Settings" de tu servicio
2. En "Deploy Triggers", agrega un comando post-deploy:
   ```
   php artisan migrate --force && php artisan db:seed --force
   ```

## Paso 6: Generar dominio público
1. Ve a "Settings" → "Networking"
2. Haz clic en "Generate Domain"
3. Railway te dará una URL como `ababu-veterinario-production.up.railway.app`

## ¡Listo!
Tu aplicación debería estar funcionando en Railway con PHP 8.1 y sin errores de compatibilidad.

### Ventajas de Railway vs Vercel
- ✅ Control total de versión de PHP
- ✅ Base de datos PostgreSQL incluida (no necesitas Supabase)
- ✅ Logs más detallados
- ✅ Comandos post-deploy automáticos

# Solución: PostgreSQL Crashed en Railway

## Problema
El servicio PostgreSQL muestra estado "Crashed" con error `catatonit:2: failed to exec pid1`.

## Solución Rápida

### Paso 1: Eliminar PostgreSQL actual
1. Ve a tu proyecto en Railway
2. Haz clic en el servicio "Postgres"
3. Settings → "Delete Service"
4. Confirma la eliminación

### Paso 2: Crear nuevo PostgreSQL
1. En tu proyecto, haz clic en "+ New"
2. Selecciona "Database"
3. Selecciona "Add PostgreSQL"
4. Railway creará automáticamente un nuevo servicio

### Paso 3: Verificar variables de entorno
1. Ve a tu servicio web (ababu-veterinario)
2. Pestaña "Variables"
3. Verifica que existan estas variables (Railway las crea automáticamente):
   - `PGHOST`
   - `PGPORT`
   - `PGDATABASE`
   - `PGUSER`
   - `PGPASSWORD`

### Paso 4: Agregar variables de Laravel
Si no las has agregado aún, agrega estas variables manualmente:

```
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG=false
APP_URL=https://ababu-veterinario-production.up.railway.app

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

### Paso 5: Redeploy
1. Ve a "Deployments"
2. Haz clic en "Redeploy" en el último deployment
3. Espera a que termine

### Paso 6: Ejecutar migraciones
Una vez que la base de datos esté funcionando, ejecuta:
1. Ve a Settings de tu servicio web
2. En "Custom Start Command", temporalmente cambia a:
   ```
   php artisan migrate --force && php artisan db:seed --force && apache2-foreground
   ```
3. Redeploy
4. Después del primer deploy exitoso, puedes volver a dejar solo `apache2-foreground`

## Verificación
- PostgreSQL debe mostrar estado "Active" (verde)
- Tu aplicación web debe poder conectarse a la base de datos
- Al visitar la URL, deberías ver la página de login

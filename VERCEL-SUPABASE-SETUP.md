# 🐘 CONFIGURACIÓN SUPABASE POSTGRESQL EN VERCEL

## 📋 Tus Credenciales de Supabase

Basándome en la información que proporcionaste:

```
🌐 Host: db.ugvywryylkraoryfnkvs.supabase.co
🗄️ Nombre BD: postgres
👤 Usuario: postgres
🔐 Contraseña: DaRuk112022
🚪 Puerto: 5432
```

## ⚙️ Variables de Entorno para Vercel

### 🎯 PASO 1: Ir a Vercel Dashboard

1. Ve a [https://vercel.com/dashboard](https://vercel.com/dashboard)
2. Selecciona tu proyecto **ababu-veterinario**
3. Click en **Settings** (arriba)
4. En el menú lateral: **Environment Variables**

### 📝 PASO 2: Agregar Variables de Entorno

Agrega TODAS estas variables una por una:

#### 🔷 Grupo 1: Configuración de la Aplicación

| Key | Value |
|-----|-------|
| `APP_NAME` | `Ababu Veterinario` |
| `APP_ENV` | `production` |
| `APP_KEY` | `base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=` |
| `APP_DEBUG` | `false` |
| `APP_URL` | `https://tu-proyecto.vercel.app` |

> ⚠️ Después del primer deploy, actualiza `APP_URL` con tu URL real de Vercel

#### 🔷 Grupo 2: Base de Datos PostgreSQL (Supabase)

| Key | Value |
|-----|-------|
| `DB_CONNECTION` | `pgsql` |
| `DB_HOST` | `db.ugvywryylkraoryfnkvs.supabase.co` |
| `DB_PORT` | `5432` |
| `DB_DATABASE` | `postgres` |
| `DB_USERNAME` | `postgres` |
| `DB_PASSWORD` | `DaRuk112022` |

> 🔒 **IMPORTANTE**: Cambia la contraseña después de configurar por seguridad

#### 🔷 Grupo 3: Configuración Laravel/Vercel

| Key | Value |
|-----|-------|
| `SESSION_DRIVER` | `cookie` |
| `CACHE_DRIVER` | `array` |
| `LOG_CHANNEL` | `stderr` |
| `QUEUE_CONNECTION` | `sync` |
| `SESSION_LIFETIME` | `120` |
| `BROADCAST_DRIVER` | `log` |
| `FILESYSTEM_DRIVER` | `local` |

### 🔐 PASO 3: Configuración SSL para Supabase

Supabase requiere SSL. Agrega esta variable adicional:

| Key | Value |
|-----|-------|
| `DB_SSLMODE` | `require` |

## 🚀 PASO 4: Deploy en Vercel

Después de agregar todas las variables:

1. Ve a la pestaña **Deployments**
2. Click en **"Redeploy"** en el último deployment
3. O haz un nuevo push a GitHub (Vercel desplegará automáticamente)

## 🗄️ PASO 5: Migrar Base de Datos

Una vez desplegado en Vercel, necesitas ejecutar las migraciones en tu base de datos Supabase.

### Opción A: Desde tu Computadora Local

```bash
# 1. Actualiza temporalmente tu archivo .env local con las credenciales de Supabase
DB_CONNECTION=pgsql
DB_HOST=db.ugvywryylkraoryfnkvs.supabase.co
DB_PORT=5432
DB_DATABASE=postgres
DB_USERNAME=postgres
DB_PASSWORD=DaRuk112022

# 2. Ejecuta las migraciones
php artisan migrate --force

# 3. (Opcional) Ejecuta los seeders
php artisan db:seed --force

# 4. Restaura tu .env local original
```

### Opción B: Desde Supabase Dashboard

1. Ve a [https://app.supabase.com](https://app.supabase.com)
2. Selecciona tu proyecto
3. Ve a **SQL Editor**
4. Puedes ejecutar las migraciones SQL directamente

## ✅ VERIFICAR CONFIGURACIÓN

### 1. Verificar Variables en Vercel

En **Settings → Environment Variables**, debes tener al menos **15 variables**:
- [ ] APP_NAME
- [ ] APP_ENV
- [ ] APP_KEY
- [ ] APP_DEBUG
- [ ] APP_URL
- [ ] DB_CONNECTION
- [ ] DB_HOST
- [ ] DB_PORT
- [ ] DB_DATABASE
- [ ] DB_USERNAME
- [ ] DB_PASSWORD
- [ ] DB_SSLMODE
- [ ] SESSION_DRIVER
- [ ] CACHE_DRIVER
- [ ] LOG_CHANNEL

### 2. Probar la Aplicación

1. Visita tu URL de Vercel: `https://tu-proyecto.vercel.app`
2. La aplicación debe cargar sin errores 500
3. Intenta acceder al login
4. Verifica que las operaciones de base de datos funcionen

### 3. Revisar Logs

Si hay problemas:
1. Ve a **Vercel Dashboard → Deployments**
2. Click en el deployment activo
3. Revisa **Function Logs** para ver errores

## 🔧 CONFIGURACIÓN ADICIONAL DE SUPABASE

### Permitir Conexiones desde Vercel

Supabase ya permite conexiones desde cualquier IP por defecto, pero verifica:

1. Ve a [https://app.supabase.com](https://app.supabase.com)
2. Selecciona tu proyecto
3. Ve a **Settings → Database**
4. En **Connection pooling**: Asegúrate de que esté habilitado
5. **SSL Enforcement**: Debe estar en "Required" o "Preferred"

### Connection String (Alternativa)

Si prefieres usar una sola variable de conexión:

```
DATABASE_URL=postgresql://postgres:DaRuk112022@db.ugvywryylkraoryfnkvs.supabase.co:5432/postgres?sslmode=require
```

Agrega esta variable en Vercel y Laravel la usará automáticamente.

## ⚠️ POSIBLES PROBLEMAS Y SOLUCIONES

### ❌ Error: "Connection refused"

**Causa**: Supabase puede estar pausado (plan gratuito)

**Solución**:
1. Ve al dashboard de Supabase
2. Reactiva el proyecto si está pausado
3. Espera unos minutos y reintenta

### ❌ Error: "SSL connection required"

**Causa**: Falta configurar SSL

**Solución**: Asegúrate de agregar `DB_SSLMODE=require` en las variables de entorno

### ❌ Error: "Password authentication failed"

**Causa**: Contraseña incorrecta o usuario incorrecto

**Solución**:
1. Ve a Supabase Dashboard → Settings → Database
2. Resetea la contraseña si es necesario
3. Actualiza `DB_PASSWORD` en Vercel

### ❌ Error: "Database does not exist"

**Causa**: El nombre de la base de datos es incorrecto

**Solución**: 
- Verifica en Supabase que el nombre sea `postgres` (es el predeterminado)
- O usa el nombre específico de tu base de datos

## 🔐 SEGURIDAD

### ⚠️ IMPORTANTE - Cambiar Contraseña

Has compartido tu contraseña públicamente en GitHub. Por seguridad:

1. **Ve a Supabase Dashboard**
2. **Settings → Database**
3. **Reset Database Password**
4. **Actualiza `DB_PASSWORD` en Vercel** con la nueva contraseña

### 🔒 Mejores Prácticas

- ✅ Usa contraseñas seguras (mínimo 16 caracteres)
- ✅ Habilita 2FA en Supabase
- ✅ Mantén `APP_DEBUG=false` en producción
- ✅ Revisa logs regularmente
- ✅ Configura backups automáticos en Supabase

## 📊 MONITOREO

### Supabase Dashboard

Monitorea tu base de datos:
- **Database → Reports**: Uso de CPU, memoria, conexiones
- **Logs → Postgres Logs**: Consultas y errores
- **Database → Backups**: Configura backups automáticos

### Vercel Dashboard

Monitorea tu aplicación:
- **Analytics**: Tráfico y performance
- **Logs**: Errores de funciones serverless
- **Usage**: Consumo de recursos

## 🎉 RESUMEN DE CONFIGURACIÓN

```env
# Aplicación
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG=false
APP_URL=https://tu-proyecto.vercel.app

# Base de Datos Supabase PostgreSQL
DB_CONNECTION=pgsql
DB_HOST=db.ugvywryylkraoryfnkvs.supabase.co
DB_PORT=5432
DB_DATABASE=postgres
DB_USERNAME=postgres
DB_PASSWORD=DaRuk112022
DB_SSLMODE=require

# Laravel/Vercel
SESSION_DRIVER=cookie
CACHE_DRIVER=array
LOG_CHANNEL=stderr
QUEUE_CONNECTION=sync
SESSION_LIFETIME=120
BROADCAST_DRIVER=log
FILESYSTEM_DRIVER=local
```

## 📞 SOPORTE

- **Supabase Docs**: [https://supabase.com/docs](https://supabase.com/docs)
- **Vercel Docs**: [https://vercel.com/docs](https://vercel.com/docs)
- **Laravel PostgreSQL**: [https://laravel.com/docs/7.x/database#postgresql](https://laravel.com/docs/7.x/database#postgresql)

---

**Última actualización**: 2025-11-15  
**Estado**: ✅ Listo para configurar

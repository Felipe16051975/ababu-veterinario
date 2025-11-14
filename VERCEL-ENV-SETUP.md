# 📋 CONFIGURACIÓN RÁPIDA PARA VERCEL
# ==================================

## 🎯 PASO 1: COPIAR VARIABLES DE ENTORNO

En el panel de Vercel, ve a **Environment Variables** y copia estas configuraciones:

### Variables básicas (obligatorias):
```
APP_NAME = Ababu Veterinario
APP_ENV = production
APP_KEY = base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG = false
APP_URL = https://tu-proyecto-name.vercel.app
```

### Variables de base de datos (temporales):
```
DB_CONNECTION = mysql
DB_HOST = aws.connect.psdb.cloud
DB_PORT = 3306
DB_DATABASE = ababu-veterinario
DB_USERNAME = placeholder-username
DB_PASSWORD = placeholder-password
```

### Variables de configuración Vercel:
```
SESSION_DRIVER = cookie
CACHE_DRIVER = array
LOG_CHANNEL = stderr
QUEUE_CONNECTION = sync
SESSION_LIFETIME = 120
BROADCAST_DRIVER = log
FILESYSTEM_DRIVER = local
```

## 🗄️ PASO 2: CONFIGURAR BASE DE DATOS (Después del deploy inicial)

1. **Crear cuenta PlanetScale**: https://planetscale.com
2. **Nueva base de datos**: nombre `ababu-veterinario`
3. **Obtener credenciales** de conexión
4. **Actualizar variables** en Vercel con datos reales
5. **Migrar esquema** de base de datos

## 📧 PASO 3: EMAIL (Opcional)

Para envío de emails, actualizar después:
```
MAIL_MAILER = smtp
MAIL_HOST = tu-smtp-host
MAIL_PORT = 587
MAIL_USERNAME = tu-email
MAIL_PASSWORD = tu-password
MAIL_FROM_ADDRESS = noreply@tu-dominio.com
```

## 🚀 ORDEN DE IMPLEMENTACIÓN

1. ✅ Agregar variables básicas en Vercel
2. ✅ Deploy inicial (puede fallar por DB)
3. ✅ Configurar PlanetScale
4. ✅ Actualizar variables DB en Vercel
5. ✅ Redeploy automático
6. ✅ Migrar base de datos
7. ✅ ¡Aplicación funcionando!

---
**Nota**: El archivo `.env.vercel` contiene todas las variables listas para copiar y pegar.
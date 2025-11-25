# 🚀 ABABU VETERINARIO - DESPLIEGUE EN VERCEL

## 📋 GUÍA DE CONFIGURACIÓN RÁPIDA

### ✅ **PASO 1: CONECTAR A VERCEL**
1. Ve a [https://vercel.com](https://vercel.com)
2. Login con tu cuenta de GitHub
3. Click en "Import Project"
4. Selecciona tu repositorio `ababu-veterinario`
5. Click "Deploy"

### ⚙️ **PASO 2: CONFIGURAR VARIABLES DE ENTORNO**

En el dashboard de Vercel, ve a **Settings > Environment Variables** y agrega:

```env
# Aplicación
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:TU_CLAVE_AQUÍ
APP_DEBUG=false
APP_URL=https://tu-proyecto.vercel.app

# Base de datos (Supabase PostgreSQL)
DB_CONNECTION=pgsql
DB_HOST=aws-0-us-west-2.pooler.supabase.com
DB_PORT=5432
DB_DATABASE=postgres
DB_USERNAME=postgres.tu-usuario
DB_PASSWORD=tu-password

# Session y Cache
SESSION_DRIVER=cookie
CACHE_DRIVER=array
QUEUE_CONNECTION=sync

# Otros
LOG_CHANNEL=stderr
BROADCAST_DRIVER=log
```

### 🗄️ **PASO 3: CONFIGURAR BASE DE DATOS (SUPABASE)**

#### **Opción Recomendada: Supabase (PostgreSQL)**
1. Crea una cuenta en [https://supabase.com](https://supabase.com)
2. Crea un nuevo proyecto (Free Tier)
3. Ve a **Project Settings > Database**
4. En la sección "Connection Pooling", habilita el pooler (Mode: Session)
5. Copia los datos de conexión para usar en Vercel (Host, User, Password, Port 5432 o 6543).

> **Nota:** Es importante usar el **Session Pooler** para evitar problemas de conexión en entornos serverless como Vercel.

### 🔧 **PASO 4: CONFIGURACIÓN AUTOMÁTICA**

El repositorio ya incluye:
- ✅ `vercel.json` - Configuración de despliegue
- ✅ `api/index.php` - Punto de entrada optimizado
- ✅ Rutas configuradas para archivos estáticos
- ✅ Variables de entorno predefinidas

### 🎯 **PASO 5: VERIFICAR DESPLIEGUE**

Después del deploy:
1. Vercel te dará una URL como: `https://ababu-veterinario.vercel.app`
2. Verificar que la aplicación carga
3. Probar login y funcionalidades básicas

### 🔐 **PASO 6: GENERAR APP_KEY**

Si necesitas generar una nueva `APP_KEY`:
```bash
# En local
php artisan key:generate --show
```
Copia el resultado a las variables de entorno de Vercel.

### 🚨 **SOLUCIÓN DE PROBLEMAS**

#### **Error 500 - Internal Server Error**
- Verificar variables de entorno
- Revisar logs en Vercel Dashboard > Functions
- Comprobar conexión a base de datos

#### **CSS/JS no cargan**
- Verificar rutas estáticas en `vercel.json`
- Comprobar `APP_URL` en variables de entorno

#### **Base de datos no conecta**
- Verificar credenciales de Supabase
- Asegurarse de usar el puerto del Pooler (5432 o 6543) y no el directo si hay problemas de IPv6.

### 📝 **COMANDOS POST-DEPLOY**

Para migrar la base de datos (ejecutar localmente con conexión remota):
```bash
# Configurar .env local con credenciales remotas de Supabase temporalmente
php artisan migrate --force
php artisan db:seed --force
```

> **⚠️ IMPORTANTE: USUARIO ROOT**
> Al ejecutar `db:seed`, se creará un usuario administrador `root@ababu.cloud`.
> **La contraseña se mostrará en la consola/terminal al finalizar el comando.**
> ¡Asegúrate de copiarla!

### 🎉 **VENTAJAS DE VERCEL + SUPABASE**

✅ **Deploy automático** desde GitHub
✅ **Base de datos PostgreSQL estable** (Supabase)
✅ **SSL gratis** incluido
✅ **CDN global** para mejor rendimiento
✅ **Escalabilidad automática**
✅ **Logs en tiempo real**

### 📞 **SOPORTE**

- **Vercel Docs:** https://vercel.com/docs
- **Supabase Docs:** https://supabase.com/docs
- **Laravel Vercel:** https://laravel.com/docs/7.x/deployment

---

## 🚀 **¡LISTO PARA DESPEGAR!**

Tu aplicación Ababu está configurada para funcionar perfectamente en Vercel con Supabase. Solo sigue los pasos y tendrás tu sistema veterinario online en minutos.
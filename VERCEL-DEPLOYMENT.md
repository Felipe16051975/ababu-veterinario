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

# Base de datos (PlanetScale recomendado)
DB_CONNECTION=mysql
DB_HOST=tu-host-planetscale.psdb.cloud
DB_PORT=3306
DB_DATABASE=tu-database
DB_USERNAME=tu-username
DB_PASSWORD=tu-password

# Session y Cache
SESSION_DRIVER=cookie
CACHE_DRIVER=array
QUEUE_CONNECTION=sync

# Otros
LOG_CHANNEL=stderr
BROADCAST_DRIVER=log
```

### 🗄️ **PASO 3: CONFIGURAR BASE DE DATOS**

#### **Opción A: PlanetScale (Recomendado)**
1. Crear cuenta en [https://planetscale.com](https://planetscale.com)
2. Crear nueva base de datos
3. Obtener string de conexión
4. Agregar credenciales a Vercel

#### **Opción B: Railway MySQL**
1. Cuenta en [https://railway.app](https://railway.app)
2. Crear servicio MySQL
3. Copiar credenciales de conexión

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
- Verificar credenciales de PlanetScale/Railway
- Comprobar SSL y configuraciones especiales

### 📝 **COMANDOS POST-DEPLOY**

Para migrar la base de datos (ejecutar localmente con conexión remota):
```bash
# Configurar .env con credenciales remotas temporalmente
php artisan migrate --force
php artisan db:seed --force
```

### 🎉 **VENTAJAS DE VERCEL**

✅ **Deploy automático** desde GitHub  
✅ **SSL gratis** incluido  
✅ **CDN global** para mejor rendimiento  
✅ **Escalabilidad automática**  
✅ **Logs en tiempo real**  
✅ **Dominios personalizados** gratis  

### 📞 **SOPORTE**

- **Vercel Docs:** https://vercel.com/docs
- **PlanetScale:** https://planetscale.com/docs
- **Laravel Vercel:** https://laravel.com/docs/7.x/deployment

---

## 🚀 **¡LISTO PARA DESPEGAR!**

Tu aplicación Ababu está configurada para funcionar perfectamente en Vercel. Solo sigue los pasos y tendrás tu sistema veterinario online en minutos.
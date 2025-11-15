# 🔐 CONFIGURAR VARIABLES DE ENTORNO EN VERCEL

## 📋 Lista Completa de Variables de Entorno

### ✅ Variables Obligatorias (Copiar y Pegar en Vercel)

```env
APP_NAME=Ababu Veterinario
APP_ENV=production
APP_KEY=base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG=false
APP_URL=https://tu-proyecto.vercel.app
```

> ⚠️ **IMPORTANTE**: Reemplaza `https://tu-proyecto.vercel.app` con tu URL real de Vercel después del primer deploy.

### 🗄️ Variables de Base de Datos

```env
DB_CONNECTION=mysql
DB_HOST=tu-database-host.psdb.cloud
DB_PORT=3306
DB_DATABASE=ababu-veterinario
DB_USERNAME=tu-username
DB_PASSWORD=tu-password-seguro
```

> 💡 **Recomendación**: Usa [PlanetScale](https://planetscale.com) (MySQL gratis) o [Railway](https://railway.app)

### ⚙️ Variables de Configuración Laravel (Obligatorias para Vercel)

```env
SESSION_DRIVER=cookie
CACHE_DRIVER=array
LOG_CHANNEL=stderr
QUEUE_CONNECTION=sync
SESSION_LIFETIME=120
BROADCAST_DRIVER=log
FILESYSTEM_DRIVER=local
```

### 📧 Variables de Email (Opcional - Configurar después)

```env
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=tu-username
MAIL_PASSWORD=tu-password
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=noreply@tu-dominio.com
MAIL_FROM_NAME=Ababu Veterinario
```

---

## 🎯 CÓMO CONFIGURAR EN VERCEL (Paso a Paso)

### Paso 1: Acceder al Dashboard de Vercel

1. Ve a [https://vercel.com/dashboard](https://vercel.com/dashboard)
2. Inicia sesión con tu cuenta de GitHub
3. Busca tu proyecto `ababu-veterinario` en la lista

### Paso 2: Ir a Configuración de Variables de Entorno

1. Haz clic en tu proyecto `ababu-veterinario`
2. Haz clic en la pestaña **"Settings"** (arriba)
3. En el menú lateral izquierdo, haz clic en **"Environment Variables"**

### Paso 3: Agregar Variables Una por Una

Para cada variable de la lista arriba:

1. **En el campo "Key"**: Escribe el nombre de la variable (ejemplo: `APP_NAME`)
2. **En el campo "Value"**: Escribe el valor (ejemplo: `Ababu Veterinario`)
3. **En "Environments"**: Selecciona todas las opciones:
   - ✅ Production
   - ✅ Preview
   - ✅ Development
4. Haz clic en **"Add"** o **"Save"**

### Paso 4: Variables a Agregar (En este orden)

#### 🔹 Grupo 1: Aplicación Básica
```
APP_NAME = Ababu Veterinario
APP_ENV = production
APP_KEY = base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
APP_DEBUG = false
APP_URL = https://tu-proyecto.vercel.app
```

#### 🔹 Grupo 2: Base de Datos
```
DB_CONNECTION = mysql
DB_HOST = tu-database-host
DB_PORT = 3306
DB_DATABASE = ababu-veterinario
DB_USERNAME = tu-username
DB_PASSWORD = tu-password
```

#### 🔹 Grupo 3: Laravel/Vercel
```
SESSION_DRIVER = cookie
CACHE_DRIVER = array
LOG_CHANNEL = stderr
QUEUE_CONNECTION = sync
SESSION_LIFETIME = 120
BROADCAST_DRIVER = log
FILESYSTEM_DRIVER = local
```

---

## 🔑 GENERAR NUEVA APP_KEY (Si es necesario)

Si necesitas generar una nueva `APP_KEY`:

### Opción 1: Usando PHP localmente
```bash
php artisan key:generate --show
```

Copia la salida completa (incluyendo `base64:`):
```
base64:iWMer7qYPW9sePpKwPEKhNkE38NxL6btMNjNjY46Wi4=
```

### Opción 2: Generador Online
1. Ve a [https://generate-random.org/laravel-key-generator](https://generate-random.org/laravel-key-generator)
2. Copia la key generada (incluye `base64:` al inicio)

---

## 🗄️ CONFIGURAR BASE DE DATOS

### Opción A: PlanetScale (Recomendado - MySQL Gratis)

1. **Crear cuenta**: [https://planetscale.com](https://planetscale.com)
2. **Crear base de datos**:
   - Nombre: `ababu-veterinario`
   - Region: Selecciona la más cercana
3. **Obtener credenciales**:
   - Haz clic en "Connect"
   - Selecciona "General" o "Laravel"
   - Copia las credenciales:
     ```
     Host: aws.connect.psdb.cloud
     Username: xxxxxxxxxx
     Password: pscale_pw_xxxxxxxxxx
     Database: ababu-veterinario
     ```
4. **Agregar a Vercel**: Usa estos valores en las variables `DB_*`

### Opción B: Railway (MySQL/PostgreSQL)

1. **Crear cuenta**: [https://railway.app](https://railway.app)
2. **Nuevo proyecto**: "+ New Project"
3. **Agregar MySQL**: Selecciona "Add MySQL"
4. **Copiar credenciales**: Railway te mostrará automáticamente:
   ```
   MYSQL_HOST: containers-us-west-xx.railway.app
   MYSQL_USER: root
   MYSQL_PASSWORD: xxxxxxxxxxxx
   MYSQL_DATABASE: railway
   MYSQL_PORT: 3306
   ```
5. **Agregar a Vercel**: Usa estos valores en las variables `DB_*`

### Opción C: Tu Propia Base de Datos

Si tienes tu propio servidor MySQL:

1. **Permitir conexiones remotas**:
   - Configura firewall para permitir conexiones desde cualquier IP (0.0.0.0/0)
   - O específicamente desde las IPs de Vercel

2. **Crear base de datos**:
   ```sql
   CREATE DATABASE ababu_veterinario CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   CREATE USER 'ababu_user'@'%' IDENTIFIED BY 'password_seguro';
   GRANT ALL PRIVILEGES ON ababu_veterinario.* TO 'ababu_user'@'%';
   FLUSH PRIVILEGES;
   ```

3. **Agregar credenciales a Vercel**

---

## ✅ VERIFICAR CONFIGURACIÓN

Después de agregar todas las variables:

1. **Revisar lista**: En Vercel → Settings → Environment Variables
2. **Verificar que todas estén presentes**: Mínimo las 15 variables obligatorias
3. **Redeploy**: Vercel puede pedir redeploy automáticamente

---

## 🚀 DESPUÉS DE CONFIGURAR VARIABLES

### 1. Trigger Deploy (Si no se redesplegó automáticamente)

- Ve a la pestaña **"Deployments"**
- Haz clic en los 3 puntos (...) del último deployment
- Selecciona **"Redeploy"**

### 2. Migrar Base de Datos (Desde tu computadora local)

```bash
# 1. Actualiza tu .env local con las credenciales REMOTAS temporalmente
DB_HOST=tu-database-host-remoto
DB_USERNAME=tu-username-remoto
DB_PASSWORD=tu-password-remoto

# 2. Ejecuta las migraciones
php artisan migrate --force

# 3. (Opcional) Ejecuta los seeders
php artisan db:seed --force

# 4. Restaura tu .env local original
```

### 3. Verificar Despliegue

1. **Visita tu URL**: `https://tu-proyecto.vercel.app`
2. **Verifica que cargue**: No debe aparecer error 500
3. **Prueba el login**: Si tienes usuarios en la base de datos
4. **Revisa logs**: Vercel → Deployments → Click en deployment → Function Logs

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### ❌ Error: "APP_KEY not set"
**Solución**: Asegúrate de agregar la variable `APP_KEY` con el formato `base64:...`

### ❌ Error: "Connection refused" o "Database error"
**Solución**: 
1. Verifica credenciales de base de datos
2. Asegura que la base de datos permite conexiones remotas
3. Revisa el firewall de tu base de datos

### ❌ Error 500: Internal Server Error
**Solución**:
1. Ve a Vercel → Deployments → Function Logs
2. Identifica el error específico
3. Verifica que todas las variables estén configuradas
4. Asegura que `APP_URL` coincide con tu URL de Vercel

### ❌ CSS/JS no cargan
**Solución**:
1. Verifica que `APP_URL` sea correcto
2. Limpia caché del navegador
3. Verifica que los archivos estén en `public/css` y `public/js`

---

## 📝 LISTA DE VERIFICACIÓN FINAL

- [ ] Todas las variables de **Grupo 1** agregadas
- [ ] Todas las variables de **Grupo 2** agregadas (con credenciales reales)
- [ ] Todas las variables de **Grupo 3** agregadas
- [ ] `APP_URL` actualizada con tu URL real de Vercel
- [ ] Base de datos creada y accesible
- [ ] Migraciones ejecutadas en base de datos remota
- [ ] Deploy completado sin errores
- [ ] Aplicación carga correctamente
- [ ] Login funciona (si aplica)

---

## 🎉 ¡LISTO!

Tu aplicación Ababu Veterinario debería estar funcionando en Vercel.

**URL de la aplicación**: https://tu-proyecto.vercel.app

**Próximos pasos**:
- Configurar dominio personalizado (opcional)
- Configurar email (opcional)
- Monitorear logs y performance

---

**Última actualización**: 2025-11-15  
**Soporte**: Revisa VERCEL-FIXES.md para más detalles técnicos

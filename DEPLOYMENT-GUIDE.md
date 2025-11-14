# 🚀 GUÍA COMPLETA DE DEPLOYMENT PARA ABABU

## ⚠️ PROBLEMA CRÍTICO IDENTIFICADO
**El problema que mencionas de que "se borran los pacientes cuando se apaga el PC" es porque estás usando SQLite que es solo para desarrollo local. En producción DEBES usar MySQL.**

## 📋 OPCIONES DE HOSTING RECOMENDADAS

### 1. 💰 **OPCIÓN ECONÓMICA** (Recomendada para empezar)
**Hostinger o SiteGround** - $3-8/mes
- ✅ Incluye PHP 7.4+, MySQL, SSL, Email
- ✅ Panel de control fácil (cPanel)
- ✅ Soporte técnico
- ✅ Ideal para clínicas pequeñas-medianas
- ❌ Menos control sobre servidor

### 2. 🚀 **OPCIÓN PROFESIONAL** 
**DigitalOcean o Vultr VPS** - $5-12/mes
- ✅ Control total del servidor
- ✅ Mejor rendimiento
- ✅ Escalable
- ✅ Ideal para múltiples clínicas
- ❌ Requiere conocimientos técnicos

### 3. ⭐ **OPCIÓN PREMIUM**
**Laravel Forge + DigitalOcean** - $12-15/mes
- ✅ Optimizado para Laravel
- ✅ Backups automáticos
- ✅ SSL automático
- ✅ Deployment automatizado
- ✅ Ideal para crecimiento rápido

## 🔧 PREPARACIÓN PARA PRODUCCIÓN

### Paso 1: Configurar Base de Datos Segura

1. **Cambiar de SQLite a MySQL**
   ```bash
   # En tu .env de producción:
   DB_CONNECTION=mysql
   DB_HOST=localhost
   DB_DATABASE=ababu_produccion
   DB_USERNAME=ababu_user
   DB_PASSWORD=PASSWORD_MUY_SEGURO
   ```

2. **Ejecutar migraciones nuevas**
   ```bash
   php artisan migrate --force
   ```

### Paso 2: Optimizar para Producción

```bash
# Instalar dependencias optimizadas
composer install --optimize-autoloader --no-dev

# Compilar assets
npm install --production
npm run production

# Optimizar Laravel
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### Paso 3: Configurar Seguridad

```bash
# En .env:
APP_ENV=production
APP_DEBUG=false
SESSION_SECURE_COOKIE=true
SESSION_SAME_SITE=strict
```

## 🔐 SEGURIDAD DE DATOS CRÍTICA

### ⚠️ MUY IMPORTANTE - BACKUPS

```bash
# Backup diario automático (configurar en cron):
0 2 * * * mysqldump -u usuario -p password ababu_produccion > backup_$(date +\%Y\%m\%d).sql

# Backup semanal completo:
0 1 * * 0 tar -czf backup_completo_$(date +\%Y\%m\%d).tar.gz /ruta/a/ababu/ /backup/mysql/
```

### 📊 Protección de Datos de Pacientes
- ✅ **Backup diario automático**
- ✅ **SSL/HTTPS obligatorio**
- ✅ **Passwords encriptados**
- ✅ **Sesiones seguras**
- ✅ **Logs de auditoría**

## 📂 ARCHIVOS PARA SUBIR

### Estructura a subir al hosting:
```
ababu/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/          # ← Esta será la carpeta web pública
├── resources/
├── routes/
├── storage/         # ← Permisos 755
├── vendor/          # ← Generar con composer install
├── .env             # ← Configuración de producción
└── composer.json
```

## ⚡ COMANDOS DE DEPLOYMENT

### Para Shared Hosting (Hostinger/SiteGround):
```bash
# 1. Subir archivos por FTP/cPanel File Manager
# 2. Configurar .env con datos de MySQL del hosting
# 3. Ejecutar en terminal SSH:
cd public_html/ababu
composer install --no-dev
php artisan migrate --force
php artisan key:generate
php artisan config:cache
```

### Para VPS:
```bash
# Configurar servidor LEMP
sudo apt update
sudo apt install nginx mysql-server php8.0-fpm php8.0-mysql php8.0-xml php8.0-gd

# Clonar proyecto
git clone https://github.com/tu-usuario/ababu.git
cd ababu
composer install --no-dev
cp .env.production .env
php artisan migrate --force
```

## 🌐 CONFIGURACIÓN DEL DOMINIO

### Para que funcione tu dominio:
1. **Apuntar el document root a `/public`**
2. **Configurar SSL (Let's Encrypt gratis)**
3. **Configurar redirects HTTP → HTTPS**

### Ejemplo configuración Nginx:
```nginx
server {
    listen 443 ssl;
    server_name tu-dominio.com;
    root /var/www/ababu/public;
    
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/private.key;
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

## 📈 MONITOREO Y MANTENIMIENTO

### Tareas importantes:
- ✅ **Backup diario automático**
- ✅ **Monitoring de espacio en disco**
- ✅ **Actualizaciones de seguridad**
- ✅ **Logs de errores**
- ✅ **Certificados SSL renovación**

## 🚨 PLAN DE RECUPERACIÓN

### En caso de problemas:
1. **Restaurar desde backup más reciente**
2. **Verificar integridad de datos**
3. **Contactar soporte técnico**
4. **Documentar incidente**

## 💡 RECOMENDACIÓN PERSONAL

**Para tu caso específico, recomiendo empezar con Hostinger:**
- Económico ($3-5/mes)
- Fácil de usar
- Incluye MySQL robusto
- Backups automáticos
- Soporte 24/7
- SSL gratis

**Luego migrar a VPS cuando crezcas.**

¿Qué opción te parece más adecuada para tu clínica?
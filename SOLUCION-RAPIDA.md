# ⚡ SOLUCIÓN RÁPIDA - Railway Start Command

## 🎯 En Lugar de Arreglar Dockerfile

Railway permite configurar un **comando de inicio personalizado** que se ejecuta **después** del build.

## 📝 Pasos (1 minuto):

1. Ve a Railway → Tu servicio web → **Settings**
2. Busca la sección **"Deploy"**
3. En **"Custom Start Command"** pega esto:

```bash
php artisan config:clear && php artisan cache:clear && php artisan migrate --force && apache2-foreground
```

4. Click en **"Deploy"** (abajo a la derecha)
5. Espera 2 minutos

## ✅ Resultado

Railway ejecutará las migraciones ANTES de iniciar Apache, sin necesidad de modificar el Dockerfile.

---

## 🔄 Alternativa: Arreglar el Script

Si prefieres usar el Dockerfile, necesito convertir `startup.sh` a formato Unix. Te aviso cuando esté listo para hacer commit.

---

**Recomendación**: Usa el Start Command de Railway (opción 1). Es más simple y rápido.

#!/bin/bash

# 🔐 SCRIPT DE BACKUP AUTOMÁTICO - ABABU
# =====================================
# 
# Este script hace backup seguro de la base de datos de ABABU
# Los datos de pacientes son CRÍTICOS - no pueden perderse
#
# Uso: ./backup-ababu.sh
# Configura en cron para ejecutar diariamente

# Configuración
DB_NAME="ababu_produccion"
DB_USER="ababu_user" 
DB_PASSWORD="TU_PASSWORD_AQUI"
BACKUP_DIR="/home/backups/ababu"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="ababu_backup_${DATE}.sql"
DAYS_TO_KEEP=30

# Crear directorio de backup si no existe
mkdir -p "$BACKUP_DIR"

echo "🔐 Iniciando backup de ABABU..."
echo "📅 Fecha: $(date)"
echo "💾 Archivo: $BACKUP_FILE"

# Hacer backup de la base de datos
mysqldump -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/$BACKUP_FILE"

# Verificar que el backup se creó correctamente
if [ $? -eq 0 ]; then
    echo "✅ Backup completado exitosamente"
    
    # Comprimir el backup
    gzip "$BACKUP_DIR/$BACKUP_FILE"
    echo "📦 Backup comprimido: ${BACKUP_FILE}.gz"
    
    # Limpiar backups antiguos (mantener solo los últimos 30 días)
    find "$BACKUP_DIR" -name "ababu_backup_*.sql.gz" -type f -mtime +$DAYS_TO_KEEP -delete
    echo "🧹 Backups antiguos limpiados (manteniendo últimos $DAYS_TO_KEEP días)"
    
    # Mostrar tamaño del backup
    BACKUP_SIZE=$(du -h "$BACKUP_DIR/${BACKUP_FILE}.gz" | cut -f1)
    echo "📊 Tamaño del backup: $BACKUP_SIZE"
    
    # Contar total de backups
    TOTAL_BACKUPS=$(ls -1 "$BACKUP_DIR"/ababu_backup_*.sql.gz | wc -l)
    echo "📁 Total de backups guardados: $TOTAL_BACKUPS"
    
else
    echo "❌ ERROR: Backup falló"
    exit 1
fi

echo ""
echo "🏥 BACKUP DE ABABU COMPLETADO"
echo "================================"
echo "Los datos de pacientes están seguros 🔐"
echo ""

# Para configurar en cron (ejecutar diariamente a las 2 AM):
# 0 2 * * * /ruta/al/script/backup-ababu.sh >> /var/log/ababu-backup.log 2>&1
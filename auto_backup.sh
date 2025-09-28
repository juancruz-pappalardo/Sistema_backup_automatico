#!/bin/bash

BACKUP_DIR="/backups"
RETENTION_DAYS=7
DATE=$(date +%Y%m%d_%H%M%S)

backup_mysql() {
    mysqldump -u root database > "$BACKUP_DIR/db_$DATE.sql"
    gzip "$BACKUP_DIR/db_$DATE.sql"
}

backup_files() {
    tar -czf "$BACKUP_DIR/web_$DATE.tar.gz" /var/www/html/
}

clean_old_backups() {
    find "$BACKUP_DIR" -name "*.gz" -mtime +$RETENTION_DAYS -delete
}

# Ejecución
mkdir -p "$BACKUP_DIR"
backup_mysql
backup_files
clean_old_backups
echo "Backup completado: $DATE" >> /var/log/backup.log

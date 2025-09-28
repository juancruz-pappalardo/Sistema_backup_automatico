Sistema de backups automatizados con rotación inteligente y compresión.

🎯 Objetivo
Realizar backups periódicos de bases de datos y archivos críticos, manteniendo un historial controlado.

Características
- 🗃️ Backup de bases de datos MySQL
- 📁 Backup de archivos y directorios
- 🗑️ Rotación automática de backups antiguos
- 🔐 Compresión para ahorrar espacio
- 📝 Logging de todas las operaciones

🛠️ Tecnologías Utilizadas
- **Bash Scripting** - Automatización
- **MySQLdump** - Exportación de BDs
- **Tar/Gzip** - Compresión de archivos
- **Cron** - Programación

📋 Requisitos Previos
- bash

Para backup de MySQL
sudo apt install mysql-server

Para compresión
sudo apt install gzip tar

Configuración rápida
1. Hacer ejecutable el script
chmod +x auto_backup.sh

2. Configurar rutas y retención (editar script)
BACKUP_DIR="/backups"
RETENTION_DAYS=7

3. Programar ejecución diaria (2 AM)
crontab -e
0 2 * * * /ruta/completa/auto_backup.sh

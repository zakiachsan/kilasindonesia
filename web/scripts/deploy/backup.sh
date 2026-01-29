#!/bin/bash

# Backup database and uploads

set -e

BACKUP_DIR="/opt/backups/kilasindonesia"
DATE=$(date +%Y%m%d_%H%M%S)

echo "=== Creating Backup ==="

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup database
echo "Backing up database..."
docker compose -f docker-compose.prod.yml exec -T postgres pg_dump -U kilasindonesia kilasindonesia > "$BACKUP_DIR/db_$DATE.sql"

# Compress database backup
gzip "$BACKUP_DIR/db_$DATE.sql"

# Backup uploads
echo "Backing up uploads..."
docker compose -f docker-compose.prod.yml run --rm -v uploads_data:/uploads -v $BACKUP_DIR:/backup alpine tar czf /backup/uploads_$DATE.tar.gz -C /uploads .

# Remove old backups (keep last 7 days)
find $BACKUP_DIR -type f -mtime +7 -delete

echo "=== Backup Complete ==="
echo "Database: $BACKUP_DIR/db_$DATE.sql.gz"
echo "Uploads: $BACKUP_DIR/uploads_$DATE.tar.gz"

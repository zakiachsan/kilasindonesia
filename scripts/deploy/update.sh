#!/bin/bash

# Update the Kilas Indonesia application

set -e

echo "=== Updating Kilas Indonesia ==="

# Pull latest code (if using git)
# git pull origin main

# Load environment variables
export $(cat .env.production | grep -v '^#' | xargs)

# Rebuild and restart app container only
docker compose -f docker-compose.prod.yml build app
docker compose -f docker-compose.prod.yml up -d --no-deps app

# Wait for app to be ready
sleep 5

# Run any new migrations
echo "Running database migrations..."
docker compose -f docker-compose.prod.yml exec app npx prisma migrate deploy

echo "=== Update Complete ==="

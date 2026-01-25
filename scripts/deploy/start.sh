#!/bin/bash

# Start the Kilas Indonesia application

set -e

echo "=== Starting Kilas Indonesia ==="

# Check if .env.production exists
if [ ! -f ".env.production" ]; then
    echo "Error: .env.production file not found!"
    echo "Please create .env.production with your production settings."
    exit 1
fi

# Load environment variables
export $(cat .env.production | grep -v '^#' | xargs)

# Build and start containers
docker compose -f docker-compose.prod.yml build
docker compose -f docker-compose.prod.yml up -d

# Wait for database to be ready
echo "Waiting for database to be ready..."
sleep 10

# Run database migrations
echo "Running database migrations..."
docker compose -f docker-compose.prod.yml exec app npx prisma migrate deploy

echo "=== Application Started ==="
echo "Website: https://kilasindonesia.com"
echo ""
echo "View logs: docker compose -f docker-compose.prod.yml logs -f"

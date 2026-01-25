#!/bin/bash

# Initialize SSL certificates with Let's Encrypt
# Run this before the first deployment

set -e

DOMAIN="kilasindonesia.com"
EMAIL="admin@kilasindonesia.com"

echo "=== Initializing SSL Certificates ==="

# Create temporary nginx config for certificate validation
cat > nginx/conf.d/default.conf << 'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name kilasindonesia.com www.kilasindonesia.com;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 200 'OK';
        add_header Content-Type text/plain;
    }
}
EOF

# Start nginx only
docker compose -f docker-compose.prod.yml up -d nginx

# Wait for nginx to start
sleep 5

# Get certificates
docker compose -f docker-compose.prod.yml run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    -d $DOMAIN \
    -d www.$DOMAIN

# Stop nginx
docker compose -f docker-compose.prod.yml down

echo "=== SSL Certificates Initialized ==="
echo "Now run ./scripts/deploy/start.sh to start the application"

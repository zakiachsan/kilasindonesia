#!/bin/bash

# Kilas Indonesia - Server Setup Script
# Run this script on a fresh Tencent Cloud server

set -e

echo "=== Kilas Indonesia Server Setup ==="

# Update system
echo "Updating system packages..."
apt-get update && apt-get upgrade -y

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

# Install Docker Compose
echo "Installing Docker Compose..."
apt-get install -y docker-compose-plugin

# Create app directory
echo "Creating application directory..."
mkdir -p /opt/kilasindonesia
cd /opt/kilasindonesia

# Create required directories
mkdir -p nginx/conf.d certbot/conf certbot/www

echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "1. Copy your application files to /opt/kilasindonesia"
echo "2. Create .env.production file with your secrets"
echo "3. Run: ./scripts/deploy/init-ssl.sh to get SSL certificates"
echo "4. Run: ./scripts/deploy/start.sh to start the application"

#!/bin/bash

# Stop the Kilas Indonesia application

echo "=== Stopping Kilas Indonesia ==="

docker compose -f docker-compose.prod.yml down

echo "=== Application Stopped ==="

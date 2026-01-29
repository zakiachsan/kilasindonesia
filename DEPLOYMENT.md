# Deployment Guide - Kilas Indonesia

Panduan deployment ke Tencent Cloud server.

## Prerequisites

- Tencent Cloud server (Ubuntu 22.04 LTS recommended)
- Domain pointing to server IP (kilasindonesia.com)
- SSH access to server

## Server Setup

### 1. Connect to Server

```bash
ssh root@YOUR_SERVER_IP
```

### 2. Run Setup Script

```bash
# Download and run setup script
curl -fsSL https://raw.githubusercontent.com/YOUR_REPO/main/scripts/deploy/setup.sh | bash
```

Or manually:

```bash
# Update system
apt-get update && apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com | bash

# Install Docker Compose
apt-get install -y docker-compose-plugin

# Create app directory
mkdir -p /opt/kilasindonesia
```

### 3. Upload Application Files

From your local machine:

```bash
# Using rsync
rsync -avz --exclude 'node_modules' --exclude '.next' --exclude '.git' \
  ./web/ root@YOUR_SERVER_IP:/opt/kilasindonesia/

# Or using scp
scp -r ./web/* root@YOUR_SERVER_IP:/opt/kilasindonesia/
```

### 4. Configure Environment

On the server:

```bash
cd /opt/kilasindonesia

# Copy example env file
cp .env.production.example .env.production

# Edit with your values
nano .env.production
```

Required values to change:
- `POSTGRES_PASSWORD` - Strong database password
- `NEXTAUTH_SECRET` - Generate with `openssl rand -base64 32`

### 5. Initialize SSL Certificates

```bash
chmod +x scripts/deploy/*.sh
./scripts/deploy/init-ssl.sh
```

### 6. Start Application

```bash
./scripts/deploy/start.sh
```

## Daily Operations

### View Logs

```bash
# All services
docker compose -f docker-compose.prod.yml logs -f

# Specific service
docker compose -f docker-compose.prod.yml logs -f app
docker compose -f docker-compose.prod.yml logs -f nginx
docker compose -f docker-compose.prod.yml logs -f postgres
```

### Update Application

```bash
cd /opt/kilasindonesia

# Pull latest code (if using git)
git pull origin main

# Update
./scripts/deploy/update.sh
```

### Backup

```bash
./scripts/deploy/backup.sh
```

Backups are stored in `/opt/backups/kilasindonesia/`

### Stop Application

```bash
./scripts/deploy/stop.sh
```

### Restart Application

```bash
docker compose -f docker-compose.prod.yml restart
```

## Database Management

### Access Database

```bash
docker compose -f docker-compose.prod.yml exec postgres psql -U kilasindonesia
```

### Run Migrations

```bash
docker compose -f docker-compose.prod.yml exec app npx prisma migrate deploy
```

### Reset Database (CAREFUL!)

```bash
docker compose -f docker-compose.prod.yml exec app npx prisma migrate reset
```

## Troubleshooting

### App not starting

1. Check logs: `docker compose -f docker-compose.prod.yml logs app`
2. Verify environment variables in `.env.production`
3. Check database connection

### SSL issues

1. Check certbot logs: `docker compose -f docker-compose.prod.yml logs certbot`
2. Verify domain DNS is pointing to server
3. Re-run SSL init script

### Database connection refused

1. Check if postgres is running: `docker compose -f docker-compose.prod.yml ps`
2. Check postgres logs: `docker compose -f docker-compose.prod.yml logs postgres`
3. Verify DATABASE_URL in environment

### 502 Bad Gateway

1. Check if app is running: `docker compose -f docker-compose.prod.yml ps`
2. Check app logs for errors
3. Restart app: `docker compose -f docker-compose.prod.yml restart app`

## Security Recommendations

1. **Firewall**: Only open ports 80, 443, and SSH
   ```bash
   ufw allow 22
   ufw allow 80
   ufw allow 443
   ufw enable
   ```

2. **SSH**: Disable password authentication, use SSH keys

3. **Regular Updates**: Keep system and Docker updated
   ```bash
   apt-get update && apt-get upgrade -y
   ```

4. **Backups**: Setup automated backups with cron
   ```bash
   # Add to crontab
   0 2 * * * /opt/kilasindonesia/scripts/deploy/backup.sh
   ```

## File Structure on Server

```
/opt/kilasindonesia/
├── docker-compose.prod.yml
├── Dockerfile
├── .env.production
├── nginx/
│   ├── nginx.conf
│   └── conf.d/
│       └── default.conf
├── certbot/
│   ├── conf/          # SSL certificates
│   └── www/           # ACME challenge files
├── scripts/
│   └── deploy/
│       ├── setup.sh
│       ├── init-ssl.sh
│       ├── start.sh
│       ├── stop.sh
│       ├── update.sh
│       └── backup.sh
└── ... (application files)
```

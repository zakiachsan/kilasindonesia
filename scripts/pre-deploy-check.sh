#!/bin/bash
# Pre-deploy simulation script for kilasindonesia
# This script simulates a production deployment locally before actual push
# Run with: ./scripts/pre-deploy-check.sh

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

APP_URL="http://localhost:3001"
ARTICLE_SLUG="holding-perkebaran-nusantara-melalui-ptpn-i-regional-2-siapkan-restorasi-14000-hektare-pascabencana-pasirlangu"
PASS=0
FAIL=0

log_pass() { echo -e "${GREEN}✓ PASS${NC}: $1"; ((PASS++)); }
log_fail() { echo -e "${RED}✗ FAIL${NC}: $1"; ((FAIL++)); }
log_info() { echo -e "${YELLOW}ℹ INFO${NC}: $1"; }

cleanup() {
    log_info "Cleaning up local containers..."
    cd "$(dirname "$0")/web"
    docker compose -f docker-compose.local.yml down --remove-orphans 2>/dev/null || true
}

# Trap to ensure cleanup on exit
trap cleanup EXIT

echo "=============================================="
echo "  KILASINDONESIA PRE-DEPLOY SIMULATION"
echo "=============================================="
echo ""

cd "$(dirname "$0")/web"

# Step 1: Build Docker image locally with HTTPS build-args
log_info "Step 1: Building Docker image locally..."
docker build \
  --build-arg NEXT_PUBLIC_APP_URL=https://kilasindonesia.com \
  --build-arg NEXTAUTH_URL=https://kilasindonesia.com \
  -t kilasindonesia:predeploy \
  -f Dockerfile \
  . > /dev/null 2>&1

if [ $? -eq 0 ]; then
    log_pass "Docker image built successfully"
else
    log_fail "Docker image build failed"
    exit 1
fi

# Update compose file to use local image
sed -i 's|image: ghcr.io/zakiachsan/kilasindonesia:latest|image: kilasindonesia:predeploy|' docker-compose.local.yml

# Step 2: Start containers
log_info "Step 2: Starting containers..."
docker compose -f docker-compose.local.yml up -d --wait > /dev/null 2>&1

if [ $? -eq 0 ]; then
    log_pass "Containers started"
else
    log_fail "Failed to start containers"
    exit 1
fi

# Step 3: Wait for healthcheck
log_info "Step 3: Waiting for healthcheck to pass..."
MAX_RETRIES=30
RETRY=0
while [ $RETRY -lt $MAX_RETRIES ]; do
    STATUS=$(docker inspect --format='{{.State.Health.Status}}' kilasindonesia-app 2>/dev/null || echo "none")
    if [ "$STATUS" = "healthy" ]; then
        log_pass "Healthcheck passed"
        break
    fi
    echo -n "."
    sleep 2
    ((RETRY++))
    if [ $RETRY -eq $MAX_RETRIES ]; then
        echo ""
        log_fail "Healthcheck did not pass after $((MAX_RETRIES * 2)) seconds"
        docker logs kilasindonesia-app 2>&1 | tail -20
        exit 1
    fi
done
echo ""

# Give it a moment to stabilize
sleep 3

# Step 4: Verify health endpoint
log_info "Step 4: Testing /api/health endpoint..."
HEALTH=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/api/health" 2>/dev/null)
if [ "$HEALTH" = "200" ]; then
    log_pass "Health endpoint returns 200: $(curl -s ${APP_URL}/api/health)"
else
    log_fail "Health endpoint returned: $HEALTH (expected 200)"
fi

# Step 5: Check canonical URL is https
log_info "Step 5: Checking canonical URL uses https://..."
CANONICAL=$(curl -s "${APP_URL}/${ARTICLE_SLUG}" 2>/dev/null | grep -o 'rel="canonical" href="[^"]*"' | head -1)
if echo "$CANONICAL" | grep -q "https://"; then
    log_pass "Canonical URL uses https://: $CANONICAL"
else
    log_fail "Canonical URL does NOT use https://: $CANONICAL"
fi

# Step 6: Check news sitemap
log_info "Step 6: Checking /api/news-sitemap..."
NEWS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/api/news-sitemap" 2>/dev/null)
if [ "$NEWS_STATUS" = "200" ]; then
    log_pass "News sitemap returns 200"
else
    log_fail "News sitemap returned: $NEWS_STATUS (expected 200)"
fi

# Step 7: Check news sitemap URLs are https
log_info "Step 7: Checking news sitemap URLs use https://..."
NEWS_HTTP=$(curl -s "${APP_URL}/api/news-sitemap" 2>/dev/null | grep -o "http://kilasindonesia" | wc -l)
if [ "$NEWS_HTTP" -eq 0 ]; then
    log_pass "All news sitemap URLs use https://"
else
    log_fail "Found $NEWS_HTTP http:// URLs in news sitemap"
fi

# Step 8: Check sitemap.xml
log_info "Step 8: Checking /sitemap.xml..."
SITEMAP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/sitemap.xml" 2>/dev/null)
if [ "$SITEMAP_STATUS" = "200" ]; then
    log_pass "Sitemap.xml returns 200"
else
    log_fail "Sitemap.xml returned: $SITEMAP_STATUS (expected 200)"
fi

# Step 9: Check robots.txt
log_info "Step 9: Checking robots.txt includes news sitemap..."
ROBOTS=$(curl -s "${APP_URL}/robots.txt" 2>/dev/null)
if echo "$ROBOTS" | grep -q "news-sitemap\|news_sitemap\|sitemap-news"; then
    log_pass "robots.txt includes news sitemap reference"
else
    log_fail "robots.txt does not reference news sitemap"
fi

# Restore compose file
sed -i 's|image: kilasindonesia:predeploy|image: ghcr.io/zakiachsan/kilasindonesia:latest|' docker-compose.local.yml

# Summary
echo ""
echo "=============================================="
echo "  SIMULATION SUMMARY"
echo "=============================================="
echo ""
echo -e "Passed: ${GREEN}$PASS${NC}"
echo -e "Failed: ${RED}$FAIL${NC}"
echo ""

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}✓ ALL CHECKS PASSED — Safe to deploy to production!${NC}"
    echo ""
    exit 0
else
    echo -e "${RED}✗ SOME CHECKS FAILED — Fix issues before deploying!${NC}"
    echo ""
    exit 1
fi

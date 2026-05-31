#!/usr/bin/env bash
set -euo pipefail

# ── Configuración ─────────────────────────────────────────
DB_HOST="everflow-db.postgres.database.azure.com"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER="write_user"
export PGPASSWORD="yusKcra5swTod4$"
export PGSSLMODE="require"

BACKUP_DIR="/backups"
RATE_LIMIT="5m"
# ──────────────────────────────────────────────────────────

DATE=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.dump"
TMP_FILE="${OUTPUT_FILE}.tmp"

mkdir -p "$BACKUP_DIR"
echo "[$(date)] Iniciando backup → $OUTPUT_FILE"

nice -n 19 \
ionice -c2 -n7 \
pg_dump \
  --host="$DB_HOST" \
  --port="$DB_PORT" \
  --username="$DB_USER" \
  --dbname="$DB_NAME" \
  --format=custom \
  --compress=6 \
  --no-owner \
  --no-privileges \
  --lock-wait-timeout=10s \
  --serializable-deferrable \
  -v 2>>"$BACKUP_DIR/dump_${DATE}.log" \
| pv -L "$RATE_LIMIT" \
> "$TMP_FILE"

mv "$TMP_FILE" "$OUTPUT_FILE"

SIZE=$(du -sh "$OUTPUT_FILE" | cut -f1)
echo "[$(date)] Backup OK: $OUTPUT_FILE ($SIZE)"
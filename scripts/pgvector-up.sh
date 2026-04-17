#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/docker/docker-compose.pgvector.yml"
HOST="${PGVECTOR_BIND_HOST:-127.0.0.1}"
PORT="${PGVECTOR_PORT:-5432}"

echo "Starting pgvector stack on ${HOST}:${PORT}..."
docker compose -f "${COMPOSE_FILE}" up -d
docker compose -f "${COMPOSE_FILE}" ps
echo
echo "PostgreSQL is exposed on ${HOST}:${PORT}/tcp"
echo "Use ./scripts/pgvector-smoke.sh to verify the extension and vector queries"

#!/bin/sh
set -e

echo "Waiting for DB..."
sleep 5  # ← 遅延させる（DB接続待ち）

echo "Running database migrations..."
GOOSE_DBSTRING="$DB_USER:$DB_PASSWORD@tcp($DB_HOST:$DB_PORT)/$DB_NAME" \
 go run github.com/pressly/goose/v3/cmd/goose@latest -dir db/migrations up

echo "Starting app..."
./main
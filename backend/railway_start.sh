# backend/start.sh
#!/bin/sh

echo "Waiting for DB..."
sleep 5  # ← 遅延させる（DB接続待ち）

echo "Running database migrations..."
GOOSE_DBSTRING="$DB_USER:$DB_PASSWORD@tcp($DB_HOST:$DB_PORT)/$DB_NAME" \
  goose -dir db/migrations mysql up

echo "Starting app..."
/app/main

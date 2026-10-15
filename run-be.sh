#!/usr/bin/env bash
# ========================================================
# Script khởi chạy JobsNow Backend (Spring Boot)
# ========================================================

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

# 1. Load file .env nếu có
if [ -f "$DIR/.env" ]; then
  echo "==> Đang nạp biến môi trường từ .env..."
  set -a
  source "$DIR/.env"
  set +a
elif [ -f "$DIR/.env.example" ]; then
  echo "==> Chưa tìm thấy .env, đang nạp từ .env.example..."
  set -a
  source "$DIR/.env.example"
  set +a
fi

# 2. Xóa các tệp rác AppleDouble (._*) trong target nếu USB tạo ra
find . -type f -name '._*' -delete 2>/dev/null || true

# 3. Chạy Spring Boot với main class chỉ định rõ
echo "==> Đang khởi động Backend JobsNow trên cổng ${PORT:-8082}..."
./mvnw spring-boot:run -Dspring-boot.run.main-class=com.JobsNow.backend.JobsNowBackendApplication

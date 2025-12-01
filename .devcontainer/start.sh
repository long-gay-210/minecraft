#!/bin/bash
# start.sh - chạy khi Codespace khởi động

echo "Codespace đã khởi động!"

# Lấy thư mục gốc project (từ trong .dev đi ra)
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

SERVER_DIR="$ROOT_DIR/server"

# --- Chạy Playit background ---
if [ -f "$SERVER_DIR/playit" ]; then
    chmod +x "$SERVER_DIR/playit"
    nohup "$SERVER_DIR/playit" --secret 27b8c3d202823e43416721a8b026d78847f62426a54e14031fb2314d7d05bfcd > "$SERVER_DIR/playit.log" 2>&1 &
    echo "✅ Playit started in background."
else
    echo "⚠️ playit file không tồn tại!"
fi

# --- Chạy Minecraft server background ---
if [ -f "$SERVER_DIR/server.jar" ]; then
    cd "$SERVER_DIR"
    java -Xms4G -Xmx8G -jar server.jar nogui 
    echo "✅ Minecraft server started"
else
    echo "⚠️ server.jar không tồn tại!"
fi

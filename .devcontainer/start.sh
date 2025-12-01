#!/bin/bash
# start.sh - chạy khi Codespace khởi động

echo "Codespace đã khởi động!"

# --- Chạy Playit background ---
if [ -f ./playit ]; then
    nohup ./playit --secret 27b8c3d202823e43416721a8b026d78847f62426a54e14031fb2314d7d05bfcd > playit.log 2>&1 &
    echo "✅ Playit started in background."
else
    echo "⚠️ playit file không tồn tại!"
fi

# --- Chạy Minecraft server background ---
if [ -f ./server.jar ]; then
    java -Xms1G -Xmx6G -jar server.jar nogui 
    echo "✅ Minecraft server started"
else
    echo "⚠️ server.jar không tồn tại!"
fi

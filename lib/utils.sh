#!/bin/bash

CONFIG_DIR="$HOME/.config/mintshare"
CONFIG_FILE="$CONFIG_DIR/config"
STATE_FILE="$CONFIG_DIR/state"

mkdir -p "$CONFIG_DIR"

load_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        cat > "$CONFIG_FILE" <<EOF
PROXY_HOST=192.168.49.1
PROXY_PORT=8282
PROXY_SCHEME=http
EOF
    fi

    source "$CONFIG_FILE"

    PROXY="${PROXY_SCHEME}://${PROXY_HOST}:${PROXY_PORT}"
}

save_state() {
    echo "STATUS=$1" > "$STATE_FILE"
}

get_state() {
    if [ -f "$STATE_FILE" ]; then
        source "$STATE_FILE"
        echo "$STATUS"
    else
        echo "OFF"
    fi
}

info() {
    echo "[INFO] $1"
}

success() {
    echo "[OK] $1"
}

error() {
    echo "[ERROR] $1"
}

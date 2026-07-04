#!/bin/bash

source "$(dirname "$0")/utils.sh"

PROFILE="/etc/profile.d/netshare.sh"
APTCONF="/etc/apt/apt.conf.d/80proxy"

load_config

enable_proxy() {

cat <<EOF | sudo tee "$PROFILE" >/dev/null
export http_proxy=$PROXY
export https_proxy=$PROXY
export ftp_proxy=$PROXY
export all_proxy=$PROXY
export HTTP_PROXY=$PROXY
export HTTPS_PROXY=$PROXY
EOF

cat <<EOF | sudo tee "$APTCONF" >/dev/null
Acquire::http::Proxy "$PROXY";
Acquire::https::Proxy "$PROXY";
EOF

save_state ON

success "Environment proxy enabled."
success "APT proxy enabled."
success "MintShare is ON."
}

disable_proxy() {

sudo rm -f "$PROFILE"
sudo rm -f "$APTCONF"

git config --global --unset http.proxy 2>/dev/null
git config --global --unset https.proxy 2>/dev/null

save_state OFF

success "Environment proxy removed."
success "APT proxy removed."
success "MintShare is OFF."
}

case "$1" in
    on)
        enable_proxy
        ;;
    off)
        disable_proxy
        ;;
    toggle)
        if [ "$(get_state)" = "ON" ]; then
            disable_proxy
        else
            enable_proxy
        fi
        ;;
    *)
        echo "Usage: proxy.sh {on|off|toggle}"
        exit 1
        ;;
esac

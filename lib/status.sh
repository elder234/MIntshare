#!/bin/bash

source "$(dirname "$0")/utils.sh"

load_config

echo "========== MintShare =========="
echo

echo "State      : $(get_state)"
echo "Proxy      : $PROXY"
echo

if [ -f /etc/profile.d/netshare.sh ]; then
    echo "Environment : ON"
else
    echo "Environment : OFF"
fi

if [ -f /etc/apt/apt.conf.d/80proxy ]; then
    echo "APT         : ON"
else
    echo "APT         : OFF"
fi

if git config --global --get http.proxy >/dev/null; then
    echo "Git         : ON"
else
    echo "Git         : OFF"
fi

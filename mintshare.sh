#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"

case "$1" in
    on)
        bash "$SCRIPT_DIR/lib/proxy.sh" on
        ;;
    off)
        bash "$SCRIPT_DIR/lib/proxy.sh" off
        ;;
    toggle)
        bash "$SCRIPT_DIR/lib/proxy.sh" toggle
        ;;
    status)
        bash "$SCRIPT_DIR/lib/status.sh"
        ;;
    doctor)
        bash "$SCRIPT_DIR/lib/doctor.sh"
        ;;
    version)
        echo "MintShare v1.0-dev"
        ;;
    *)
        echo "MintShare"
        echo
        echo "Usage:"
        echo "  mintshare on"
        echo "  mintshare off"
        echo "  mintshare toggle"
        echo "  mintshare status"
        echo "  mintshare doctor"
        echo "  mintshare version"
        exit 1
        ;;
esac

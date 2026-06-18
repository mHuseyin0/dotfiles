#!/usr/bin/env bash

CONF_DIR="/etc/wireguard/rotate"   # directory with .conf files
STATE_FILE="/var/lib/wg-rotator/state"
INTERVAL=180                       # 3 minutes
LOG_TAG="wg-rotator"

mkdir -p "$(dirname "$STATE_FILE")"

mapfile -t CONFIGS < <(ls -1 "$CONF_DIR"/*.conf 2>/dev/null | sort)

if [ ${#CONFIGS[@]} -eq 0 ]; then
    echo "$LOG_TAG" "No WireGuard config files found in $CONF_DIR"
    exit 1
fi

if [ -f "$STATE_FILE" ]; then
    CURRENT_INDEX=$(cat "$STATE_FILE")
else
    CURRENT_INDEX=0
fi

while true; do
    CONFIG="${CONFIGS[$CURRENT_INDEX]}"
    IFACE=$(basename "$CONFIG" .conf)

    echo "$LOG_TAG" "Switching to $IFACE"

    # Bring down any active WireGuard interfaces
    for iface in $(wg show interfaces); do
        wg-quick down "$CONF_DIR"/"$iface".conf
    done

    # Bring up selected config
    wg-quick up "$CONFIG"

    echo "$CURRENT_INDEX" > "$STATE_FILE"

    CURRENT_INDEX=$(( (CURRENT_INDEX + 1) % ${#CONFIGS[@]} ))

    sleep "$INTERVAL"
done

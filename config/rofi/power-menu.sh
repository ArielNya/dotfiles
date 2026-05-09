#!/bin/bash
# ═══════════════════════════════════════════════════════════════
#  🔥 Meru Cozy — Rofi Power Menu
# ═══════════════════════════════════════════════════════════════

declare -A options=(
    ["⏻  Shutdown"]="systemctl poweroff"
    ["  Reboot"]="systemctl reboot"
    ["  Suspend"]="systemctl suspend"
    ["  Lock"]="hyprlock"
    ["󰗼  Logout"]="hyprctl dispatch exit"
)

# If an argument is passed, execute the corresponding command
if [ -n "$1" ]; then
    eval "${options[$1]}"
    exit 0
fi

# Otherwise, list the options
for key in "⏻  Shutdown" "  Reboot" "  Suspend" "  Lock" "󰗼  Logout"; do
    echo "$key"
done

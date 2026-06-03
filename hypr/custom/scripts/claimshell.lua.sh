#!/usr/bin/env bash

# --- CONFIGURATION ---
INTERNAL_DISPLAY="eDP-2"
NWG_CONFIG_FILE="$HOME/.config/hypr/monitors.conf"

ICON_LAPTOP="computer-laptop"
ICON_MONITOR="video-display"

apply_hypr_monitors() {
    local config_file="$1"

    [[ ! -f "$config_file" ]] && return 1

    while IFS= read -r line; do
        [[ -z "$line" || "$line" != monitor=* ]] && continue

        line=${line#monitor=}
        IFS=',' read -r name resolution position scale <<< "$line"

        hyprctl eval "
            hl.monitor({
                output = \"$name\",
                mode = \"$resolution\",
                position = \"$position\",
                scale = $scale
            })
        "
    done < "$config_file"
}

notify_user() {
    notify-send -u low -i "$3" "$1" "$2"
}

mode_close() {
    MONITORS_COUNT=$(hyprctl monitors all | grep -c "Monitor")

    # Disable laptop screen only if external monitor exists
    if [[ $MONITORS_COUNT -gt 1 ]]; then
        hyprctl eval "
            hl.monitor({
                output = \"$INTERNAL_DISPLAY\",
                disabled = true
            })
        "
    fi
}

mode_open() {
    # Re-enable laptop display
    hyprctl eval "
        hl.monitor({
            output = \"$INTERNAL_DISPLAY\",
            disabled = false
        })
    "

    # Reapply monitor layout
    apply_hypr_monitors "$NWG_CONFIG_FILE"
}

# --- LOGIC ---
case "$1" in
    close)
        mode_close
        notify_user \
            "Clamshell Mode" \
            "External monitor active. Laptop screen disabled." \
            "$ICON_MONITOR"
        ;;

    open)
        mode_open
        notify_user \
            "Laptop Mode" \
            "Laptop screen enabled." \
            "$ICON_LAPTOP"
        ;;

    check)
        if grep -q "open" /proc/acpi/button/lid/*/state; then
            mode_open
        else
            mode_close
        fi
        ;;

    *)
        echo "Usage: $0 [open|close|check]"
        exit 1
        ;;
esac

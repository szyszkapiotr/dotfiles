#!/usr/bin/env bash

# --- CONFIGURATION ---
# Change this to your internal monitor name (use 'hyprctl monitors' to find it)
INTERNAL_DISPLAY="eDP-2"
NWG_CONFIG_FILE="$HOME/.config/hypr/monitors.conf"

# Icons for notifications (ensure you have an icon theme installed)
ICON_LAPTOP="computer-laptop"
ICON_MONITOR="video-display"

apply_hypr_monitors() {
    local config_file="$1"

    if [[ ! -f "$config_file" ]]; then
        echo "Error: monitor config '$config_file' does not exist."
        return 1
    fi

    while IFS= read -r line; do
        [[ -z "$line" || "$line" != monitor=* ]] && continue

        line=${line#monitor=}
        IFS=',' read -r name resolution position scale <<< "$line"

        local monitor_arg="${name},${resolution},${position},${scale}"
        hyprctl keyword monitor "$monitor_arg"
    done < "$config_file"
}

# --- FUNCTIONS ---
notify_user() {
  # Change '-u low' to '-u normal' if you want popups to stay longer
  notify-send -u low -i "$3" "$1" "$2"
}

# --- MODES ---
mode_close() {
  # Only disable internal screen if an external monitor is connected
  MONITORS_COUNT=$(hyprctl monitors all | grep -c "Monitor")
  if [[ $MONITORS_COUNT -gt 1 ]]; then
    hyprctl keyword monitor "$INTERNAL_DISPLAY, disable"
  fi

}

mode_open() {
  # Force enable internal screen
  hyprctl keyword monitor "$INTERNAL_DISPLAY, preferred, auto, 1"

  apply_hypr_monitors "$NWG_CONFIG_FILE"
}

# --- LOGIC ---
if [[ "$1" == "close" ]]; then
  mode_close
  notify_user "Clamshell Mode" "External monitor active. Laptop screen disabled." "$ICON_MONITOR"

elif [[ "$1" == "open" ]]; then
  mode_open
  notify_user "Laptop Mode" "Laptop screen enabled." "$ICON_LAPTOP"

elif [[ "$1" == "check" ]]; then
  # Silent check for startup/reload to sync state
  if grep -q "open" /proc/acpi/button/lid/*/state; then
    mode_open
  else
    mode_close
  fi

else
  echo "Usage: $0 [open|close|check]"
  exit 1
fi

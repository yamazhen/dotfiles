#!/bin/bash

# Function to update the WiFi status
update_wifi() {
  wifi_status=$(networksetup -getairportpower en0 | awk '{print $4}')
  if [ "$wifi_status" = "Off" ]; then
    sketchybar --set wifi label="WIFI: OFF"
  else
    wifi_ssid=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')
    if [ "$wifi_ssid" = "You are not associated with an AirPort network." ]; then
      sketchybar --set wifi label="WIFI: DISCONNECTED"
    else
      sketchybar --set wifi label="WIFI: $wifi_ssid"
    fi
  fi
}

# Initial WiFi status update
update_wifi

# Monitor WiFi status changes
while true; do
  update_wifi
  sleep 10
done

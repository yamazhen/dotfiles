#!/bin/bash

# Function to update the battery label
update_battery() {
  battery_percentage=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  sketchybar --set battery label="| Battery: $battery_percentage%"
}

# Initial battery update
update_battery

# Monitor battery status changes
pmset -g batt | grep -Eo "Battery-0|AC Power" | while read -r line; do
  update_battery
done

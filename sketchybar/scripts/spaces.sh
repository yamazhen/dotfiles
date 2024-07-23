#!/bin/bash

# Get all spaces and the current active space
SPACES=$(yabai -m query --spaces)
ACTIVE_SPACE=$(yabai -m query --spaces --space | jq '.index')
APPS=$(yabai -m query --windows | jq -c '.[] | {app: .app, space: .space}')

# Debugging: Print out the retrieved values
echo "Active Space: $ACTIVE_SPACE"
echo "Spaces: $SPACES"
echo "Apps: $APPS"

# Generate a label with space number and a single app name
LABEL=""
for SPACE in $(echo "$SPACES" | jq -c '.[]'); do
  SPACE_NUMBER=$(echo "$SPACE" | jq '.index')
  FIRST_APP_NAME=$(echo "$APPS" | jq -r --argjson SPACE_NUMBER "$SPACE_NUMBER" 'select(.space == $SPACE_NUMBER) | .app' | head -n 1)
  
  # Debugging: Print out current space number and app name
  echo "Processing Space Number: $SPACE_NUMBER"
  echo "First App Name: $FIRST_APP_NAME"
  
  # Add a '*' if the space is the active space
  if [ "$SPACE_NUMBER" -eq "$ACTIVE_SPACE" ]; then
    LABEL+="$SPACE_NUMBER:[*$FIRST_APP_NAME] "
  else
    LABEL+="$SPACE_NUMBER:[$FIRST_APP_NAME] "
  fi
done

# Update the SketchyBar label
echo "Final Label: $LABEL"
sketchybar --set $NAME label="$LABEL"
sketchybar --set $NAME label="$LABEL"

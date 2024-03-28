#!/bin/bash

# Function to check for known WiFi connection
check_wifi() {
  connected_ip=$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}')
  if [[ -z "$connected_ip" ]]; then
    echo "No connected WiFi network found."
    return 1
  else
    echo "Connected to WiFi network: wlan0 (IP: $connected_ip)"
    return 0
  fi
}


# Function to run the wificonnect script
run_wificonnect() {
  echo "Starting wificonnect script..."
  # Replace 'path/to/wificonnect' with the actual path to your wificonnect script
  sudo /home/pi/MSM/tinkerboard/run/wifi-connect -s MixanichSmartMirror
  docker restart mm
  echo "wificonnect run script finished."
}

# Initial check
check_wifi

# Loop to monitor WiFi connection
while true; do
  # Check if WiFi disconnected
  if ! check_wifi; then
    run_wificonnect
  fi

  # Wait for 5 minutes before checking again
  sleep 900  # Change this to 900 seconds (15 minutes)
done

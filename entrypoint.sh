#!/bin/sh
if [ -f /config.ini ]; then
  CONFIG=/config.ini
  echo "Found: /config.ini"
else
  echo "Error: /config.ini doesn't exist"
  exit 1
fi

gns3server -A --config /config.ini

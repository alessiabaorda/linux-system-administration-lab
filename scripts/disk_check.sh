#!/bin/bash
USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$USAGE" -gt 80 ]; then
    echo "WARNING"
else
    echo "OK"
fi

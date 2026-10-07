#!/bin/bash

STATUS=0

# Disk usage
USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$USAGE" -gt 80 ]; then
    echo "DISK: WARNING ($USAGE%)"
    STATUS=1
else
    echo "DISK: OK ($USAGE%)"
fi

# Memory usage
MEMORY=$(free | awk 'NR==2 {printf "%.0f", ($2 - $7) / $2 * 100}')

if [ "$MEMORY" -gt 80 ]; then
    echo "MEMORY: WARNING (${MEMORY}%)"
    STATUS=1
else
    echo "MEMORY: OK (${MEMORY}%)"
fi

# Service status
SERVICE=$(systemctl is-active myapp)

if [ "$SERVICE" = "active" ]; then
    echo "SERVICE: OK ($SERVICE)"
else
    echo "SERVICE: CRITICAL ($SERVICE)"
    STATUS=2
fi

exit "$STATUS"

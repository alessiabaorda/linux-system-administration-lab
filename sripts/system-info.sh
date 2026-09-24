#!/bin/bash

# Linux System Information Script

echo "===== SYSTEM INFORMATION ====="

echo "Hostname:"
hostname

echo "Kernel version:"
uname -r

echo "System uptime:"
uptime -p

echo "Memory usage:"
free -h

echo "================================"

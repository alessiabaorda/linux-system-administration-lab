# Linux System Information Script

## Objective

Create a simple Bash script to display basic Linux system information.

## Information Collected

The script displays:

- Hostname
- Kernel version
- System uptime
- Memory usage

## Script

The script is available in:

`scripts/system-info.sh`

## How to Run

Make the script executable:

    chmod +x scripts/system-info.sh

Run the script:

    ./scripts/system-info.sh

## Commands Used

The script uses standard Linux commands:

- `hostname` — displays the system hostname
- `uname -r` — displays the kernel version
- `uptime -p` — displays system uptime
- `free -h` — displays memory usage in human-readable format

## Goal

Practice Bash scripting and automate the collection of basic Linux system information.

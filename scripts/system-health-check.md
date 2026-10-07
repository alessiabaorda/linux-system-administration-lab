# System Health Check

## Objective

Create a Bash script to perform a basic health check of a Linux system.

The script checks disk usage, memory usage, and the status of a systemd service.

## Checks

### Disk Usage

The script checks the usage of the root filesystem `/`.

If usage is above 80%, the script reports:

`DISK: WARNING`

Otherwise:

`DISK: OK`

### Memory Usage

The script calculates the percentage of memory currently used.

If memory usage is above 80%, the script reports:

`MEMORY: WARNING`

Otherwise:

`MEMORY: OK`

### Service Status

The script checks the status of the `myapp` systemd service.

If the service is active:

`SERVICE: OK`

If the service is inactive:

`SERVICE: CRITICAL`

## Exit Codes

The script uses standard exit codes:

- `0` — OK
- `1` — WARNING
- `2` — CRITICAL

## Troubleshooting

During development, the memory check initially produced an `integer expression expected` error because the calculated percentage contained decimal values.

The calculation was changed to return an integer value using `printf "%.0f"`.

## Script

The script is available at:

`scripts/system-health-check.sh`

## Execution

Run the script with:

```bash
./scripts/system-health-check.sh

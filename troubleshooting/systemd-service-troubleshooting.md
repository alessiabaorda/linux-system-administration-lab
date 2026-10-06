# Systemd Service Troubleshooting

## Scenario

A colleague reported that the `myapp` service was not running.

The task was to investigate the service status, check its logs and configuration, verify permissions, and confirm whether the service could run correctly.

## Objective

Determine why the `myapp` service was not running and verify that the service could operate correctly.

## Analysis

First, I checked the status of the service with `systemctl status`.

The service was loaded but inactive and not running.

I then checked the service logs using `journalctl -u myapp`, but there were no useful error messages.

Next, I checked the service configuration and verified that the service runs as the `myapp` user.

I checked the `myapp` user and its groups, then investigated the permissions of `/var/lib/myapp` and `data.db`.

The permissions allowed the `myapp` user to access and write to the existing data file, so no permission problem was identified.

## Commands Used

    systemctl status myapp
    journalctl -u myapp
    cat /etc/systemd/system/myapp.service
    id myapp
    ls -ld /var/lib/myapp
    ls -l /var/lib/myapp/data.db
    sudo systemctl start myapp

## Verification

After starting the service manually, I checked its status again.

The service was active and running.

I then checked `/var/lib/myapp/data.db` and confirmed that the service was successfully writing data to the file.

## Result

The `myapp` service was inactive when the investigation started.

After starting it manually, the service ran correctly and successfully wrote data to the application file.

No permission problem or specific error was identified during the investigation.

## What I Learned

I learned how to:

- Check the status of a systemd service
- View logs for a specific service
- Inspect a systemd service configuration
- Check the user running a service
- Verify directory and file permissions
- Start and verify a systemd service

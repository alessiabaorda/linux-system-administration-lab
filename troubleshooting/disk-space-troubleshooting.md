# Disk Space Troubleshooting

## Scenario

A colleague reported that a Linux server might be running out of disk space.

The task was to check the available disk space, check inode usage, and identify where disk space was being used.

## Objective

Investigate the filesystem and determine if the Linux system was running out of disk space or inodes.

## Analysis

First, I checked the filesystem usage with `df -h`.

Then, I checked inode usage with `df -i`.

The Linux root filesystem had very low disk usage, so the system was not running out of disk space.

I also used `du` to investigate directory sizes. The command scanned `/mnt/c`, which is a Windows filesystem mounted inside WSL, and produced several permission-related messages.

## Commands Used

```bash
df -h
df -i
sudo du -h -d 1 /
```

## Verification

The root filesystem showed approximately:

- 251 GB total space
- 1.9 GB used
- 237 GB available
- 1% usage

Inode usage was also approximately 1%.

The `/mnt/c` filesystem showed much higher usage, but this was the Windows C: drive mounted inside WSL and not the Linux root filesystem.

## Result

The Linux filesystem was not running out of disk space.

The investigation showed that the high disk usage was related to the Windows filesystem mounted at `/mnt/c`, not the Linux root filesystem.

## What I Learned

I learned the difference between:

- `df -h` for filesystem disk usage
- `df -i` for inode usage
- `du` for investigating directory and file sizes

I also learned that WSL can expose Windows filesystems under `/mnt/`, so it is important to identify which filesystem is actually being investigated.
```

# CPU Usage Investigation

## Scenario

A server is reported to be slow, with users experiencing high response times.

The objective is to investigate whether the problem is caused by high CPU usage, insufficient memory, disk space, or disk I/O.

## Investigation

### 1. CPU Usage

The `top` command was used to monitor running processes and identify processes consuming excessive CPU resources.

```bash
top
```

No process showed significant CPU consumption. The highest observed CPU usage was approximately 0.3%.

A batch CPU check was also performed:

```bash
top -b -n 3 -d 2 | grep -E "Cpu|%Cpu"
```

The CPU remained approximately 90–100% idle.

### 2. Memory Usage

Memory usage was checked with:

```bash
free -h
```

Observed values:

- Total memory: 1.8 GiB
- Used memory: 353 MiB
- Available memory: 1.5 GiB
- Swap used: 0 B

The system had sufficient available memory and was not using swap.

### 3. Disk Space

Filesystem usage was checked with:

```bash
df -h
```

The Linux root filesystem showed:

- Size: 251 GiB
- Used: 1.9 GiB
- Available: 237 GiB
- Usage: 1%

The Windows filesystem mounted at `/mnt/c` showed 86% usage, but the Linux root filesystem was not close to being full.

### 4. Disk I/O

Disk and system activity were investigated using:

```bash
vmstat 1 5
```

The results showed:

- `wa` (I/O wait): 0%
- `si` (swap in): 0
- `so` (swap out): 0
- CPU idle: approximately 100%

There was no significant indication of disk I/O contention or swapping.

## Conclusion

The investigation did not identify a CPU, memory, disk-space, or disk-I/O bottleneck at the time of testing.

The reported performance problem may therefore be intermittent or related to another component not captured during this investigation.

This scenario demonstrates a systematic approach to Linux performance troubleshooting by collecting evidence before identifying a root cause.

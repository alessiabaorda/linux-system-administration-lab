# VMware Network and Snapshot Lab

## Objective

Practice basic VMware Workstation operations with an Ubuntu Server virtual machine: inspect disk usage, compare NAT and Host-only networking, verify SSH access, and test a snapshot restore.

## Lab environment

- VMware Workstation
- Ubuntu Server 26.04.1 LTS
- Virtual machine resources: 2 GB RAM, 1 processor, 20 GB virtual disk
- Network adapter tested in NAT and Host-only modes

## NAT networking

With the network adapter set to NAT, the VM received the address `192.168.19.128/24` and used `192.168.19.2` as its default gateway.

The VM was reachable from the Windows host using SSH:

```powershell
ssh labuser@192.168.19.128
```

## Host-only networking

After changing the adapter to Host-only and rebooting the VM, it received the address `192.168.16.128/24`.

The route table showed the local `192.168.16.0/24` network and the host adapter at `192.168.16.1`, with no default route. This confirmed that Host-only networking provided communication within the private host network.

The adapter was then returned to NAT mode.

## Disk usage check

The `df -h` command showed:

- Root filesystem `/`: 9.8 GB total, 4.4 GB used, 4.9 GB available (48% used)
- `/boot`: 1.8 GB total, 73 MB used, 1.6 GB available (5% used)

No disk-space issue was found inside the VM.

## Snapshot test

An existing snapshot was present. A separate snapshot was created for this exercise.

To verify it, a temporary file named `snapshot-test.txt` was created in the user's home directory. After shutting down the VM and reverting to the new snapshot, the file was no longer present.

This confirmed that the snapshot restore returned the VM to the saved state.

## What I learned

- NAT gives the VM network access through the host and a default gateway.
- Host-only networking connects the VM to a private network with the host.
- `df -h` reports filesystem capacity and usage.
- VMware snapshots can restore a virtual machine to a previously saved state.

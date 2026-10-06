# Network Connectivity Investigation

## Scenario

A server is reported to have network connectivity problems.

The objective is to determine whether the issue is related to IP configuration, routing, gateway connectivity, Internet access, or DNS resolution.

## Investigation

### 1. Routing Table

The routing table was checked with:

```bash
ip r
```

The system showed:

```text
default via 172.30.16.1 dev eth0
172.30.16.0/20 dev eth0 src 172.30.24.55
```

This confirms that the system has an IP address on `eth0` and a default route through `172.30.16.1`.

### 2. Gateway Connectivity

The default gateway was tested with:

```bash
ping -c 4 172.30.16.1
```

The test returned 100% packet loss.

However, this result alone does not prove that the gateway is unreachable because the gateway may be configured not to respond to ICMP requests.

### 3. External IP Connectivity

Internet connectivity was tested using a public IP address:

```bash
ping -c 4 8.8.8.8
```

The test returned:

- 4 packets transmitted
- 4 packets received
- 0% packet loss
- Average latency: approximately 31 ms

This confirms that external IP connectivity was working.

### 4. DNS Resolution

DNS resolution was tested using:

```bash
ping -c 4 google.com
```

The hostname was successfully resolved to an IP address and all four packets were received.

This confirms that DNS resolution was functioning during the test.

### 5. DNS Configuration

The DNS configuration was inspected with:

```bash
resolvectl status
```

The configured DNS server was:

```text
172.30.16.1
```

The same address is used as the default gateway.

The `nslookup` command was also tested, but it was not installed on the system.

## Conclusion

The investigation did not identify an active network connectivity failure.

The routing table was correctly configured, external IP connectivity was working, and DNS resolution was successful.

Although the gateway did not respond to ICMP requests, this does not necessarily indicate a network failure because ICMP responses may be disabled.

The investigation demonstrates the importance of validating connectivity at multiple levels rather than relying on a single test.

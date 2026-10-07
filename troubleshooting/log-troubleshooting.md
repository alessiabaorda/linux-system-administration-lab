# Log Troubleshooting

## Scenario

A network-related error was reported in the Linux environment.

The objective was to investigate recent system errors and determine whether the problem was still present.

## Investigation

The first step was to check recent errors in the system journal:

```bash
journalctl -p err --since "1 hour ago"
```

The journal reported:

```text
WSL (106) ERROR: CheckConnection: getaddrinfo() failed: -3
```

A second error appeared shortly afterwards:

```text
WSL (106) ERROR: CheckConnection: getaddrinfo() failed: -5
```

The `getaddrinfo()` errors indicated a possible temporary problem related to hostname resolution or network connectivity.

## DNS Verification

DNS resolution was tested with:

```bash
getent hosts google.com
```

The command successfully returned IPv6 addresses for `google.com`.

This confirmed that DNS resolution was working at the time of the test.

## Connectivity Verification

Internet connectivity was then tested with:

```bash
ping -c 4 google.com
```

The test returned:

```text
4 packets transmitted, 4 received, 0% packet loss
```

The average response time was approximately 41 ms.

## Conclusion

The journal contained recent WSL network-related errors, but subsequent tests showed that DNS resolution and Internet connectivity were working correctly.

The issue therefore appeared to be temporary or intermittent rather than a persistent DNS or connectivity failure.

## Commands Used

- `journalctl -p err --since "1 hour ago"`
- `journalctl -p err --since "1 hour ago" --no-pager`
- `getent hosts google.com`
- `ping -c 4 google.com`

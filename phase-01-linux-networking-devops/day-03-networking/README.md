# Day 03 — Networking Fundamentals

## Objective

The objective of this module was to understand basic networking concepts and practice network troubleshooting using Linux networking tools.

---

## Topics Learned

- TCP/IP
- DNS
- Ports
- HTTP/S
- SSH
- Routing
- CIDR
- Firewall concepts

---

## Tools Used

- `ip`
- `ss`
- `dig`
- `curl`
- `traceroute`
- `nc`

---

## Commands

| Command | Purpose | Why I Used It |
|---|---|---|
| `ip addr` | Displays network interfaces and IP addresses | To inspect network configuration |
| `ip route` | Displays routing table | To understand packet routing |
| `ss -tuln` | Displays listening TCP/UDP ports | To identify available services |
| `dig` | Performs DNS queries | To troubleshoot DNS resolution |
| `curl` | Sends HTTP requests | To test web services |
| `traceroute` | Shows network path | To investigate connectivity |
| `nc` | Tests network connections | To test port connectivity |

---

## Practical Work

I practiced:

1. Inspecting the lab network
2. Identifying IP addresses
3. Inspecting routing information
4. Checking listening ports
5. Performing DNS queries
6. Testing HTTP connectivity
7. Testing network ports
8. Troubleshooting connectivity problems

---

## Command Examples

### Check IP Configuration

```bash
ip addr
```

---

### Check Routing Table

```bash
ip route
```

---

### Check Listening Ports

```bash
ss -tuln
```

---

### DNS Query

```bash
dig example.com
```

---

### HTTP Test

```bash
curl -I http://localhost
```

---

### Trace Network Path

```bash
traceroute example.com
```

---

### Test a Port

```bash
nc -vz localhost 80
```

---

## Troubleshooting Method

When a network connection failed, I followed:

```
Check IP
   ↓
Check Route
   ↓
Check DNS
   ↓
Check Port
   ↓
Check Service
   ↓
Check Firewall
   ↓
Verify Connection
```

---

## Practical Networking Observation

The purpose of the practical work was to understand how a client request moves through network configuration, routing, DNS, ports, and finally reaches a service.

---

## Security Learning

I learned that unnecessary listening ports can increase the attack surface of a system.

Therefore, services and network access should be exposed only when required.

---

## Evidence

Practical screenshots are stored in:

```
screenshots/
```

**Examples of evidence:**

- IP configuration
- Routing table
- Listening ports
- DNS query
- HTTP response
- Port connectivity test
- Network troubleshooting

---

## Key Learning

I learned how to inspect Linux network configuration, understand basic connectivity, identify listening services, perform DNS and HTTP tests, and troubleshoot basic network problems.

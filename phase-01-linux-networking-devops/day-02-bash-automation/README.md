# Day 02 — Bash & Automation

## Objective

The objective of this module was to learn Bash scripting fundamentals and use them to automate routine Linux administration and monitoring tasks.

---

## Topics Learned

- Variables
- Quoting
- Pipes
- Redirects
- Loops
- Functions
- Exit codes
- Error handling

---

## Tool Used

- Bash

---

## Concepts and Practical Purpose

| Concept | Purpose | Why I Used It |
|---|---|---|
| Variables | Store reusable values | To avoid repeating configuration values |
| Quoting | Control string interpretation | To handle values safely |
| Pipes `\|` | Pass output between commands | To combine commands |
| `>` | Redirect output | To save command output |
| `>>` | Append output | To maintain logs |
| Loops | Repeat operations | To automate repetitive tasks |
| Functions | Reuse logic | To organize scripts |
| Exit codes | Indicate success/failure | To support automation and monitoring |

---

## Practical Work

I practiced creating:

1. Backup script
2. Log-check script
3. Disk-usage check script
4. Service-health check script

I also practiced controlled failures and handled exit codes to understand how automation can detect problems.

---

## Example — Service Health Check

**Script**

```bash
#!/bin/bash

SERVICE="nginx"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running"
    exit 0
else
    echo "$SERVICE is not running"
    exit 1
fi
```

**Purpose**

This script checks whether the Nginx service is running.

**Why I Used It**

I used it to understand how Bash can automate basic service monitoring.

---

## Example — Disk Check

**Script**

```bash
#!/bin/bash

df -h
```

**Purpose**

This displays disk usage in a human-readable format.

---

## Example — Log Check

**Script**

```bash
#!/bin/bash

tail -n 20 /var/log/syslog
```

**Purpose**

This displays recent system log entries.

---

## Controlled Failure

In a controlled laboratory environment, I practiced creating a service failure and then used the health-check script to detect the failure.

The troubleshooting process was:

```
Stop Service
    ↓
Run Health Check
    ↓
Detect Failure
    ↓
Check Service Status
    ↓
Inspect Logs
    ↓
Restore Service
    ↓
Run Health Check Again
```

---

## Security Learning

I learned that automation should fail safely and provide useful information when something goes wrong.

Exit codes can be used by other automation tools to determine whether a command or task succeeded or failed.

---

## Evidence

**Screenshots**

```
screenshots/
```

**Scripts**

```
scripts/
```

---

## Key Learning

I learned how Bash can convert repetitive Linux administration tasks into reusable automation scripts.

I also learned the importance of error handling and exit codes for reliable automation.

 

 

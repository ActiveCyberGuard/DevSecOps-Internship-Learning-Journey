# Day 05 — DevOps Foundations

## Phase 1 Final Practical Project

## Secure Linux Web Host

---

## 1. Project Objective

The objective of this project is to integrate the Linux, Bash, networking, Nginx, SSH, monitoring, logging, troubleshooting, and basic DevOps concepts learned during Phase 1.

The project is implemented in a controlled laboratory environment.

---

## 2. DevOps Concepts Learned

- SDLC
- CI/CD concepts
- Infrastructure
- Immutable delivery concept
- Observability
- Security shift-left concept

---

## 3. Project Components

- Ubuntu/Linux server
- User and permission management
- SSH
- Networking
- Nginx
- Reverse proxy
- Bash health-check script
- Service monitoring
- Logs
- Troubleshooting
- Documentation

---

## 4. Architecture

```text
                Client
                  |
                  | HTTP/HTTPS
                  v
              +--------+
              | Nginx  |
              +--------+
                  |
                  | Reverse Proxy
                  v
          +----------------+
          | Local Backend  |
          |    Service     |
          +----------------+

Administration
      |
      | SSH
      v
+-------------------+
| Linux Server      |
|                   |
| Users/Permissions |
| Services          |
| Logs              |
| Monitoring        |
+-------------------+
```

---

## 5. Implementation Plan

### Step 1 — Prepare Linux Server

Set up an Ubuntu/Linux laboratory server.

---

### Step 2 — User and Permission Management

Create the required laboratory user accounts and practice least-privilege access.

---

### Step 3 — Network Configuration

Inspect the server IP address and routing configuration.

```bash
ip addr
ip route
```

---

### Step 4 — SSH

Use SSH for remote administration in the controlled laboratory environment.

---

### Step 5 — Install Nginx

```bash
sudo apt update
sudo apt install nginx
```

---

### Step 6 — Verify Nginx

```bash
sudo systemctl status nginx
```

---

### Step 7 — Validate Configuration

```bash
sudo nginx -t
```

---

### Step 8 — Deploy Static Web Content

Deploy a simple non-confidential static web page.

---

### Step 9 — Configure Reverse Proxy

Configure Nginx to forward requests to a local application service.

---

### Step 10 — Test HTTP

```bash
curl -I http://localhost
```

---

### Step 11 — Monitor Logs

```bash
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

---

### Step 12 — Create Health Check

Create a Bash script that verifies the Nginx service.

**Example**

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

---

## 6. Controlled Failure Exercise

In the laboratory environment, the Nginx service can be stopped intentionally to simulate a service failure.

```
Running Service
      ↓
Controlled Failure
      ↓
Health Check
      ↓
Detect Failure
      ↓
Check Service Status
      ↓
Inspect Logs
      ↓
Restore Service
      ↓
Verify
```

**Example**

```bash
sudo systemctl stop nginx
```

Run the health-check script.

Then investigate:

```bash
systemctl status nginx
```

Restore:

```bash
sudo systemctl start nginx
```

Verify again.

---

## 7. Troubleshooting

Detailed troubleshooting notes are maintained in:

```
troubleshooting.md
```

---

## 8. Evidence

**Screenshots** are stored in:

```
screenshots/
```

**Configuration files**

```
configs/
```

**Scripts**

```
scripts/
```

**Architecture materials**

```
architecture/
```

---

## 9. Security Considerations

This project is performed in a controlled laboratory environment.

No production credentials, confidential organizational information, customer data, or sensitive banking configuration is included.

The project demonstrates:

- Least privilege
- Controlled SSH access
- Service monitoring
- Log inspection
- Configuration validation
- Basic security awareness

---

## 10. Final Learning Outcome

This project helped me integrate the concepts learned throughout Phase 1 into one practical Linux web-server environment.

I practiced Linux administration, networking, Bash automation, Nginx, reverse proxy, SSH, monitoring, logging, troubleshooting, and basic DevOps concepts.

---

## 11. Phase 1 Completion

```
Linux
  +
Bash
  +
Networking
  +
Nginx
  +
SSH
  +
Monitoring
  +
Troubleshooting
  =
Secure Linux Web Host
```

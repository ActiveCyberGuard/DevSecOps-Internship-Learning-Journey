# Day 04 — Web/Server Fundamentals

## Objective

The objective of this module was to understand the HTTP request/response lifecycle and learn how Nginx works as a web server and reverse proxy.

---

## Topics Learned

- HTTP lifecycle
- Reverse proxy
- TLS basics
- Nginx
- Access logs
- Error logs

---

## Tools Used

- Nginx
- curl

---

## Commands

| Command | Purpose | Why I Used It |
|---|---|---|
| `nginx -t` | Tests Nginx configuration | To detect configuration errors |
| `systemctl status nginx` | Checks Nginx status | To verify service availability |
| `systemctl restart nginx` | Restarts Nginx | To apply configuration changes |
| `curl` | Sends HTTP requests | To test the web service |

---

## Practical Work

I practiced:

1. Installing Nginx
2. Starting and checking Nginx
3. Hosting a static application
4. Testing HTTP requests
5. Configuring a reverse proxy to a local service
6. Inspecting access logs
7. Inspecting error logs
8. Troubleshooting configuration issues

---

## Install Nginx

```bash
sudo apt update
sudo apt install nginx
```

---

## Check Nginx

```bash
sudo systemctl status nginx
```

---

## Validate Configuration

```bash
sudo nginx -t
```

**Purpose**

Checks whether the Nginx configuration is syntactically valid.

**Why I Used It**

I used this command before restarting Nginx to reduce the risk of applying an invalid configuration.

---

## Test HTTP

```bash
curl -I http://localhost
```

**Purpose**

Sends an HTTP request to the local Nginx server.

**Why I Used It**

I used it to verify that the web server responds correctly.

---

## Access Logs

```bash
sudo tail -f /var/log/nginx/access.log
```

**Purpose**

Displays incoming HTTP request logs.

---

## Error Logs

```bash
sudo tail -f /var/log/nginx/error.log
```

**Purpose**

Displays Nginx error information.

---

## Reverse Proxy Concept

```
Client
  |
  | HTTP Request
  v
Nginx
  |
  | Forward Request
  v
Local Application
```

Nginx receives the client request and forwards it to the backend/local service.

---

## Troubleshooting

A basic troubleshooting process was:

```
Configuration
     ↓
nginx -t
     ↓
Service Status
     ↓
HTTP Test
     ↓
Access Logs
     ↓
Error Logs
     ↓
Fix
     ↓
Retest
```

---

## Security Learning

I learned that configuration validation, controlled service exposure, log monitoring, and proper reverse-proxy configuration are important parts of operating a web server.

---

## Evidence

**Screenshots**

```
screenshots/
```

**Safe laboratory configuration files**

```
configs/
```

> Only non-confidential laboratory configuration should be uploaded.

---

## Key Learning

I learned how Nginx operates as a web server and reverse proxy and how HTTP testing and logs can be used for verification and troubleshooting.

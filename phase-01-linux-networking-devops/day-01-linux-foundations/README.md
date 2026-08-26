# Day 01 — Linux Foundations

## 1. Objective

The objective of this module was to develop a practical understanding of Linux system fundamentals, including the Linux filesystem, processes, users and groups, file ownership, file permissions, services, and package management.

The main focus was to understand how a Linux system is organized and how administrators manage files, users, processes, services, and software packages.

---

## 2. Topics Learned

During this module, I learned the following topics:

- Linux filesystem
- Users and groups
- File ownership
- File permissions
- Processes
- Services
- Package management
- Least-privilege concept

---

## 3. Commands and Their Purpose

| Command | Purpose | Why I Used It |
|---|---|---|
| `pwd` | Displays the current working directory | To identify my current location in the filesystem |
| `ls` | Lists files and directories | To inspect the contents of a directory |
| `cd` | Changes the current directory | To navigate through the Linux filesystem |
| `mkdir` | Creates a new directory | To organize files and laboratory resources |
| `whoami` | Displays the current username | To identify the currently active user |
| `id` | Displays user ID and group information | To understand user and group membership |
| `chmod` | Changes file or directory permissions | To control access to files and directories |
| `chown` | Changes file or directory ownership | To manage ownership of system resources |
| `ps` | Displays running processes | To inspect currently running processes |
| `top` | Provides real-time process monitoring | To observe CPU, memory, and process activity |
| `systemctl` | Manages system services | To check and manage services |
| `journalctl` | Displays system and service logs | To investigate service activity and troubleshooting information |
| `apt` | Manages software packages | To install, update, and manage software packages |

---

## 4. Practical Learning

I practiced the following Linux administration activities in a controlled laboratory environment:

1. Navigating the Linux filesystem
2. Creating directories
3. Identifying the current user
4. Inspecting user and group information
5. Managing file permissions
6. Managing file ownership
7. Inspecting running processes
8. Monitoring system activity
9. Checking system services
10. Inspecting system and service logs
11. Understanding package management
12. Applying basic least-privilege principles

---

## 5. Command Demonstrations

### 5.1 Check Current Working Directory

**Command**

```bash
pwd
```

**Purpose**

Displays the current working directory.

---

### 5.2 List Files

**Command**

```bash
ls -la
```

**Purpose**

Displays files and directories, including hidden files, with detailed information.

**Why I Used It**

I used it to inspect filesystem contents and file metadata.

---

### 5.3 Navigate the Filesystem

**Command**

```bash
cd /etc
```

**Purpose**

Changes the current working directory.

**Why I Used It**

I used it to navigate through the Linux filesystem.

---

### 5.4 Create a Directory

**Command**

```bash
mkdir linux-lab
```

**Purpose**

Creates a new directory.

**Why I Used It**

I used it to organize laboratory resources.

---

### 5.5 Check Current User

**Command**

```bash
whoami
```

**Purpose**

Displays the currently logged-in username.

**Why I Used It**

I used it to verify which Linux account was active.

---

### 5.6 Check User and Groups

**Command**

```bash
id
```

**Purpose**

Displays the UID, GID, and group membership of the current user.

**Why I Used It**

I used it to understand Linux identity and group-based access control.

---

### 5.7 Inspect Permissions

**Command**

```bash
ls -l
```

**Purpose**

Displays file permissions, ownership, and other file information.

**Why I Used It**

I used it to inspect who can read, write, or execute files.

---

### 5.8 Change Permissions

**Command**

```bash
chmod 600 secret.txt
```

**Purpose**

Restricts the file so that only the owner has read and write access.

**Why I Used It**

I used it to practice Linux access control and understand the importance of restricting sensitive files.

---

### 5.9 Change Ownership

**Command**

```bash
sudo chown username:username notes.txt
```

**Purpose**

Changes the owner and group of a file.

**Why I Used It**

I used it to practice Linux file ownership management.

> **Note:** Replace `username` with the actual username used in the laboratory environment.

---

### 5.10 Inspect Processes

**Command**

```bash
ps
```

**Purpose**

Displays running processes.

**Why I Used It**

I used it to inspect active processes in the Linux system.

---

### 5.11 Monitor Processes

**Command**

```bash
top
```

**Purpose**

Provides real-time information about processes and system resources.

**Why I Used It**

I used it to observe CPU usage, memory usage, and process activity.

> Press `q` to exit.

---

### 5.12 Check a Service

**Command**

```bash
systemctl status nginx
```

**Purpose**

Displays the current status of the Nginx service.

**Why I Used It**

I used it to understand how Linux services are monitored and managed.

---

### 5.13 Inspect Logs

**Command**

```bash
journalctl
```

**Purpose**

Displays system journal logs.

**Why I Used It**

I used it to understand how system logs can be used for troubleshooting.

---

### 5.14 Check Logs for a Specific Service

**Command**

```bash
sudo journalctl -u nginx
```

**Purpose**

Displays logs related to the Nginx service.

---

### 5.15 Package Management

**Command**

```bash
sudo apt update
```

**Purpose**

Updates the local package index.

**Command**

```bash
sudo apt install nginx
```

**Purpose**

Installs the Nginx package.

**Why I Used It**

I used the package manager to install and maintain software on the Linux system.

---

## 6. Security Learning

This module introduced the relationship between Linux system administration and security.

I learned that:

- Users should receive only the permissions they require.
- File ownership controls resource ownership.
- File permissions control access to resources.
- Groups simplify access management.
- Administrative privileges should be used carefully.
- The principle of least privilege reduces unnecessary access.

---

## 7. Troubleshooting Approach

I practiced the following basic troubleshooting workflow:

```
Identify Problem
↓
Check System State
↓
Check Permissions
↓
Check Processes
↓
Check Service
↓
Check Logs
↓
Apply Fix
↓
Verify Result
```

---

## 8. Evidence

Practical screenshots are stored in:

```
screenshots/
```

**Planned Evidence**

- Linux filesystem navigation
- User identity verification
- User and group information
- File permissions
- File ownership
- Process monitoring
- Service status
- System logs
- Package management

> Screenshots will be added after completing the corresponding practical exercises.

---

## 9. Key Learning

After completing Day 01, I developed a practical foundation in Linux system administration.

I learned how to navigate the filesystem, identify users and groups, manage permissions and ownership, inspect processes, manage services, inspect logs, and use the package manager.

I also learned why the principle of least privilege is important for maintaining a secure Linux environment.

# Day 01 — Linux Foundations

## Objective

To understand Linux filesystem, processes, users and groups,
file permissions, services, and package management.

---

# Topics Learned

- Linux filesystem
- Users and groups
- File ownership
- File permissions
- Processes
- Services
- Package management
- Least-privilege concept

---

# Commands

| Command | Purpose | Why I Used It |
|---|---|---|
| `pwd` | Shows current directory | To identify my current location |
| `ls` | Lists files/directories | To inspect filesystem contents |
| `cd` | Changes directory | To navigate the filesystem |
| `mkdir` | Creates a directory | To organize lab files |
| `whoami` | Shows current user | To identify the active account |
| `id` | Shows user/group information | To inspect identity and groups |
| `chmod` | Changes permissions | To control file access |
| `chown` | Changes ownership | To manage ownership |
| `ps` | Shows processes | To inspect running processes |
| `top` | Monitors processes | To observe system activity |
| `systemctl` | Manages services | To check/manage services |
| `journalctl` | Displays logs | To investigate service events |
| `apt` | Package management | To install/update packages |

---

# Practical Work

During this module I practiced:

- Linux filesystem navigation
- User and group management
- File ownership
- File permissions
- Process monitoring
- Service management
- Package management

---

# Example Commands

## Check Current User

```bash
whoami
This command identifies the currently active Linux user.
This command identifies the currently active Linux user.

# Check User and Group Information
id

# This command displays user ID and group information.

# Check File Permissions
ls -l

# This helps inspect file ownership and permissions.

# Change Permissions
chmod 600 secret.txt

This restricts access to the file owner.

# Check Running Processes
ps

or:

top
# Check a Service
systemctl status nginx

# Check Logs
journalctl

## Security Learning

I learned how Linux permissions, ownership, user accounts,
groups, and least-privilege principles help control access
to system resources.

# Evidence

Screenshots:

screenshots/

# Key Learning

I learned how to perform basic Linux administration and
inspect system users, permissions, processes, services,
and logs.

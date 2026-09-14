# Day 23 — IAM & Least Privilege

## 📚 What I Learned

* IAM fundamentals
* Users and groups
* Roles and policies
* Access permissions
* Allowed vs denied actions
* Least Privilege Principle
* Linux users/groups as a local IAM concept
* File ownership and permissions

## 🛠️ Tools Used

* Ubuntu Server
* Linux User Management
* Linux File Permissions
* AWS IAM concepts
* JSON

## 💻 Commands Used

| Command                                | Purpose                             |
| -------------------------------------- | ----------------------------------- |
| `sudo adduser developer`               | Create a new Linux user             |
| `sudo addgroup appteam`                | Create a new group                  |
| `sudo usermod -aG appteam developer`   | Add user to group                   |
| `groups developer`                     | Check user's group membership       |
| `mkdir project`                        | Create a project/resource directory |
| `chmod 750 project`                    | Apply restricted file permissions   |
| `sudo chown developer:appteam project` | Set owner and group                 |
| `ls -ld project`                       | Verify ownership and permissions    |

## 🔐 IAM Policy Practice

Created a sample IAM policy demonstrating:

* `s3:ListBucket`
* `s3:GetObject`

The policy intentionally does not provide unnecessary permissions such as delete or administrative access.

## 🔑 Key Takeaways

* Learned how IAM controls access to resources.
* Understood the Least Privilege Principle.
* Practiced Linux users, groups and permissions.
* Learned how permissions can be designed around required actions only.
* Understood the difference between allowed and denied actions.

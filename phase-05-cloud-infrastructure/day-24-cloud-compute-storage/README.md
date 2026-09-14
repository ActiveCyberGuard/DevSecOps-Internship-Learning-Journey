# Day 24 — Cloud Compute & Storage

## 📚 What I Learned

* Compute workload lifecycle
* VM/compute environment concepts
* Starting and stopping workloads
* Docker-based workload deployment
* Storage and application data
* Backup creation
* Backup verification
* Data loss simulation
* Data restoration and recovery
* Importance of testing backup/restore procedures

## 🛠️ Tools Used

* Ubuntu Server
* Docker
* Nginx
* Linux CLI
* `tar`
* File system utilities

## 💻 Commands Used

### System / Compute

| Command    | Purpose                                  |
| ---------- | ---------------------------------------- |
| `hostname` | Check system hostname                    |
| `uname -a` | View system/kernel information           |
| `uptime`   | Check system uptime and load information |

### Workload Lifecycle

| Command                                          | Purpose                             |
| ------------------------------------------------ | ----------------------------------- |
| `docker run -d --name compute-demo nginx:alpine` | Create and run an Nginx workload    |
| `docker ps`                                      | View running containers             |
| `docker stop compute-demo`                       | Stop the workload                   |
| `docker ps -a`                                   | View running and stopped containers |
| `docker start compute-demo`                      | Start the stopped workload          |
| `docker logs compute-demo`                       | Check workload/container logs       |

### Storage & Backup

| Command                                                 | Purpose                        |
| ------------------------------------------------------- | ------------------------------ |
| `mkdir -p labs/test-data`                               | Create test data directory     |
| `echo "DevSecOps backup test" > labs/test-data/app.txt` | Create sample application data |
| `cat labs/test-data/app.txt`                            | Verify stored data             |
| `tar -czf backup.tar.gz labs/test-data/`                | Create compressed backup       |
| `ls -lh backup.tar.gz`                                  | Verify backup file and size    |
| `tar -tzf backup.tar.gz`                                | Inspect backup contents        |
| `rm -rf labs/test-data`                                 | Simulate data loss             |
| `tar -xzf backup.tar.gz`                                | Restore data from backup       |
| `cat labs/test-data/app.txt`                            | Verify restored data           |

## 🔄 Recovery Workflow

```text
Create Data
    ↓
Create Backup
    ↓
Verify Backup
    ↓
Simulate Data Loss
    ↓
Restore Backup
    ↓
Verify Recovery
```

## 🔑 Key Takeaways

* Learned the basic compute/workload lifecycle.
* Practiced deploying and managing a containerized workload.
* Learned how to create and verify backups.
* Simulated data loss safely.
* Restored deleted data from a backup.
* Understood that backup is only useful when restoration is tested.

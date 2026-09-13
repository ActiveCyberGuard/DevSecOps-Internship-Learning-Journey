# Day 24 — Cloud Compute and Storage 💾

## 📌 Objective

The objective of this module was to understand cloud compute, storage, configuration, backup and recovery concepts.

## 📚 Topics Covered

- Virtual Machines
- EC2 Concepts
- Compute Lifecycle
- Object Storage
- S3 Concepts
- Configuration and Secrets
- Backup
- Restore
- Recovery

## 🔄 Compute Lifecycle

```text
Launch
   ↓
Running
   ↓
Stop
   ↓
Start
   ↓
Terminate
```

## 🖥️ EC2

Amazon EC2 provides virtual machine compute capacity in AWS.

The lifecycle of a virtual machine should be managed carefully to avoid unnecessary resource usage and cost.

## 📦 Object Storage

Object storage is designed for storing objects such as:

- Application files
- Build artifacts
- Backups
- Static assets

Amazon S3 is an example of object storage.

## 🧪 Backup and Restore Lab

A local backup and restore lab was performed to demonstrate basic recovery.

### 1. Create Test Data

```bash
mkdir -p labs/test-data
echo "DevSecOps backup test" > labs/test-data/app.txt
```

### 2. Create Backup

```bash
tar -czf backup.tar.gz labs/test-data/
```

### 3. Verify Backup

```bash
tar -tzf backup.tar.gz
```

### 4. Remove Original Data

```bash
rm -rf labs/test-data
```

### 5. Restore Data

```bash
tar -xzf backup.tar.gz
```

### 6. Verify Restoration

```bash
cat labs/test-data/app.txt
```

### ✅ Recovery Result

The test data was successfully restored from the backup archive.

## 🛡️ Security Considerations

- Protect backup data.
- Restrict backup access.
- Never store secrets in Git.
- Test restoration regularly.
- Remove unnecessary cloud resources.

## 🧾 Evidence

Screenshots include:

- Compute resource
- Storage resource
- Test data
- Backup creation
- Data deletion
- Successful restoration

> Screenshots are stored in the [`screenshots/`](./screenshots) directory.

## 🎯 Outcome

Learned basic cloud compute and storage concepts and demonstrated a working backup and restore procedure.

 
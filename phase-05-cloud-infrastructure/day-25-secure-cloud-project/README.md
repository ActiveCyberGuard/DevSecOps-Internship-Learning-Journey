# Day 25 — Secure Cloud Reference Architecture 🏛️

## 📌 Objective

The objective of this project was to design a secure cloud reference architecture using cloud networking, IAM, logging, backup and cost-control principles.

## 🧭 Project Overview

The architecture represents a secure web application environment with separate public, private application and private database layers.

## 🏗️ Architecture

```text
                         INTERNET
                             |
                             v
                    +----------------+
                    | Internet       |
                    | Gateway        |
                    +-------+--------+
                            |
                            v
                    +---------------+
                    | PUBLIC SUBNET |
                    | Reverse Proxy |
                    +-------+-------+
                            |
                            v
                    +----------------+
                    | PRIVATE SUBNET |
                    | Application    |
                    +-------+--------+
                            |
                            v
                    +----------------+
                    | PRIVATE DB     |
                    | SUBNET         |
                    | Database       |
                    +----------------+
```

## 🌐 Network Security

The architecture separates internet-facing resources from internal application and database resources.

- Only the required public-facing component should be exposed to the internet.
- The application and database tiers are placed behind private network boundaries.

## 🔑 IAM

IAM is used to control access to cloud resources. The architecture follows the principle of least privilege.

Permissions should be limited to:

- Required actions
- Required resources
- Required identities

> Real credentials are not stored in the repository.

## 📊 Logging

Application and infrastructure logs should be collected for:

- Troubleshooting
- Operational monitoring
- Security investigation

## 💾 Backup

Important data should be backed up and restore procedures should be tested.

The backup strategy includes:

- Protected backup storage
- Restricted access
- Documented restore procedure
- Regular restore testing

## 💰 Cost Controls

The architecture includes basic cost-management practices:

- Stop unused compute resources.
- Delete temporary resources.
- Monitor resource usage.
- Configure budgets or alerts where available.
- Prefer local labs when cloud resources are unnecessary.

## ⚠️ Threat Considerations

Potential risks include:

1. Overly permissive IAM permissions
2. Publicly exposed application services
3. Public database access
4. Unrestricted network traffic
5. Unprotected backup storage
6. Unnecessary cloud resources

## 🛡️ Mitigations

| Risk | Mitigation |
|---|---|
| IAM Risk | Use least-privilege roles and policies. |
| Network Risk | Separate public and private tiers. |
| Database Exposure | Keep database resources inside private network boundaries. |
| Backup Risk | Restrict backup access and test restoration. |
| Cost Risk | Monitor and clean up unused resources. |

## ⚖️ Security Principles

The architecture follows:

- Least Privilege
- Least Exposure
- Network Segmentation
- Credential Protection
- Backup and Recovery
- Cost Awareness

## 🧾 Evidence

The following evidence was collected:

- Architecture diagram
- IAM security controls
- Network boundaries
- Logging design
- Backup strategy
- Cost-control strategy

> Screenshots are stored in the [`screenshots/`](./screenshots) directory.

## 🗂️ Files

```text
architecture/
├── architecture.md
└── architecture-diagram.md

security/
└── security-controls.md

backup/
└── backup-restore-plan.md

cost/
└── cost-controls.md
```

## 🎯 Outcome

Designed a secure cloud reference architecture that separates public and private workloads and applies IAM, network security, logging, backup and cost-control principles.

This project demonstrates understanding of secure cloud architecture and least-exposure infrastructure design.

---

 
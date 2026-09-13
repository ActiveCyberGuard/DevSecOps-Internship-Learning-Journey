# Day 21 — Cloud Fundamentals ☁️

## 📌 Objective

The objective of this module was to develop a practical understanding of fundamental cloud computing concepts and map common infrastructure components to AWS services.

## 📚 Topics Covered

- Cloud Computing
- IaaS, PaaS and SaaS
- AWS Regions
- Availability Zones
- Compute
- Storage
- Networking
- Identity and Access Management (IAM)
- Shared Responsibility Model
- Cloud Cost Awareness

## ☁️ Cloud Service Models

### IaaS (Infrastructure as a Service)
Provides virtualized infrastructure such as compute, storage and networking.

### PaaS (Platform as a Service)
Provides a managed platform for running applications without managing the underlying infrastructure directly.

### SaaS (Software as a Service)
Provides complete software applications through a service model.

## 🗺️ AWS Core Concepts

| Infrastructure Concept | AWS Example |
|---|---|
| Compute | EC2 |
| Object Storage | S3 |
| Networking | VPC |
| Identity | IAM |
| Monitoring | CloudWatch |

## 🌍 Region

An AWS Region is a geographical area containing multiple Availability Zones.

## 🏢 Availability Zone

An Availability Zone is an isolated location within an AWS Region that provides infrastructure for workloads.

## 🔐 Shared Responsibility Model

Cloud security responsibilities are divided between the cloud provider and the customer.

- **Provider** — responsible for the security *of* the cloud.
- **Customer** — responsible for the security *in* the cloud, i.e. the resources and configurations they control.

## 💻 Practical Commands

```bash
aws --version
aws sts get-caller-identity
aws configure get region
```

## 🛡️ Security Practices

- Never commit AWS credentials to Git.
- Use least-privilege permissions.
- Avoid unnecessary cloud resources.
- Review cloud costs regularly.
- Prefer local labs when a cloud resource is not required.

## 🧩 Troubleshooting

### Problem
The AWS CLI could not identify the configured credentials.

### Diagnosis
Checked the AWS CLI configuration and identity.

### Verification
```bash
aws sts get-caller-identity
```

### Result
The AWS identity was verified successfully after correcting the CLI configuration.

### Evidence
The following evidence was collected:

- AWS CLI version
- AWS identity verification
- AWS region configuration

> Screenshots are stored in the [`screenshots/`](./screenshots) directory.

## 🎯 Outcome

Developed a basic understanding of cloud architecture and learned how common infrastructure concepts map to AWS services.



 
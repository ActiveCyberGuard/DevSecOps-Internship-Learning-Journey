# Day 23 — Identity and Access Management 🔑

## 📌 Objective

The objective of this module was to understand cloud identity, roles, policies and least-privilege access control.

## 📚 Topics Covered

- IAM Users
- IAM Roles
- IAM Policies
- Permissions
- Temporary Credentials
- Least Privilege
- Allow and Deny
- Resource-level Permissions

## 🧩 IAM Model

```text
Identity
   |
   v
Policy
   |
   v
Permission
   |
   v
AWS Resource
```

## 👤 IAM User

An IAM user represents an identity that can interact with AWS resources according to assigned permissions.

## 🎭 IAM Role

An IAM role provides permissions that can be assumed by trusted identities or services.

Roles are useful for workload access without embedding long-lived credentials inside applications.

## 📜 IAM Policy

A policy defines which actions are allowed or denied on specific resources.

## ⚖️ Least Privilege

Least privilege means providing only the permissions required to perform a specific task.

### Example

A deployment workload may only require permission to read deployment artifacts from a specific storage location.

Instead of:

```json
"Allow *"
```

the policy should grant only the required actions and resources.

### Example Policy

The [`policies/deployment-policy.json`](./policies/deployment-policy.json) file contains an example policy for reading deployment artifacts.

## 🛡️ Security Principles

- Grant only required permissions.
- Avoid wildcard permissions when possible.
- Prefer roles for workloads.
- Avoid long-lived credentials.
- Never commit real credentials.
- Review permissions regularly.

## 🔍 Permission Review

For every permission evaluated:

1. Who needs access?
2. What action is required?
3. Which resource is required?
4. Why is the permission required?

## 🧾 Evidence

Screenshots include:

- IAM overview
- Role configuration
- Policy configuration
- Permission details
- Access testing

> Screenshots are stored in the [`screenshots/`](./screenshots) directory.

## 🎯 Outcome

Learned how IAM policies and roles can be used to implement least-privilege access control for cloud workloads.

 

 
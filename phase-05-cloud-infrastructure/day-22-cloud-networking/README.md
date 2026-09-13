# Day 22 — Cloud Networking 🌐

## 📌 Objective

The objective of this module was to understand cloud networking concepts and design a least-exposure network architecture.

## 📚 Topics Covered

- VPC
- Subnets
- Public Subnets
- Private Subnets
- Route Tables
- Internet Gateway
- Security Groups
- Network Traffic Flow
- Public vs Private Architecture

## 🏗️ Network Architecture

```text
Internet
    |
    v
Internet Gateway
    |
    v
Public Subnet
    |
    v
Reverse Proxy
    |
    v
Private Application Subnet
    |
    v
Private Database Subnet
```

## 🖧 VPC

A Virtual Private Cloud provides an isolated logical network for cloud resources.

## 🌍 Public Subnet

A public subnet is designed for resources that require controlled internet connectivity.

**Example:**
- Reverse proxy
- Load balancer

## 🔒 Private Subnet

A private subnet is used for resources that should not be directly exposed to the public internet.

**Example:**
- Application servers
- Databases

## 🗺️ Route Table

A route table controls where network traffic is directed.

## 🌐 Internet Gateway

An Internet Gateway provides connectivity between a VPC and the internet when routing and security rules allow it.

## 🛡️ Security Groups

Security groups control allowed inbound and outbound traffic for supported cloud resources.

## 💻 Linux Networking Commands

```bash
ip addr
ip route
ss -tuln
ping 8.8.8.8
curl -I https://example.com
dig example.com
```

## 🧩 Traffic Troubleshooting

When network connectivity fails, check:

1. IP configuration
2. Routing table
3. Listening service
4. Security rules
5. Network path
6. DNS resolution

## 🔐 Security Design

- The database and application layers should not be directly exposed to the public internet.
- Only the required public-facing component should be reachable from the internet.

## 🧾 Evidence

Screenshots include:

- IP configuration
- Routing table
- Listening ports
- DNS resolution
- HTTP response
- VPC configuration
- Subnet configuration
- Route table
- Security group

> Screenshots are stored in the [`screenshots/`](./screenshots) directory.

## 🎯 Outcome

Learned how cloud network boundaries, routing and security controls can be used to design a least-exposure architecture.

 

 
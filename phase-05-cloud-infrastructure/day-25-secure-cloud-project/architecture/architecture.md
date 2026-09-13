# Secure Cloud Architecture

## Objective

The objective of this architecture is to design a secure,
least-exposure web application infrastructure.

## Architecture Layers

### Internet Layer

Users access the application through the internet.

### Public Layer

The public layer contains the internet-facing component such
as a reverse proxy or load balancer.

### Private Application Layer

Application servers are placed inside a private network
boundary.

### Private Database Layer

Database services are isolated from direct internet access.

## Traffic Flow

```text
Internet
   ↓
Internet Gateway
   ↓
Public Subnet
   ↓
Reverse Proxy
   ↓
Private Application Subnet
   ↓
Private Database Subnet
# Infrastructure as Code (IaC) Security Policy
**Maintained by:** MD.AL-AMIN  

---

## 1. Storage Security Rules
* All S3 buckets **must** block public ACLs and public bucket policies.
* Server-side encryption (`AES256` or `aws:kms`) **must** be enforced on all storage buckets.

---

## 2. Network Security Rules
* Inbound SSH (Port 22) and RDP (Port 3389) **must never** be exposed to `0.0.0.0/0`.
* Ingress traffic **must** be limited to specific internal CIDR blocks (e.g., VPN or bastion hosts).

---

## 3. Compliance & Automated Scanning
* Every Terraform repository **must** undergo automated static analysis (`tfsec` / `trivy`) prior to merging into main branches.
* Zero `CRITICAL` or `HIGH` severity findings are allowed in production configurations.
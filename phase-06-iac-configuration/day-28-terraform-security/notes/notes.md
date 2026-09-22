# Day 28: IaC Security Scan & Remediation Notes
**Author:** MD.AL-AMIN  
**Date:** September 2026  

---

## 1. Executive Summary
This note documents the security scanning workflow performed on Terraform Infrastructure as Code (IaC) using static security analysis tools (`tfsec` / `trivy`).

---

## 2. Security Findings (Weak Configuration)
During the initial scan of `main.tf`, the following vulnerabilities were detected:

* **AWS001 / AWS002 (Public & Unencrypted S3 Bucket):** S3 bucket had public read ACL (`public-read`) and lacked server-side encryption.
* **AWS008 / AWS006 (Open SSH Port):** Security group allowed unrestricted SSH ingress (Port 22) from `0.0.0.0/0`.

---

## 3. Remediation Workflow Executed
1. **Weak Code Creation:** Configured insecure S3 bucket and Security Group rules.
2. **Initial Security Scan:** Executed `tfsec .` to capture baseline security findings.
3. **Configuration Fix:** Updated `main.tf` to enforce AES256 encryption, enabled S3 public access block, and restricted SSH access to `10.0.0.0/16`.
4. **Rescan Verification:** Executed `tfsec .` to confirm zero critical or high vulnerabilities.
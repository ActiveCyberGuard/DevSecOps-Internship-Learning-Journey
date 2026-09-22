# Day 28 — Terraform Security

## What We'll Learn (Concepts)

| Term | Meaning |
|------|---------|
| **IaC scanning** | Automatically checking infrastructure code for security misconfigurations before it's ever applied. |
| **Finding** | A specific issue a scanner detects (e.g., open port, public storage). |
| **Accepted risk / exception** | A finding you've reviewed and consciously decided to allow, with a documented reason. |
| **Sensitive variable** | A Terraform variable marked so its value is hidden from plan/apply output. |
| **Least privilege** | Granting only the access/exposure actually needed, nothing more. |

## Tools Used

- **tfsec** — scans Terraform code specifically for security misconfigurations
- **Trivy** — general-purpose scanner that also supports IaC scanning

## Commands

```bash
tfsec .                 # scan the current directory
tfsec . --format json   # machine-readable output, useful in CI pipelines
trivy config .           # alternative/complementary IaC scan
```

## Common Weak Patterns → Fixes

**Public storage access**
```hcl
# WEAK
resource "aws_s3_bucket_public_access_block" "weak" {
  bucket                  = aws_s3_bucket.weak_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# FIXED
resource "aws_s3_bucket_public_access_block" "secure" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```

**Open network access**
```hcl
# WEAK — SSH open to the whole internet
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# FIXED — restricted to a known admin IP
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["203.0.113.10/32"]
}
```

**Hardcoded secrets**
```hcl
# WEAK
variable "db_password" {
  default = "SuperSecret123!"
}

# FIXED — no hardcoded default, marked sensitive
variable "db_password" {
  type      = string
  sensitive = true
}
```

**Passing the secret safely (never hardcode it)**
```bash
export TF_VAR_db_password="$(openssl rand -base64 20)"
terraform plan   # Terraform reads TF_VAR_db_password automatically, shown as (sensitive value)
```

**Keeping state and secrets out of Git**
```bash
cat >> .gitignore << 'EOF'
*.tfstate
*.tfstate.backup
.terraform/
*.tfvars
EOF
```

## Documenting Accepted Risk

```markdown
| Finding | Risk | Decision | Reason | Reviewed by | Date |
|---------|------|----------|--------|-------------|------|
| SSH open to 0.0.0.0/0 in dev sandbox | Low (isolated lab) | Accepted for dev only | Needed for lab troubleshooting | you | date |
```

 

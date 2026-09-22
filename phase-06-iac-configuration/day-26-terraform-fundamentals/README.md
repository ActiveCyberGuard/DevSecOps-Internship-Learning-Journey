# Day 26 — Terraform Fundamentals

## What We'll Learn (Concepts)

| Term | Meaning |
|------|---------|
| **IaC (Infrastructure as Code)** | Defining infrastructure in code instead of clicking through a console — version-controlled and reproducible. |
| **Provider** | A plugin that lets Terraform talk to a specific platform (AWS, local filesystem, etc.). |
| **Resource** | A single piece of infrastructure Terraform manages (a file, a server, a bucket). |
| **State (`.tfstate`)** | Terraform's record of what it has created. Sensitive — never commit this to Git. |
| **Plan** | A dry-run showing what *would* change, without changing anything. |
| **Apply** | Executes the plan and actually creates/updates/deletes resources. |
| **Destroy** | Removes everything Terraform is tracking. |
| **Drift** | When real infrastructure no longer matches what's defined in code. |
| **Variable** | An input into your Terraform code. |
| **Output** | A value Terraform exposes after applying. |

## Tools Used

- **Terraform** — provisions and manages infrastructure as code
- **local provider** — a zero-cost Terraform provider that manages local files, used here for safe practice

## Commands

### Lifecycle
```bash
terraform init          # downloads the provider plugin, prepares the directory
terraform validate      # checks syntax
terraform plan           # dry run — shows what WILL happen
terraform apply           # asks for confirmation, then creates the resource
terraform destroy         # removes everything
```

### Inspecting state
```bash
terraform show                     # human-readable current state
terraform state list               # list all resources being tracked
terraform state show local_file.example
```

### Variables and outputs
```bash
terraform plan -var="message=Overridden from CLI"
terraform apply -var="message=Overridden from CLI"
terraform output file_path
```

## Example Config

```hcl
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "example" {
  filename = "${path.module}/output/hello.txt"
  content  = "Hello from Terraform, managed by IaC.\n"
}
```

```hcl
variable "message" {
  description = "Text written into the managed file"
  type        = string
  default     = "Default message"
}
```

```hcl
output "file_path" {
  value = local_file.example.filename
}
```

## Drift Example (What Happens If We Change Things Manually)

```bash
rm -rf output/hello.txt        # delete the resource OUTSIDE Terraform
terraform plan                  # Terraform detects the drift
terraform apply                 # Terraform recreates it — this is why manual changes are risky
```

 

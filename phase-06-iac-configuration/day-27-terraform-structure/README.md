# Day 27 — Terraform Structure

## What We'll Learn (Concepts)

| Term | Meaning |
|------|---------|
| **Module** | A reusable, self-contained group of Terraform resources — like a function for infrastructure. |
| **Local value (`locals`)** | A named expression reused within a config, like a constant. |
| **Data source** | Reads existing information without creating anything new. |
| **Workspace** | A way to keep separate state for different environments (dev/staging/prod) using the same code. |
| **Formatting (`fmt`)** | Auto-standardizing code style so it's consistent and readable. |

## Tools Used

- **Terraform** — same tool, now organized into modules for reusability

## Commands

### Formatting and validating
```bash
terraform fmt -recursive       # auto-formats every .tf file consistently
terraform fmt -diff            # shows what fmt WOULD change, without changing it
terraform validate
```

### Modules
```bash
terraform init                 # re-initializes to pick up a new module
terraform plan
terraform apply
```

### Workspaces (multi-environment)
```bash
terraform workspace list
terraform workspace new staging
terraform workspace select staging
terraform workspace select default
```

## Example: Module Structure

```
terraform/
├── main.tf
├── modules/
│   └── web/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```

**modules/web/main.tf**
```hcl
resource "local_file" "web_config" {
  filename = "${path.module}/../../output/${var.environment}-web.conf"
  content  = <<-EOT
    server_name ${var.server_name}
    environment ${var.environment}
    replicas    ${var.replicas}
  EOT
}
```

**modules/web/variables.tf**
```hcl
variable "server_name" { type = string }
variable "environment" { type = string }
variable "replicas" {
  type    = number
  default = 1
}
```

**Root main.tf using the module**
```hcl
locals {
  common_server_name = "devsecops-lab.local"
}

module "web_dev" {
  source      = "./modules/web"
  server_name = local.common_server_name
  environment = "dev"
  replicas    = 1
}

module "web_staging" {
  source      = "./modules/web"
  server_name = local.common_server_name
  environment = "staging"
  replicas    = 2
}
```

**Data source example**
```hcl
data "local_file" "dev_config" {
  filename = module.web_dev.config_path
}

output "dev_config_content" {
  value = data.local_file.dev_config.content
}
```

 

- Why break code into modules instead of one large file
- The difference between a `variable`, a `local`, and a `data` source
- How workspaces let you manage multiple environments with the same code

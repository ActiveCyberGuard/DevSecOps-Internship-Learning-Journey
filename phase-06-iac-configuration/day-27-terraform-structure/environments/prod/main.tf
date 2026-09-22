cat << 'EOF' > main.tf
terraform {
  

  required_providers {
    local = {
      source  = "hashicorp/local"
       
    }
  }
}

provider "local" {}

locals {
  environment = "production"
  project     = "devsecops-iac"
}

module "lab_file" {
  source = "../../modules/local_file"

  filename = "${path.module}/prod-environment.txt"

  content = <<-EOT
    Project: ${local.project}
    Environment: ${local.environment}

    Managed using reusable Terraform module.
  EOT
}
EOF
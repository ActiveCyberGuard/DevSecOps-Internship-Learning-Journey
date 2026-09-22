terraform {
  required_version = ">= 1.16.3"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

locals {
  environment = "development"
  project     = "devsecops-iac"
}

module "lab_file" {
  source = "../../modules/local_file"

  filename = "${path.module}/dev-environment.txt"

  content = <<-EOT
    Project: ${local.project}
    Environment: ${local.environment}

    Managed using reusable Terraform module.
  EOT
}
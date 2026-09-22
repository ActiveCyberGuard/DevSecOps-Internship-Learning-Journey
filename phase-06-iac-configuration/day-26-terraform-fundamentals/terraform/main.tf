terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }

  required_version = ">= 1.6.0"
}

provider "local" {}

resource "local_file" "devops_lab" {
  filename = "${path.module}/devops-lab.txt"

  content = <<-EOT
    DevSecOps Infrastructure as Code Lab

    Managed by Terraform.

    Phase: 6
    Day: 26
    Topic: Terraform Fundamentals
  EOT
}
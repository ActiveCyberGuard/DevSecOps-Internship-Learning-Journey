output "project_name" {
  description = "Project name"
  value       = var.project_name
}

output "managed_file" {
  description = "Terraform managed file"
  value       = local_file.devops_lab.filename
}
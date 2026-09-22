output "inventory_file_path" {
  value       = local_file.ansible_inventory.filename
  description = "Path to the generated Ansible inventory file"
}

output "project_status" {
  value       = "Infrastructure provisioned successfully for ${var.project_name}"
  description = "Current status of the project provisioning"
}
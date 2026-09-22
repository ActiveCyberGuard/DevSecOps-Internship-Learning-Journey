# Local Environment Simulation: File generation and Inventory management
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    target_host = "localhost"
  })
  filename        = "${path.module}/../ansible/inventory/hosts.ini"
  file_permission = "0644"
}

resource "local_file" "deployment_log" {
  content  = "Project: ${var.project_name}\nEnvironment: ${var.environment}\nProvisioned At: ${timestamp()}\n"
  filename = "${path.module}/deployment.log"
}
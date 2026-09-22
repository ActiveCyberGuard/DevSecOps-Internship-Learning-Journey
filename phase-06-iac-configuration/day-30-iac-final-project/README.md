# Day 30 — Week 6 Project: Terraform + Ansible Together

## What We'll Learn (Concepts)

| Term | Meaning |
|------|---------|
| **Provisioning vs. Configuration** | Terraform *provisions* infrastructure (creates the resource); Ansible *configures* it (installs/sets up software on it). |
| **Reproducibility** | The whole environment can be destroyed and rebuilt from code alone, with no manual steps. |
| **End-to-end idempotency** | Both the provisioning layer (Terraform) and the configuration layer (Ansible) individually show no changes on a second run. |

## Tools Used

- **Terraform** — provisions the infrastructure and generates Ansible's inventory
- **tfsec / Trivy** — scan the Terraform code for security issues
- **Ansible** — configures whatever Terraform provisioned

## Commands — Full Flow

### 1. Provision with Terraform
```bash
cd terraform
terraform fmt -recursive
terraform init
terraform validate
terraform plan
terraform apply
cd ..
```

### 2. Security scan
```bash
tfsec terraform/
trivy config terraform/
```

### 3. Configure with Ansible (using Terraform's generated inventory)
```bash
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml
```

### 4. Validate the result
```bash
curl -s http://localhost:80 | grep -i "Provisioned"
```

### 5. Prove idempotency of the whole chain
```bash
terraform plan            # should show no changes
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml   # changed=0
```

### 6. Prove reproducibility — destroy and rebuild from scratch
```bash
terraform -chdir=terraform destroy
terraform -chdir=terraform apply
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml
curl -s http://localhost:80 | grep -i "Provisioned"
```

## Example: Terraform Generating Ansible's Inventory

```hcl
resource "local_file" "server_inventory" {
  filename = "${path.module}/../ansible/inventory_generated.ini"
  content  = <<-EOT
    [web]
    localhost ansible_connection=local

    [web:vars]
    nginx_port=${var.nginx_port}
    environment=${var.environment}
  EOT
}
```

## Example: Ansible Consuming It

```yaml
---
- name: Configure the provisioned web server
  hosts: web
  become: true
  vars:
    site_message: "Provisioned by Terraform, configured by Ansible ({{ environment }})"

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: true

    - name: Deploy index page
      copy:
        dest: /var/www/html/index.html
        content: "<h1>{{ site_message }}</h1>"
        mode: '0644'
      notify: Restart nginx

    - name: Ensure nginx running and enabled
      service:
        name: nginx
        state: started
        enabled: true

  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
```

 

## Phase 6 Complete
Next: **Phase 7 — Kubernetes & Helm**

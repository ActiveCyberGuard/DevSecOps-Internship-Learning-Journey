# Phase 6 — Infrastructure as Code & Configuration
### Reference Guide: Concepts, Tools & Commands

This covers **Terraform** (provisioning infrastructure) and **Ansible** (configuring it), the two core tools of this phase, along with the security scanning layer on top of them.

---

## 1. Core Concepts (What Things Are Called)

| Term | Meaning |
|------|---------|
| **IaC (Infrastructure as Code)** | Defining infrastructure (servers, networks, storage) in code files instead of clicking through a console, so it's version-controlled and reproducible. |
| **Provider** | A plugin that lets Terraform talk to a specific platform (AWS, local filesystem, Docker, etc.). |
| **Resource** | A single piece of infrastructure Terraform manages (a file, a server, a bucket, a security group). |
| **State (`.tfstate`)** | Terraform's record of what it has created and its current configuration. Sensitive — should never be committed to Git. |
| **Plan** | A dry-run showing what Terraform *would* change, without changing anything yet. |
| **Apply** | Executes the plan and actually creates/updates/deletes resources. |
| **Destroy** | Removes everything Terraform is tracking. |
| **Drift** | When real infrastructure no longer matches what's defined in code (e.g., someone changed something manually). |
| **Module** | A reusable, self-contained group of Terraform resources — like a function for infrastructure. |
| **Variable** | An input into your Terraform code (e.g., environment name, instance size). |
| **Output** | A value Terraform exposes after applying (e.g., a generated file path or IP address). |
| **Local value (`locals`)** | A named expression reused within a config, like a constant. |
| **Data source** | Reads existing information (without creating anything) — e.g., reading a file that already exists. |
| **Workspace** | A way to keep separate state for different environments (dev/staging/prod) using the same code. |
| **Idempotency** | Running the same automation twice produces the same end result — the second run makes no changes. This is Ansible's core principle. |
| **Inventory** | Ansible's list of hosts (servers) it will manage. |
| **Playbook** | A YAML file defining the tasks Ansible should run on target hosts. |
| **Task** | A single action in a playbook (e.g., "install nginx"). |
| **Handler** | A task that only runs when notified by another task (e.g., "restart nginx" only if config changed). |
| **Role** | A structured, reusable bundle of tasks/handlers/variables — Ansible's version of a module. |
| **IaC scanning** | Automatically checking Terraform/config code for security misconfigurations before it's ever applied. |

---

## 2. Tools Used

| Tool | Purpose |
|------|---------|
| **Terraform** | Provisions and manages infrastructure as code. |
| **tfsec** | Scans Terraform code for security misconfigurations (open ports, public storage, hardcoded secrets). |
| **Trivy** | Multi-purpose scanner — also supports scanning IaC (Terraform, Kubernetes YAML, Dockerfiles). |
| **Ansible** | Agentless configuration management — installs software and enforces server configuration. |
| **Git** | Version control for all the above code. |

---

## 3. Terraform — Commands & What They Do

### Setup & Lifecycle
```bash
terraform init          # downloads providers/modules, prepares the working directory
terraform validate      # checks the code is syntactically correct
terraform fmt -recursive  # auto-formats all .tf files consistently
terraform plan           # dry run — shows what WILL change
terraform apply           # applies the changes (asks for confirmation)
terraform destroy         # removes everything Terraform is tracking
```

### Inspecting State
```bash
terraform show                     # human-readable view of current state
terraform state list               # list all tracked resources
terraform state show <resource>    # detail on one resource
terraform output                   # show all output values
terraform output <name>            # show one specific output
```

### Passing Variables
```bash
terraform plan -var="message=Custom value"       # override a variable from CLI
export TF_VAR_db_password="$(openssl rand -base64 20)"  # pass a secret via env var (never hardcode it)
```

### Modules & Environments
```bash
terraform workspace list           # see available workspaces
terraform workspace new staging    # create a new environment workspace
terraform workspace select staging # switch to it
```

### Example minimal config (local provider, zero cost)
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
  content  = "Hello from Terraform\n"
}
```

### Example module usage
```hcl
module "web_dev" {
  source      = "./modules/web"
  environment = "dev"
  replicas    = 1
}
```

---

## 4. Terraform Security — Commands

```bash
tfsec .                # scan the current directory for security issues
tfsec . --format json  # machine-readable output for CI pipelines
trivy config .          # alternative/complementary IaC scan
```

**Common findings you'll see and fix:**
- Storage (e.g., S3 buckets) left publicly accessible → set `block_public_*` to `true`
- Security groups allowing `0.0.0.0/0` on sensitive ports (like SSH/22) → restrict to a specific IP/CIDR
- Hardcoded secrets/passwords in `.tf` files → mark variables `sensitive = true` and pass via environment variables or a secrets manager instead

```hcl
variable "db_password" {
  type      = string
  sensitive = true   # value is masked in plan/apply output, no default hardcoded
}
```

**Keeping secrets and state out of Git:**
```bash
cat >> .gitignore << 'EOF'
*.tfstate
*.tfstate.backup
.terraform/
*.tfvars
EOF
```

---

## 5. Ansible — Commands & What They Do

### Connectivity & Ad-hoc Commands
```bash
ansible -i inventory.ini web -m ping             # test connectivity to hosts in the "web" group
ansible -i inventory.ini web -m command -a "uptime"  # run a one-off command
ansible -i inventory.ini web -m setup            # gather facts about a host
```

### Running Playbooks
```bash
ansible-playbook -i inventory.ini playbook.yml               # run a playbook
ansible-playbook -i inventory.ini playbook.yml --syntax-check # check YAML/syntax only
ansible-playbook -i inventory.ini playbook.yml --check        # dry run, no changes made
```

### Example inventory
```ini
[web]
localhost ansible_connection=local
```

### Example playbook (install & configure nginx)
```yaml
---
- name: Configure web server
  hosts: web
  become: true
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: true

    - name: Deploy index page
      copy:
        dest: /var/www/html/index.html
        content: "<h1>Configured by Ansible</h1>"
        mode: '0644'
      notify: Restart nginx

    - name: Ensure nginx running
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

### Proving idempotency
```bash
ansible-playbook -i inventory.ini playbook.yml   # first run: changed=X
ansible-playbook -i inventory.ini playbook.yml   # second run: changed=0 → confirms idempotency
```

### Role structure (reusable, organized version of a playbook)
```
roles/nginx/
├── tasks/main.yml      # what to do
├── handlers/main.yml   # what to do only when notified
└── defaults/main.yml   # default variable values
```

```bash
ansible-playbook -i inventory.ini site.yml   # site.yml applies the role to hosts
```

---

## 6. Putting It Together — Terraform + Ansible Flow

```bash
# 1. Terraform provisions infrastructure and can generate Ansible's inventory
cd terraform
terraform init && terraform validate && terraform plan && terraform apply

# 2. Scan the Terraform code before/after applying
tfsec terraform/
trivy config terraform/

# 3. Ansible configures what Terraform provisioned
cd ..
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml

# 4. Confirm both are idempotent (no drift, no unnecessary changes)
terraform plan            # should show "no changes"
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml  # changed=0

# 5. Prove full reproducibility: destroy everything, then rebuild from code alone
terraform destroy
terraform apply
ansible-playbook -i ansible/inventory_generated.ini ansible/playbook.yml
```

---
Author:
MD:AL-AMIN
Intern Business IT 
Sonali Bank PLC

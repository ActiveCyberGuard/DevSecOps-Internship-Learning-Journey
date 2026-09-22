# Day 29 — Ansible Fundamentals

## What We'll Learn (Concepts)

| Term | Meaning |
|------|---------|
| **Agentless** | Ansible doesn't require installing any software on the target host — it connects over SSH. |
| **Inventory** | Ansible's list of hosts (servers) it will manage, organized into groups. |
| **Playbook** | A YAML file defining the tasks Ansible should run on target hosts. |
| **Task** | A single action in a playbook (e.g., "install nginx"). |
| **Handler** | A task that only runs when notified by another task (e.g., "restart nginx" only if config changed). |
| **Idempotency** | Running the same playbook twice produces the same end result — the second run makes no changes. |
| **Role** | A structured, reusable bundle of tasks/handlers/variables. |
| **Ad-hoc command** | A one-off Ansible command run directly, without writing a playbook. |

## Tools Used

- **Ansible** — agentless configuration management

## Commands

### Connectivity and ad-hoc commands
```bash
ansible -i inventory.ini web -m ping                  # test connectivity
ansible -i inventory.ini web -m command -a "uptime"    # run a one-off command
ansible -i inventory.ini web -m setup | head -30       # gather facts about the host
```

### Running playbooks
```bash
ansible-playbook -i inventory.ini playbook.yml                 # run the playbook
ansible-playbook -i inventory.ini playbook.yml --syntax-check  # check syntax only
ansible-playbook -i inventory.ini playbook.yml --check          # dry run, no changes made
```

### Proving idempotency
```bash
ansible-playbook -i inventory.ini playbook.yml   # first run — changed=X
ansible-playbook -i inventory.ini playbook.yml   # second run — changed=0 confirms idempotency
```

## Example Inventory

```ini
[web]
localhost ansible_connection=local
```

## Example Playbook (Install & Configure Nginx)

```yaml
---
- name: Configure web server
  hosts: web
  become: true
  vars:
    nginx_port: 8080

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: true

    - name: Deploy custom index page
      copy:
        dest: /var/www/html/index.html
        content: |
          <html><body><h1>Configured by Ansible</h1></body></html>
        mode: '0644'
      notify: Restart nginx

    - name: Ensure nginx is running and enabled
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

## Example Role Structure

```
roles/nginx/
├── tasks/main.yml      # what to do
├── handlers/main.yml   # what to do only when notified
└── defaults/main.yml   # default variable values
```

```yaml
# roles/nginx/defaults/main.yml
nginx_port: 8080
site_message: "Hello from an Ansible role"
```

```yaml
# roles/nginx/tasks/main.yml
---
- name: Install nginx
  apt:
    name: nginx
    state: present
    update_cache: true

- name: Deploy index page from role
  copy:
    dest: /var/www/html/index.html
    content: "<h1>{{ site_message }}</h1>"
    mode: '0644'
  notify: Restart nginx

- name: Ensure nginx running
  service:
    name: nginx
    state: started
    enabled: true
```

```bash
ansible-playbook -i inventory.ini site.yml   # applies the role via site.yml
```
 

- The difference between an ad-hoc command and a playbook
- What idempotency means and how to prove it
- The difference between a task, a handler, and a role

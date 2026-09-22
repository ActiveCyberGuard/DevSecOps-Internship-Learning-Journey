# Ansible Roles Directory
**Maintained by:** MD.AL-AMIN  

---

## Purpose
This directory is designated for structuring complex Ansible automation into modular, reusable components (Ansible Roles).

---

## Standard Role Structure
Future role implementations should follow the standard Ansible Galaxy directory layout:

```text
roles/
└── webserver/
    ├── tasks/
    │   └── main.yml      # Main list of tasks to execute
    ├── handlers/
    │   └── main.yml      # Handlers (e.g., service restart triggers)
    ├── templates/
    │   └── index.html.j2 # Jinja2 templates for configuration
    ├── defaults/
    │   └── main.yml      # Default low-priority variables
    └── vars/
        └── main.yml      # High-priority role variables
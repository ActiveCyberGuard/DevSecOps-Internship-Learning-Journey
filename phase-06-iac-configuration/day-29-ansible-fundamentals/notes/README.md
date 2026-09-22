# Day 29: Ansible Fundamentals & Idempotency Lab Notes
**Author:** MD.AL-AMIN  
**Date:** September 2026  
**Environment:** Ubuntu / Ansible  

---

## 1. Overview
This lab demonstrates the core concepts of Ansible, focusing on inventory management, playbook creation, automated service configuration (Nginx), and verifying the key IaC concept of **Idempotency**.

---

## 2. Key Components Used

* **Inventory (`inventory/hosts.ini`):** Defines the target hosts. For this local lab, `localhost` is configured with `ansible_connection=local`.
* **Playbook (`playbooks/nginx.yml`):** A declarative YAML file containing tasks to:
  1. Install the `nginx` package using the `apt` module.
  2. Ensure the `nginx` service is running and enabled on boot.
  3. Deploy a custom `index.html` web page.

---

## 3. Understanding Idempotency

**Idempotency** is a fundamental property of Ansible where executing the same playbook multiple times produces the exact same result without unintended side effects.

* **First Execution:**
  * Status: `changed=3` (or `changed > 0`)
  * Action: Nginx was installed, service started, and web page created.
* **Second Execution:**
  * Status: `changed=0`
  * Action: Ansible verified that the system state matched the playbook declaration and made no unnecessary changes.
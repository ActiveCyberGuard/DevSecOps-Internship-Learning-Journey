# 🚀 Phase 04: Continuous Integration & Continuous Deployment (CI/CD)

Welcome to **Phase 04** of the DevSecOps Internship Learning Journey. This phase focuses on building automated, secure, and resilient CI/CD pipelines using **GitHub Actions**, **Docker**, **Pytest**, **Flake8**, and **Trivy Vulnerability Scanner**.

---

## 📌 Phase Objectives & DevSecOps Flow

---

## 📅 Daily Learning Breakdown

| Module | Core Concept | Tools Used | GitHub Action Workflow |
| :--- | :--- | :--- | :--- |
| **Day 15** | CI Fundamentals & Unit Testing | Python, Pytest, GitHub Actions | `phase4-day15-basic-ci.yml` |
| **Day 16** | Matrix Strategy Builds | Python (3.10, 3.11, 3.12) | `phase4-day16-matrix-ci.yml` |
| **Day 17** | Quality Gates & Coverage | Flake8, Pytest-Cov, Artifacts | `phase4-day17-quality-gate.yml` |
| **Day 18** | Containerized CI Pipelines | Docker, Flask, GitHub Actions | `phase4-day18-docker-ci.yml` |
| **Day 19** | Deployment & Rollback Strategies | Docker Compose, Staging Sim | `phase4-day19-deployment.yml` |
| **Day 20** | 🔥 **Secure E2E DevSecOps Pipeline** | Trivy, GHCR, Docker, Pytest | `phase4-day20-final-cicd.yml` |

---

## 🛠️ Key Hands-On Highlights

* **1. Automated Unit Testing & Matrix Builds (Days 15 & 16):** Configured GitHub Actions runners to automatically trigger unit tests on `push` and `pull_request` events across multiple Python runtimes (3.10, 3.11, 3.12) to ensure cross-version compatibility.
* **2. Quality Gates & Lint Enforcement (Day 17):** Integrated strict static code analysis with `flake8` and coverage tracking via `pytest-cov`. Verified pipeline behavior under failure states by introducing breaking changes and validating pipeline rejection.
* **3. Containerization & Docker CI (Day 18):** Automated container builds directly within the CI runner, ensuring application packaging consistency across development and staging environments.
* **4. Staging Deployment & Rollback Mechanisms (Day 19):** Simulated automated staging release cycles and automated rollback procedures in response to failed health check endpoints.
* **5. 🔥 Final Project: Secure End-to-End DevSecOps Pipeline (Day 20):** Built a comprehensive security-first pipeline containing:
  * Automated Pytest Suite & Flake8 Linting
  * Container Vulnerability Scanning via **Trivy Action**
  * Publishing verified artifacts to **GitHub Container Registry (GHCR)**
  * Automated Staging Deployments with Health Monitoring & Fail-Safe Rollback

---

## 🛡️ Security Controls Implemented

- **Static Analysis & Linting:** Enforces PEP 8 standards before containerization.
- **Vulnerability Scanning:** Scans Docker images for High/Critical CVEs using **Trivy** prior to registry publishing.
- **Immutable Artifact Tagging:** Uses Git commit SHA (`${{ github.sha }}`) tags for full traceability and reliable rollbacks.
- **Least-Privilege Token Access:** Scope-restricted `GITHUB_TOKEN` permissions defined per job.

---

## 📸 Verification & Screenshots

All pipeline execution logs, local test results, container health checks, failure demonstrations, and GitHub Actions execution proofs are archived in:
📂 `phase-04-cicd/docs/screenshots/`

---

> **Phase Status:** Completed ✅  
> **Next Phase:** Phase 05 — Kubernetes & Cloud Infrastructure
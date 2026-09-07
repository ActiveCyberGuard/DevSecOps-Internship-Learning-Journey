# Day 20 — Secure End-to-End DevSecOps CI/CD Pipeline

## 🔥 Final Hard Project — Project 4

This project represents the culmination of Phase 4 — CI/CD.

The objective was to design and implement a secure end-to-end DevSecOps CI/CD pipeline that integrates automated testing, code quality validation, Docker image building, container security scanning, container registry publishing, staging deployment simulation, health validation, and rollback handling.

---

## 1. Project Overview

### Project Name

**Secure End-to-End DevSecOps CI/CD Pipeline**

### Project Type

**Final Hard Project — Project 4**

### Phase

**Phase 04 — CI/CD**

The project demonstrates how application code can move through an automated DevSecOps pipeline:

```text
Developer
   ↓
Git Push / Pull Request
   ↓
Automated Tests
   ↓
Lint / Quality Gate
   ↓
Docker Build
   ↓
Trivy Security Scan
   ↓
GitHub Container Registry
   ↓
Staging Deployment
   ↓
Health Check
   ↓
Success / Rollback
```

---

## 2. Objectives

The main objectives of this project were to:

* Build an end-to-end CI/CD pipeline.
* Automate application testing.
* Automate code quality checks.
* Build a Docker container image.
* Scan the container image for vulnerabilities.
* Publish the image to GitHub Container Registry.
* Simulate staging deployment.
* Perform application health validation.
* Demonstrate rollback concepts.
* Practice DevSecOps automation using GitHub Actions.

---

## 3. Technologies Used

| Technology                | Purpose                       |
| ------------------------- | ----------------------------- |
| Git                       | Version control               |
| GitHub                    | Source code hosting           |
| GitHub Actions            | CI/CD automation              |
| Python                    | Application development       |
| Flask                     | Web application framework     |
| Pytest                    | Automated testing             |
| Flake8                    | Code quality                  |
| Docker                    | Application containerization  |
| Docker Compose            | Local container orchestration |
| Trivy                     | Container security scanning   |
| GitHub Container Registry | Container image registry      |

---

## 4. Project Structure

```text
day-20-final-cicd-project/
│
├── app/
│   ├── app.py
│   └── requirements.txt
│
├── tests/
│   └── test_app.py
│
├── screenshots/
│   ├── 16-day20-local-tests.png
│   ├── 17-day20-docker-build.png
│   ├── 18-day20-container-running.png
│   ├── 19-day20-health-check.png
│   └── 20-day20-api-response.png
│
├── docs/
│   ├── architecture.md
│   ├── deployment.md
│   └── rollback.md
│
├── Dockerfile
├── .dockerignore
├── docker-compose.yml
└── README.md
```

The GitHub Actions workflow is located at:

```text
.github/workflows/phase4-day20-final-cicd.yml
```

---

## 5. Application

The application is a Flask-based DevSecOps demonstration API.

It provides three endpoints.

### Main Endpoint

```text
/
```

### Health Endpoint

```text
/health
```

### Information Endpoint

```text
/api/info
```

---

## 6. Application Response

The main endpoint returns:

```json
{
  "application": "DevSecOps CI/CD Platform",
  "version": "1.0",
  "status": "running"
}
```

The health endpoint returns:

```json
{
  "status": "healthy"
}
```

The information endpoint returns:

```json
{
  "environment": "staging",
  "pipeline": "GitHub Actions"
}
```

---

## 7. Automated Testing

Pytest was used to validate the application endpoints.

The test suite validates:

* Main endpoint
* Health endpoint
* Information endpoint

Run locally:

```bash
py -m pytest
```

Expected result:

```text
3 passed
```

---

## 8. Code Quality

Flake8 was used to perform Python code quality checks.

Run locally:

```bash
py -m flake8 app
```

No output indicates that the application passed the linting check.

---

## 9. Dockerization

The application was containerized using Docker.

### Dockerfile

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]
```

The application runs on port `5000` inside the container.

---

## 10. Docker Compose

Docker Compose was used for local deployment.

```yaml
services:
  web:
    build: .
    container_name: final-cicd-app
    ports:
      - "5000:5000"
    restart: unless-stopped
```

The port mapping is:

```text
Host Port 5000
      ↓
Container Port 5000
      ↓
Flask Application
```

---

## 11. Local Docker Build

Build the application:

```bash
docker compose build
```

Run the container:

```bash
docker compose up -d
```

Check the running container:

```bash
docker ps
```

---

## 12. Application Testing

### Main Endpoint

```bash
curl http://localhost:5000
```

### Health Check

```bash
curl http://localhost:5000/health
```

Expected:

```json
{
  "status": "healthy"
}
```

### API Information

```bash
curl http://localhost:5000/api/info
```

Expected:

```json
{
  "environment": "staging",
  "pipeline": "GitHub Actions"
}
```

---

## 13. CI/CD Pipeline

The GitHub Actions pipeline consists of the following stages:

```text
Test
 ↓
Lint
 ↓
Docker Build
 ↓
Security Scan
 ↓
Publish Image
 ↓
Staging
 ↓
Health Check
 ↓
Rollback if Required
```

---

## 14. Test Stage

The pipeline first runs the application tests.

```text
Application Tests
        ↓
     PASS / FAIL
```

If the tests fail, subsequent quality and build stages are not executed.

---

## 15. Lint Stage

The lint job runs after the test job.

```text
Test
 ↓
Lint
```

Flake8 validates the Python application for code quality problems.

---

## 16. Docker Build Stage

After tests and linting pass, the pipeline builds the Docker image.

The image is tagged using the Git commit SHA:

```text
devsecops-demo:<commit-sha>
```

Using the commit SHA provides traceability between source code and container image.

---

## 17. Container Security Scan

Trivy is used to scan the Docker image for known vulnerabilities.

The pipeline checks:

```text
CRITICAL
HIGH
```

severity vulnerabilities.

The scan is configured to ignore unfixed vulnerabilities.

This demonstrates the integration of container security into the CI/CD pipeline.

---

## 18. Container Registry

The Docker image is published to GitHub Container Registry.

Image format:

```text
ghcr.io/<repository-owner>/devsecops-demo:<commit-sha>
```

Git commit SHA-based image tagging makes it possible to identify specific application versions.

---

## 19. Staging Deployment

After the image is published, the pipeline performs a staging deployment simulation.

Example output:

```text
STAGING DEPLOYMENT

Image:
ghcr.io/<repository-owner>/devsecops-demo:<commit-sha>

Deployment successful
```

The current implementation is a deployment simulation running on the GitHub-hosted runner.

It does not deploy to an external production server.

---

## 20. Health Check

After staging deployment, a health check is performed.

Example:

```text
Running health check...
HTTP 200 OK
Application is healthy
```

Health validation is an important deployment safety mechanism.

---

## 21. Rollback

If the deployment stage fails, the rollback job is triggered.

Rollback flow:

```text
New Version
    ↓
Deployment
    ↓
Health Check
    ↓
Failure
    ↓
Rollback
    ↓
Previous Stable Version
```

Because images are tagged using Git commit SHA values, previous application versions can be identified and restored.

---

## 22. Blue/Green Deployment Concept

Blue/Green deployment uses two environments:

```text
Blue  → Current Stable Version
Green → New Version
```

The new version can be validated before switching traffic.

If the new version fails:

```text
Green → Failed
   ↓
Traffic returns to Blue
```

---

## 23. Canary Deployment Concept

Canary deployment gradually introduces a new version.

Example:

```text
Version 1 → 90%
Version 2 → 10%
```

If Version 2 performs well, traffic can gradually increase.

```text
90/10
 ↓
50/50
 ↓
0/100
```

This reduces deployment risk.

---

## 24. Security Controls

The project integrates multiple DevSecOps security controls:

### Source Control

Git and GitHub provide version-controlled source code.

### Automated Testing

Pytest validates application functionality.

### Code Quality

Flake8 checks Python code quality.

### Container Security

Trivy scans Docker images for vulnerabilities.

### Immutable Versioning

Git commit SHA values are used as container image tags.

### Pipeline Permissions

GitHub Actions permissions are explicitly configured.

---

## 25. GitHub Actions Workflow

Workflow location:

```text
.github/workflows/phase4-day20-final-cicd.yml
```

The workflow automates:

```text
Test
 ↓
Lint
 ↓
Docker Build
 ↓
Trivy Scan
 ↓
GHCR Publish
 ↓
Staging Simulation
 ↓
Health Check
 ↓
Rollback
```

---

## 26. Local Screenshots

### Local Tests

 

### Docker Build

 

### Container Running

 

### Health Check

 

### API Response

 

---

## 27. Documentation

Additional project documentation:

* [Architecture](docs/architecture.md)
* [Deployment](docs/deployment.md)
* [Rollback](docs/rollback.md)

---

## 28. Future Improvements

The current project demonstrates staging deployment through a GitHub Actions simulation.

Future improvements could include:

* Real Ubuntu staging server
* SSH-based deployment
* Production environment
* Docker Compose remote deployment
* Automatic deployment to cloud infrastructure
* Strict Trivy security gate
* Blue/Green deployment
* Canary deployment
* Automated health-based rollback
* Monitoring and alerting
* Secrets management
* Infrastructure as Code

---

## 29. Key Takeaway

This project demonstrates how DevSecOps practices can be integrated into a complete CI/CD lifecycle.

The final workflow combines:

```text
Development
     ↓
Version Control
     ↓
Testing
     ↓
Quality Gate
     ↓
Containerization
     ↓
Security Scanning
     ↓
Container Registry
     ↓
Staging
     ↓
Health Check
     ↓
Rollback
```

This represents the culmination of the Phase 4 CI/CD learning journey.

---

## 30. Conclusion

The Secure End-to-End DevSecOps CI/CD Pipeline project provided practical experience with automated testing, code quality, Docker, container security, GitHub Actions, container registries, staging deployment, health checks, and rollback concepts.

The project demonstrates the core principle of DevSecOps:

> Build securely, test automatically, deploy consistently, and recover quickly.

The pipeline can be extended in the future to support real remote staging and production environments, advanced deployment strategies, monitoring, and automated rollback.

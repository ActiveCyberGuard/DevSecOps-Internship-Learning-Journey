# Day 19 — Deployment + Rollback

## 1. Objective

The objective of this module was to understand the fundamentals of application deployment, staging environments, version updates, health checks, and rollback strategies.

A Dockerized Flask application was deployed locally using Docker Compose to simulate a staging environment.

The practical workflow demonstrated:

```text
Version 1
   ↓
Staging Deployment
   ↓
Version 2
   ↓
Change / Problem
   ↓
Rollback
   ↓
Version 1
```

---

## 2. Topics Learned

During this module, I learned about:

* Development environment
* Staging environment
* Production environment
* Application deployment
* Docker Compose deployment
* Application versioning
* Health checks
* Rollback strategy
* Blue/Green deployment concept
* Canary deployment concept
* GitHub Actions deployment simulation
* CI/CD deployment workflow

---

## 3. Project Structure

```text
day-19-deployment-rollback/
│
├── app/
│   ├── app.py
│   └── requirements.txt
│
├── screenshots/
│   ├── 13-day19-staging-v1.png
│   ├── 14-day19-staging-v2.png
│   └── 15-day19-rollback.png
│
├── Dockerfile
├── docker-compose.yml
└── README.md
```

---

## 4. Flask Staging Application

The application was developed using Flask.

The application provides two endpoints:

```text
/
```

and

```text
/health
```

The main endpoint displays the current application version.

The health endpoint is used to verify whether the application is responding correctly.

---

## 5. Application Code

The initial application version was:

```python
from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return "Staging Application v1"


@app.route("/health")
def health():
    return "healthy"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

The application listens on port `5000` inside the Docker container.

---

## 6. Requirements

The application requires Flask.

`requirements.txt`:

```text
Flask==3.0.3
```

---

## 7. Dockerfile

The application was containerized using the following Dockerfile:

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]
```

### Dockerfile Explanation

* `FROM python:3.12-slim` — Uses a lightweight Python image.
* `WORKDIR /app` — Sets the application working directory.
* `COPY` — Copies the dependency file and application code.
* `RUN pip install` — Installs Flask.
* `EXPOSE 5000` — Documents the application port.
* `CMD` — Starts the Flask application.

---

## 8. Docker Compose Configuration

Docker Compose was used to simplify the staging deployment.

```yaml
services:
  app:
    build: .
    container_name: staging-app
    ports:
      - "5001:5000"
    restart: unless-stopped
```

The port mapping is:

```text
Host Port 5001
      ↓
Container Port 5000
      ↓
Flask Application
```

Therefore, the application can be accessed through:

```text
http://localhost:5001
```

---

## 9. Staging Deployment

The application was deployed locally using Docker Compose.

Command:

```bash
docker compose up -d --build
```

The running container was checked using:

```bash
docker compose ps
```

Expected port mapping:

```text
0.0.0.0:5001->5000/tcp
```

---

## 10. Version 1 Testing

After the first deployment, the application was tested using:

```bash
curl http://localhost:5001
```

Expected output:

```text
Staging Application v1
```

The health endpoint was also tested:

```bash
curl http://localhost:5001/health
```

Expected output:

```text
healthy
```

### Screenshot

![Day 19 Staging Version 1](screenshots/13-day19-staging-v1.png)

---

## 11. Version 2 Deployment

The application was updated from Version 1 to Version 2.

The following line:

```python
return "Staging Application v1"
```

was changed to:

```python
return "Staging Application v2"
```

The updated application was rebuilt and redeployed:

```bash
docker compose up -d --build
```

The new version was verified using:

```bash
curl http://localhost:5001
```

Expected output:

```text
Staging Application v2
```

The health endpoint remained:

```bash
curl http://localhost:5001/health
```

Expected output:

```text
healthy
```

### Screenshot

![Day 19 Staging Version 2](screenshots/14-day19-staging-v2.png)

---

## 12. Rollback

To demonstrate rollback, the application was changed from Version 2 back to Version 1.

The application code was changed from:

```python
return "Staging Application v2"
```

back to:

```python
return "Staging Application v1"
```

The container was rebuilt and redeployed:

```bash
docker compose up -d --build
```

The application was then tested:

```bash
curl http://localhost:5001
```

Expected output:

```text
Staging Application v1
```

This demonstrated a basic deployment rollback workflow.

### Rollback Flow

```text
v1
 ↓
Deploy
 ↓
v2
 ↓
Change / Problem
 ↓
Rollback
 ↓
v1
```

### Screenshot

![Day 19 Rollback](screenshots/15-day19-rollback.png)

---

## 13. Health Check

The `/health` endpoint provides a simple application health check.

Command:

```bash
curl http://localhost:5001/health
```

Expected response:

```text
healthy
```

Health checks are important in deployment pipelines because they can help determine whether a newly deployed application is responding correctly.

---

## 14. GitHub Actions Deployment Simulation

A GitHub Actions workflow was created at:

```text
.github/workflows/phase4-day19-deployment.yml
```

The workflow performs the following steps:

```text
Git Push
   ↓
GitHub Actions
   ↓
Checkout Repository
   ↓
Build Docker Image
   ↓
Deployment Simulation
   ↓
Health Check
```

Workflow:

```yaml
name: Phase 4 - Day 19 - Deployment

on:
  push:
    branches:
      - main
    paths:
      - "phase-04-cicd/day-19-deployment-rollback/**"
      - ".github/workflows/phase4-day19-deployment.yml"

  pull_request:
    branches:
      - main
    paths:
      - "phase-04-cicd/day-19-deployment-rollback/**"
      - ".github/workflows/phase4-day19-deployment.yml"

jobs:
  staging:
    name: Staging Deployment Simulation
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Build staging image
        run: |
          docker build \
            -t staging-app:${{ github.sha }} \
            phase-04-cicd/day-19-deployment-rollback

      - name: Deployment
        run: |
          echo "Deploying version ${{ github.sha }}"
          echo "Staging deployment successful"

      - name: Health check
        run: |
          echo "Running health check..."
          echo "Application is healthy"
```

---

## 15. Deployment Simulation

The GitHub Actions workflow builds the Docker image using the commit SHA as the image tag.

Example:

```text
staging-app:<commit-sha>
```

The workflow then simulates a staging deployment and performs a basic health-check simulation.

### Important Note

This workflow is a **GitHub-hosted runner deployment simulation**.

It does not deploy the application to an actual remote production or staging server.

A real remote deployment can be implemented later using a cloud server, VM, SSH-based deployment, container registry, or another deployment platform.

---

## 16. Deployment Strategies

### Blue/Green Deployment

Blue/Green deployment uses two environments.

```text
Blue  → Current Version
Green → New Version
```

Traffic can be switched from the old version to the new version after validation.

If the new version fails:

```text
Green
  ↓
Failure
  ↓
Switch back
  ↓
Blue
```

---

### Canary Deployment

Canary deployment gradually releases a new version to a small percentage of users before increasing traffic.

Example:

```text
v1 → 90% traffic
v2 → 10% traffic
```

If the new version is healthy:

```text
v1 → 50%
v2 → 50%
```

Eventually:

```text
v2 → 100%
```

If problems occur, traffic can be returned to Version 1.

---

## 17. Stop and Remove the Staging Container

After completing the lab, the staging environment can be stopped using:

```bash
docker compose down
```

To verify the containers:

```bash
docker compose ps
```

---

## 18. Key Takeaway

This module demonstrated a basic but practical deployment and rollback workflow using Docker Compose.

The complete process was:

```text
Application Code
      ↓
Docker Image
      ↓
Staging Deployment
      ↓
Version 1
      ↓
Version 2
      ↓
Health Check
      ↓
Rollback
      ↓
Version 1
```

The exercise showed why deployment automation and rollback strategies are important in DevSecOps environments.

---

## 19. Screenshots

### Staging Version 1

![Staging Version 1](screenshots/13-day19-staging-v1.png)

### Staging Version 2

![Staging Version 2](screenshots/14-day19-staging-v2.png)

### Rollback

![Rollback](screenshots/15-day19-rollback.png)

---

## 20. Conclusion

Day 19 provided practical experience with application deployment, staging environments, Docker Compose, version updates, health checks, and rollback.

The exercise also introduced important deployment strategies such as Blue/Green and Canary deployment.

The GitHub Actions workflow further demonstrated how Docker image building and deployment validation can be integrated into a CI/CD pipeline.

This knowledge provides a foundation for implementing more advanced staging, production, automated deployment, and rollback strategies in the final DevSecOps project.

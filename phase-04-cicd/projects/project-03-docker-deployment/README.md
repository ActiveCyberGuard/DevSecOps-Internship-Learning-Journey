# Project 03 — Docker Deployment & Rollback

## Test Lab by MD.AL-AMIN

This project demonstrates containerized application deployment with Docker and a simulated rollback mechanism using GitHub Actions.

---

## Objective

The objective is to understand how a containerized application can move through a basic deployment pipeline and how rollback can be triggered when deployment fails.

---

## Technologies

* Python
* Flask
* Docker
* Docker Compose
* GitHub Actions

---

## Project Structure

```text
project-03-docker-deployment/
├── app/
│   ├── app.py
│   └── requirements.txt
├── Dockerfile
├── docker-compose.yml
└── README.md
```

---

## Application Endpoints

### Home

```text
/
```

Displays the application version.

### Health

```text
/health
```

Returns:

```text
healthy
```

### Version

```text
/version
```

Displays the deployed application version.

---

## Run Locally

Build:

```bash
docker compose build
```

Start:

```bash
docker compose up -d
```

Check:

```bash
docker compose ps
```

Application:

```text
http://localhost:5002
```

Health:

```text
http://localhost:5002/health
```

Version:

```text
http://localhost:5002/version
```

Stop:

```bash
docker compose down
```

---

## CI/CD Pipeline

```text
Git Push
   ↓
Checkout
   ↓
Docker Build
   ↓
Deployment
   ↓
Health Check
   ↓
Success
```

Rollback flow:

```text
Deployment
    ↓
Failure
    ↓
Rollback
    ↓
Previous Stable Version
```

---

## Learning Outcome

This project demonstrates Docker image creation, container deployment concepts, health checks, deployment automation, and rollback strategies.

---

## Author

**MD.AL-AMIN**

**Test Lab by MD.AL-AMIN**

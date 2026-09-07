#  Day 18 — Docker CI

## 1. Objective

The objective of Day 18 was to connect Docker containerization knowledge from Phase 3 with CI/CD using GitHub Actions.

The main goal was to automate Docker image building through a CI pipeline.

### CI Flow

```text
Application
    ↓
Dockerfile
    ↓
Docker Build
    ↓
GitHub
    ↓
GitHub Actions
    ↓
Docker CI
```

---

# 2. Topics Learned

During this module, I learned:

* Docker in CI/CD
* Dockerfile
* Docker Image Building
* Docker Container Execution
* Flask Application Containerization
* Docker Health Endpoint
* `.dockerignore`
* GitHub Actions
* Automated Docker Builds
* Container CI Pipeline

---

# 3. Project Structure

```text
day-18-container-cicd/
│
├── app/
│   ├── app.py
│   └── requirements.txt
│
├── screenshots/
│   ├── 09-day18-docker-build.png
│   ├── 10-day18-container-running.png
│   ├── 11-day18-health-check.png
│   └── 12-day18-docker-ci-success.png
│
├── Dockerfile
├── .dockerignore
└── README.md
```

GitHub Actions workflow:

```text
.github/
└── workflows/
    └── phase4-day18-docker-ci.yml
```

---

# 4. Flask Application

A simple Flask application was created and containerized using Docker.

The application provides two endpoints.

### Main endpoint

```text
/
```

Response:

```text
DevSecOps Container CI/CD Application
```

### Health endpoint

```text
/health
```

Response:

```text
healthy
```

---

# 5. Application Code

The Flask application runs on:

```text
0.0.0.0:5000
```

The application is designed to run inside a Docker container.

---

# 6. Requirements

The application uses Flask.

### `requirements.txt`

```text
Flask==3.0.3
```

Dependencies can be installed using:

```bash
py -m pip install -r app/requirements.txt
```

---

# 7. Dockerfile

The Dockerfile uses the official Python 3.12 Slim image.

```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]
```

The Dockerfile performs the following steps:

1. Uses Python 3.12 Slim.
2. Creates `/app` as the working directory.
3. Copies the dependency file.
4. Installs Flask.
5. Copies the application source code.
6. Exposes port `5000`.
7. Starts the Flask application.

---

# 8. Docker Ignore

The `.dockerignore` file prevents unnecessary files from being included in the Docker build context.

```text
.git
.github
__pycache__
*.pyc
.pytest_cache
README.md
```

---

# 9. Local Docker Build

The Docker image was built locally using:

```bash
docker build -t devsecops-container:1.0 .
```

The image was verified using:

```bash
docker images
```

---

# 10. Run Docker Container

The container was started using:

```bash
docker run -d -p 5000:5000 --name devsecops-container devsecops-container:1.0
```

The running container was verified using:

```bash
docker ps
```

---

# 11. Application Testing

The main application endpoint was tested using:

```bash
curl http://localhost:5000
```

Expected response:

```text
DevSecOps Container CI/CD Application
```

The health endpoint was tested using:

```bash
curl http://localhost:5000/health
```

Expected response:

```text
healthy
```

---

# 12. GitHub Actions Docker CI

The GitHub Actions workflow is:

```text
.github/workflows/phase4-day18-docker-ci.yml
```

The workflow automatically builds the Docker image when relevant Day 18 files are pushed to the `main` branch or when a Pull Request targets the `main` branch.

### CI Pipeline

```text
Checkout Repository
        ↓
Docker Build
        ↓
Docker Image Created
        ↓
CI Success
```

The Docker image is tagged using the GitHub commit SHA:

```text
devsecops-container:${{ github.sha }}
```

---

# 13. Docker Build Validation

The GitHub Actions workflow validates that the Dockerfile can successfully build the application image in a clean CI environment.

This helps identify:

* Invalid Dockerfiles
* Missing application files
* Missing dependencies
* Incorrect build paths
* Docker build configuration problems

---

# 14. Stop and Remove Container

After local testing, the container was stopped:

```bash
docker stop devsecops-container
```

Then removed:

```bash
docker rm devsecops-container
```

---

# 15. Screenshots

## Docker Build

![Docker Build](screenshots/09-day18-docker-build.png)

## Container Running

![Container Running](screenshots/10-day18-container-running.png)

## Health Check

![Health Check](screenshots/11-day18-health-check.png)

## GitHub Actions Docker CI

![Docker CI Success](screenshots/12-day18-docker-ci-success.png)

---

# 16. Key Takeaway

Day 18 demonstrated how Docker can be integrated into a CI/CD pipeline.

The Docker image was first built and tested locally, and then the same Docker build process was automated using GitHub Actions.

The main concept is:

```text
Application
    ↓
Dockerfile
    ↓
Docker Build
    ↓
GitHub Actions
    ↓
Automated Docker CI
```

---

# 17. Conclusion

Day 18 provided practical experience with integrating Docker and GitHub Actions.

I learned how to:

* Containerize a Flask application
* Build a Docker image
* Run a Docker container
* Test a containerized application
* Implement a health endpoint
* Use `.dockerignore`
* Configure GitHub Actions
* Automate Docker image builds
* Validate Docker builds through CI

This practical implementation connects the Docker skills learned in Phase 3 with the CI/CD concepts introduced in Phase 4.

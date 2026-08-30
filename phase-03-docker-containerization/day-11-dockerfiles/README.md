# Day 11 — Dockerfiles

## Objective

To learn how Dockerfiles are used to create reproducible
container images and to understand basic practices for
building efficient and secure images.

---

## Topics Learned

- Dockerfiles
- Base images
- `FROM`
- `COPY`
- `RUN`
- `CMD`
- `ENTRYPOINT`
- `EXPOSE`
- `.dockerignore`
- Image building
- Application containerization
- Non-root execution concept

---

## Commands Practiced

| Command | Purpose | Why I Used It |
|---|---|---|
| `docker build` | Build a Docker image | To create an application image |
| `docker images` | List images | To verify the created image |
| `docker run` | Run a container | To execute the application |
| `docker ps` | Check running containers | To verify runtime status |
| `docker logs` | View logs | To troubleshoot the application |
| `docker inspect` | Inspect configuration | To understand image/container settings |

---

# Practical Project

I created a small static web application and containerized it
using a Dockerfile.

---

## Application

The application is located at:

```text
app/index.html
```

---

## Build the Image

```bash
docker build -t docker-day11:v1 .
```

The command builds a Docker image from the Dockerfile in the
current directory.

---

## Check the Image

```bash
docker images
```

---

## Run the Container

```bash
docker run -d --name docker-day11 -p 8081:80 docker-day11:v1
```

---

## Test the Application

```bash
curl http://localhost:8081
```

The application can also be accessed from:

```text
http://localhost:8081
```

---

## Dockerfile

The Dockerfile uses a lightweight Nginx base image and copies
the application file into the Nginx web directory.

---

## `.dockerignore`

The `.dockerignore` file prevents unnecessary files from being
sent to the Docker build context.

Example:

```text
.git
.gitignore
README.md
screenshots/
*.log
.env
```

---

## Security Learning

I learned that Docker images should contain only the components
required by the application.

I also learned about:

- Minimal base images
- Smaller build contexts
- Non-root execution
- Avoiding unnecessary files
- Reproducible image builds

---

## Troubleshooting

I used the following commands when checking the container:

```bash
docker ps
docker logs docker-day11
docker inspect docker-day11
```

---

## Evidence

Screenshots are stored in:

```text
screenshots/
```

---

## Key Learning

Dockerfiles provide a repeatable method for building application
images and help standardize application deployment environments.

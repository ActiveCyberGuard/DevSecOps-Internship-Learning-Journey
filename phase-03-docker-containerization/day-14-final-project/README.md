# Day 14 — Final Docker Project

# Secure Containerized Web Application

## 1. Project Overview

This project demonstrates the practical application of the
Docker and Containerization concepts learned throughout Phase 3.

The project packages a web application into a Docker container
and operates it using Docker Compose.

The project also demonstrates basic container security practices,
health monitoring, network isolation, persistent data handling,
and image vulnerability scanning.

---

## 2. Project Objectives

The main objectives of this project were:

- Containerize a web application
- Build a Docker image
- Use Docker Compose
- Configure Nginx
- Implement healthchecks
- Demonstrate persistent data
- Use network isolation
- Apply basic container security practices
- Scan the Docker image for vulnerabilities
- Document the complete practical workflow

---

## 3. Technologies Used

- Docker
- Docker Compose
- Nginx
- Trivy
- Git
- GitHub
- Git Bash

---

## 4. Project Architecture

```text
                    User
                      |
                      v
              Nginx Web Container
                      |
                      v
             Docker Network
                /         \
               /           \
      Application        Persistent
         Files              Data
```

---

## 5. Project Structure

```text
day-14-final-project/
│
├── README.md
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
│
├── app/
│   └── index.html
│
├── nginx/
│   └── nginx.conf
│
├── data/
│
└── screenshots/
```

---

## 6. Application

The application is a simple static web application designed
to demonstrate Docker containerization.

Application file:

```text
app/index.html
```

---

## 7. Docker Image

The Dockerfile uses a lightweight Nginx image and copies the
application into the Nginx web directory.

---

## 8. Build the Project

```bash
docker compose build
```

This command builds the application image using the Dockerfile.

---

## 9. Start the Application

```bash
docker compose up -d
```

The `-d` option runs the services in detached mode.

---

## 10. Check Service Status

```bash
docker compose ps
```

This command was used to verify that the application container
was running successfully.

---

## 11. Access the Application

Open the following URL:

```text
http://localhost:8085
```

The application should display the project information.

---

## 12. Check Logs

```bash
docker compose logs
```

Logs were checked to understand application behavior and
assist with troubleshooting.

---

## 13. Healthcheck

A Docker healthcheck was configured to verify whether the
web service is responding correctly.

This allows the container health status to be monitored.

---

## 14. Network Isolation

The application uses a dedicated Docker network.

The network can be inspected using:

```bash
docker network ls
```

and:

```bash
docker network inspect NETWORK_NAME
```

---

## 15. Persistent Data

A data directory is included in the project to demonstrate
persistent data handling.

Persistent storage helps keep important data independent
from the lifecycle of an individual container.

---

## 16. Security Practices

The project applies several basic container security practices:

- Minimal base image
- Reduced Docker build context
- `.dockerignore`
- Network isolation
- Health monitoring
- Read-only filesystem concept
- Resource management
- Image vulnerability scanning
- Security configuration inspection

---

## 17. Image Vulnerability Scanning

Trivy was used to scan the Docker image.

Example:

```bash
trivy image IMAGE_NAME
```

The scan results were reviewed to identify known vulnerabilities
and determine possible remediation actions.

---

## 18. Container Inspection

The following command was used to inspect the container:

```bash
docker inspect secure-web-app
```

This helped verify:

- Container configuration
- Network configuration
- Mounts
- Healthcheck
- Runtime settings

---

## 19. Troubleshooting

The following commands were used during troubleshooting:

```bash
docker compose ps
docker compose logs
docker inspect secure-web-app
docker network ls
docker images
```

These commands helped verify the state of the application,
containers, images, and network.

---

## 20. Stop the Project

```bash
docker compose down
```

This command stops and removes the Docker Compose application
environment.

---

## 21. Practical Learning Outcome

Through this project, I learned how to build and operate a
containerized web application using Docker and Docker Compose.

I also learned that container security requires more than
vulnerability scanning.

Secure container operation also requires attention to:

- Image selection
- User privileges
- Filesystem access
- Network isolation
- Health monitoring
- Resource usage
- Runtime configuration

---

## 22. Evidence

Screenshots demonstrating the practical work are stored in:

```text
screenshots/
```

Important evidence includes:

- Image build
- Container startup
- Container status
- Browser output
- Healthcheck
- Logs
- Network configuration
- Security inspection
- Trivy scan

---

## 23. Conclusion

This project provided practical experience in Docker
containerization and basic container security.

It demonstrated how a web application can be packaged,
operated, monitored, and reviewed using modern container
management practices.

This practical work helped connect the theoretical concepts
learned during Phase 3 with a real containerized application.

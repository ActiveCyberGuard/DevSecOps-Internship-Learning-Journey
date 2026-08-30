# Day 12 — Docker Compose

## Objective

To learn how Docker Compose can be used to define and operate
multi-container application environments.

---

## Topics Learned

- Docker Compose
- Services
- Networks
- Volumes
- Environment variables
- Healthchecks
- Service dependencies
- Multi-container applications

---

## Commands Practiced

| Command | Purpose | Why I Used It |
|---|---|---|
| `docker compose up -d` | Start services | To launch the application stack |
| `docker compose ps` | Show service status | To verify running services |
| `docker compose logs` | Show logs | To troubleshoot services |
| `docker compose down` | Stop and remove services | To clean up the environment |
| `docker compose config` | Validate configuration | To check Compose configuration |

---

## Practical Work

I created a Docker Compose environment containing an application
service and a proxy layer.

The services communicate through a dedicated Docker network.

---

## Start the Application

```bash
docker compose up -d
```

---

## Check Services

```bash
docker compose ps
```

---

## Check Logs

```bash
docker compose logs
```

---

## Test the Application

```bash
curl http://localhost:8082
```

Browser:

```text
http://localhost:8082
```

---

## Healthcheck

A healthcheck was configured to verify whether the application
service is responding correctly.

---

## Networking

The services communicate through an isolated Docker network.

This demonstrates how Docker can provide logical network
separation between application components.

---

## Volumes

Docker volumes or bind mounts can be used to keep data outside
the lifecycle of a container.

---

## Environment Variables

Environment variables can be used to keep application
configuration separate from the container image.

Sensitive information should never be committed to GitHub.

---

## Stop the Application

```bash
docker compose down
```

---

## What I Learned

I learned how Docker Compose simplifies the management of
multi-container applications.

I also learned how services, networks, volumes, dependencies,
and healthchecks can be defined through a Compose configuration.

---

## Evidence

Screenshots are stored inside:

```text
screenshots/
```

---

## Key Learning

Docker Compose provides a structured way to define and operate
multiple related containers as one application environment.

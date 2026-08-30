# Day 10 — Container Fundamentals (Docker)

 
🎯 **Phase:** Phase 3 — Docker & Containerization
 

---

## 1. Objective

To understand Docker containers, images, image layers, container lifecycle, port mapping, volumes, registries, and the conceptual differences between containers and virtual machines.

---

## 2. Topics Learned

- Docker images
- Docker containers
- Image layers
- Container lifecycle
- Container registries
- Containers vs Virtual Machines
- Port mapping
- Volumes
- Container inspection
- Namespaces and cgroups concepts

---

## 3. Commands Practiced

| Command | Purpose | Why I Used It |
|---|---|---|
| `docker --version` | Check Docker version | To verify Docker installation |
| `docker pull` | Download an image | To obtain a container image |
| `docker images` | List images | To inspect locally available images |
| `docker run` | Create and run a container | To launch an application container |
| `docker ps` | List running containers | To monitor active containers |
| `docker ps -a` | List all containers | To inspect stopped containers |
| `docker stop` | Stop a container | To safely stop a running container |
| `docker start` | Start a stopped container | To restart an existing container |
| `docker rm` | Remove a container | To clean up unused containers |
| `docker rmi` | Remove an image | To clean up unused images |
| `docker inspect` | Inspect Docker objects | To understand container configuration |
| `docker logs` | View container logs | To troubleshoot application behavior |
| `docker exec` | Execute a command in a container | To inspect a running container |
| `docker port` | Show port mappings | To verify exposed ports |

---

## 4. Why This Matters (DevSecOps Context)

Containers are the standard unit of deployment in almost every modern CI/CD pipeline. Before any security scanning (Trivy), orchestration (Kubernetes), or automated delivery can happen, an engineer needs to understand how an image becomes a running process on a host. Understanding the container lifecycle (create → run → stop → remove) is also the foundation for later security topics like non-root users, read-only filesystems, and image hardening — none of that makes sense without first understanding what a container actually is.

---

## 5. Real-World Use Case

- Running a web server (like Nginx) in an isolated, reproducible environment that behaves identically on a developer's laptop, a CI runner, and a production server.
- Quickly spinning up a throwaway service (e.g. a database) for local testing without installing it directly on the host machine.
- Inspecting a misbehaving container in production with `docker logs` and `docker inspect` to diagnose an issue without SSHing into the container itself.

---

## 6. Drawbacks / Limitations

- Containers share the host's OS kernel, so they are **not** as isolated as virtual machines — a kernel-level vulnerability can potentially affect all containers on that host.
- Running containers as `root` inside the container (the default in many base images) increases the security risk if the container is compromised.
- Data inside a container is ephemeral by default — anything not stored in a volume is lost when the container is removed.
- Image layers can silently bloat over time if the Dockerfile isn't optimized, increasing attack surface and build time.

---

## 7. Practical Work Done

**1. Verify Docker installation**
```bash
docker --version
```

**2. Pull an image**
```bash
docker pull nginx
```

**3. List local images**
```bash
docker images
```

**4. Run a container**
```bash
docker run -d --name nginx-lab -p 8080:80 nginx
```

**5. Check running containers**
```bash
docker ps
```

**6. Check container logs**
```bash
docker logs nginx-lab
```

**7. Inspect the container**
```bash
docker inspect nginx-lab
```

**8. Test the application**

Open in browser: `http://localhost:8080`

Or via terminal:
```bash
curl http://localhost:8080
```

**9. Stop the container**
```bash
docker stop nginx-lab
```

**10. Remove the container**
```bash
docker rm nginx-lab
```

**📸 Screenshots:** stored in `screenshots/`

---

## 8. Troubleshooting

Practiced checking container state and configuration using:

```bash
docker ps
docker logs nginx-lab
docker inspect nginx-lab
docker port nginx-lab
```

These commands helped confirm whether the container was running, what it logged on startup, its full configuration, and which host port it was mapped to.

---

## 9. What I Learned

I learned the basic Docker container lifecycle and how images are used to create containers. I also learned how port mapping allows applications running inside containers to be accessed from the host system.

---

 

 

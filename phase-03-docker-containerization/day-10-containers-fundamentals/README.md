# Day 10 — Containers Fundamentals

## Objective

To understand Docker containers, images, layers, registries,
container lifecycle, ports, volumes, and the conceptual
difference between containers and virtual machines.

---

## Topics Learned

- Docker containers
- Docker images
- Image layers
- Container lifecycle
- Container registries
- Containers vs Virtual Machines
- Ports
- Volumes
- Container inspection
- Namespaces and cgroups concepts

---

## Commands Practiced

| Command | Purpose | Why I Used It |
|---|---|---|
| `docker --version` | Check Docker version | To verify Docker installation |
| `docker pull` | Download an image | To obtain an image from a registry |
| `docker images` | List images | To inspect available local images |
| `docker run` | Create and run a container | To launch an application container |
| `docker ps` | Show running containers | To monitor active containers |
| `docker ps -a` | Show all containers | To inspect stopped and running containers |
| `docker stop` | Stop a container | To safely stop a running container |
| `docker start` | Start a stopped container | To restart an existing container |
| `docker rm` | Remove a container | To clean up containers |
| `docker rmi` | Remove an image | To clean up unused images |
| `docker inspect` | Inspect Docker objects | To understand configuration |
| `docker logs` | Display container logs | To troubleshoot containers |
| `docker exec` | Execute commands inside a container | To inspect a running container |
| `docker port` | Show port mappings | To verify exposed ports |

---

## Practical Work

### Step 1 — Check Docker

```bash
docker --version
```

This command was used to verify that Docker was installed and
available in the environment.

---

### Step 2 — Pull an Nginx Image

```bash
docker pull nginx
```

The command downloads the Nginx image from a container registry.

---

### Step 3 — List Images

```bash
docker images
```

This command was used to verify that the Nginx image was
available locally.

---

### Step 4 — Run a Container

```bash
docker run -d --name nginx-lab -p 8080:80 nginx
```

The `-d` option runs the container in detached mode.

The `-p 8080:80` option maps port 8080 on the host to port 80
inside the container.

---

### Step 5 — Check Running Containers

```bash
docker ps
```

This command was used to verify that the Nginx container was
running successfully.

---

### Step 6 — Check Logs

```bash
docker logs nginx-lab
```

Container logs were checked to understand application activity
and assist with troubleshooting.

---

### Step 7 — Inspect the Container

```bash
docker inspect nginx-lab
```

This command provides detailed configuration and runtime
information about the container.

---

### Step 8 — Check Port Mapping

```bash
docker port nginx-lab
```

This command was used to verify the host-to-container port
mapping.

---

### Step 9 — Test the Application

```bash
curl http://localhost:8080
```

The application can also be tested from a web browser:

```text
http://localhost:8080
```

---

### Step 10 — Stop the Container

```bash
docker stop nginx-lab
```

---

### Step 11 — Remove the Container

```bash
docker rm nginx-lab
```

---

## What I Learned

I learned the basic Docker container lifecycle and how Docker
images are used to create containers.

I also learned how port mapping allows applications running
inside containers to be accessed from the host system.

---

## Security Learning

I learned that container isolation depends on operating-system
features such as namespaces and cgroups.

I also learned that containers should be managed carefully
because container configuration, privileges, networking, and
filesystem access can affect security.

---

## Troubleshooting

The following commands were used for basic troubleshooting:

```bash
docker ps
docker logs nginx-lab
docker inspect nginx-lab
docker port nginx-lab
```

---

## Evidence

Practical screenshots are stored inside:

```text
screenshots/
```

---

## Key Learning

Docker provides a consistent way to package and run applications
while providing process isolation and reproducible environments.

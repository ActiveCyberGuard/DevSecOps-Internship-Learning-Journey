# Day 13 — Container Security

## Objective

To understand and practice basic Docker image and container
security techniques.

---

## Topics Learned

- Minimal images
- Non-root execution
- Read-only filesystem
- Linux capabilities concept
- Resource limits
- Container image scanning
- Vulnerability identification
- Vulnerability remediation
- Accepted-risk documentation

---

## Tools Used

- Docker
- Trivy

---

## Image Scanning

I used Trivy to scan a Docker image for known vulnerabilities.

Example:

```bash
trivy image IMAGE_NAME
```

The scan results were reviewed to identify relevant
vulnerabilities.

---

## Container Inspection

```bash
docker inspect CONTAINER_NAME
```

This command was used to inspect container configuration.

---

## Check Container User

```bash
docker exec CONTAINER_NAME id
```

This command helps identify the user under which processes
inside the container are running.

---

## Resource Limits

Example:

```bash
docker run -d \
  --name limited-nginx \
  --memory="256m" \
  --cpus="0.5" \
  nginx:alpine
```

Resource limits help reduce the potential impact of excessive
resource consumption.

---

## Read-only Filesystem

A read-only filesystem can be tested using:

```bash
docker run --rm --read-only nginx:alpine
```

This demonstrates the concept of restricting write access
inside a container filesystem.

---

## Security Practices

During this learning activity, I practiced the following:

- Use minimal base images
- Reduce unnecessary packages
- Avoid running containers with unnecessary privileges
- Use read-only filesystems where practical
- Apply resource limits
- Scan images for vulnerabilities
- Review security findings
- Document accepted risks

---

## Vulnerability Remediation

When vulnerabilities were identified, I reviewed the affected
components and considered appropriate remediation.

Possible remediation actions include:

- Updating the base image
- Updating affected packages
- Rebuilding the image
- Removing unnecessary dependencies

---

## Accepted Risk

Some vulnerabilities may not be immediately removable.

In such cases, the finding should be documented with:

- Vulnerability
- Impact
- Reason it cannot currently be fixed
- Mitigation
- Future remediation plan

---

## What I Learned

I learned that container security is not limited to image
scanning.

Security also requires attention to:

- Image composition
- User privileges
- Filesystem access
- Capabilities
- Resource consumption
- Network configuration
- Runtime configuration

---

## Evidence

Screenshots are stored inside:

```text
screenshots/
```

---

## Key Learning

Container security should be considered throughout the
container lifecycle, from image creation to runtime operation.

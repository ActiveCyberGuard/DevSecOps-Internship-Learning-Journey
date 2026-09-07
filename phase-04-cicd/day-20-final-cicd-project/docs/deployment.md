# Deployment Documentation

## Deployment Process

The CI/CD pipeline follows these stages:

1. Developer pushes code to GitHub.
2. GitHub Actions starts the pipeline.
3. Automated tests are executed.
4. Code quality checks are performed.
5. Docker image is built.
6. Trivy scans the container image.
7. The image is published to GitHub Container Registry.
8. Staging deployment is simulated.
9. Application health is validated.

## Container Image

Each container image is tagged using the Git commit SHA.

Example:

```text
ghcr.io/OWNER/devsecops-demo:<commit-sha>
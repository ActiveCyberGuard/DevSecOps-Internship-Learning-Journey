# CI/CD Architecture

## Overview

This project implements a secure end-to-end DevSecOps CI/CD pipeline using GitHub Actions.

## Pipeline Flow

```text
Developer
   ↓
Git Push / Pull Request
   ↓
Automated Tests
   ↓
Code Quality / Lint
   ↓
Docker Build
   ↓
Trivy Security Scan
   ↓
GitHub Container Registry
   ↓
Staging Deployment
   ↓
Health Check
   ↓
Success / Rollback


Technologies
Git
GitHub
GitHub Actions
Python
Flask
Pytest
Flake8
Docker
Docker Compose
Trivy
GitHub Container Registry
Security Controls
Automated application testing
Code linting
Container vulnerability scanning
Immutable image tagging using Git commit SHA
GitHub Actions permissions
Deployment health validation
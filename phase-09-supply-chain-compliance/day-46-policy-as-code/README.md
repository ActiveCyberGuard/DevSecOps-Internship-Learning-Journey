# Day 46 — Security Policies and Compliance

## Objectives
Use policy-as-code to reject insecure Kubernetes settings.

## Tools
Conftest and Rego/OPA.

## Policies
- Reject privileged containers.
- Reject mutable `latest` image tags.
- Require `runAsNonRoot` in this exercise.

## Evidence
Actual test output and version information are recorded in `reports/evidence-notes.md`.

# Rollback Documentation

## Purpose

Rollback is used when a newly deployed version fails validation or introduces an application problem.

## Rollback Flow

```text
New Version
    ↓
Deployment
    ↓
Health Check
    ↓
Failure
    ↓
Rollback
    ↓
Previous Stable Version
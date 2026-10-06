# Day 37 — Monitoring & Observability Fundamentals

 

## Overview
Basic concepts of Monitoring and Observability: how to observe the health, performance, and behavior of a system/application.

## Objectives
- Understand Monitoring
- Understand Observability
- Understand Metrics, Logs, Traces
- Understand SLI, SLO, SLA
- Understand Health Checks
- Practice basic monitoring with Docker

## What is Monitoring?
Monitoring is regularly observing the health and performance of a system, server, container, or application.

```
CPU Usage     -> 70%
Memory Usage  -> 60%
Requests      -> 500
Errors        -> 10
Application   -> UP
```

## What is Observability?
Observability is the ability to understand what is happening inside a system by looking at its external output.

Three pillars of observability:
```
Metrics
Logs
Traces
```

## Metrics
Numerical data that shows system performance or behavior.
```
CPU Usage = 75%
Memory Usage = 60%
HTTP Requests = 500
Error Count = 12
```

## Logs
Records of events from an application or system.
```
INFO  Application started
INFO  User request received
ERROR Database connection failed
```

## Traces
Shows how a request travels through different components of a system.
```
User -> Frontend -> API -> Database
```

## SLI / SLO / SLA

| Term | Meaning | Example |
|------|---------|---------|
| SLI (Service Level Indicator) | Actual measured performance | 99.5% requests successful |
| SLO (Service Level Objective) | Target performance | 99.9% availability target |
| SLA (Service Level Agreement) | Agreed commitment between provider and customer | Contractual uptime guarantee |

## Tools Used
Docker, Docker CLI, Git, Git Bash

## Commands Used

| Command | What it does | Why |
|---------|---------------|-----|
| `docker --version` | Shows Docker version | Confirm it's installed |
| `docker ps` | Lists running containers | See what's currently running |
| `docker info` | Shows Docker system info | Check overall Docker status |
| `docker stats` | Live resource usage of containers | Monitor CPU, memory, network, block I/O |

## Practical Exercise
```bash
docker ps
docker stats
```
`docker stats` was used to observe CPU usage, memory usage, network I/O, block I/O, and process info of running containers.

 
```

## Result
Successfully completed the Monitoring and Observability fundamentals lab.

## Git Commit
```bash
git add phase-08-monitoring-observability/day-37-monitoring-fundamentals
git commit -m "feat(monitoring): complete day 37 fundamentals"
git push origin main
```

**Organized By:** MD.AL-AMIN

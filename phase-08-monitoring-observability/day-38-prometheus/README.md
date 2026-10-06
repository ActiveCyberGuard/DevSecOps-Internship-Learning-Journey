# Day 38 — Prometheus Monitoring

 

## Overview
Learned the Prometheus monitoring system and deployed it as a Docker container to practice metrics collection.

## Objectives
- Understand Prometheus and its architecture
- Deploy a Prometheus container
- Write Prometheus configuration
- Understand scrape interval and monitoring targets
- Practice basic PromQL queries
- Verify Prometheus targets

## What is Prometheus?
An open-source monitoring and alerting system. It collects metrics from targets and stores them as time-series data.

## Architecture
```
Application / Target
        |
        | Metrics
        v
   Prometheus
        |
        | PromQL
        v
 Monitoring / Dashboard
```

## Tools
Prometheus, Docker, Git Bash, PromQL

## Project Structure
```
day-38-prometheus/
├── README.md
├── config/
│   └── prometheus.yml
├── notes/
└── screenshots/
```

## Prometheus Configuration
File: `config/prometheus.yml`
```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - "prometheus:9090"
```

## Commands Used

| Command | What it does | Why |
|---------|---------------|-----|
| `docker network create monitoring` | Creates a Docker network | Lets containers reach Prometheus by name |
| `docker run -d --name prometheus --network monitoring -p 9090:9090 -v "$(pwd)/config/prometheus.yml:/etc/prometheus/prometheus.yml" prom/prometheus` | Runs Prometheus with the custom config | Deploy Prometheus |
| `docker ps` | Lists running containers | Confirm Prometheus is running |
| `docker logs prometheus` | Shows container logs | Check for startup errors |

## Prometheus Web UI
```
http://localhost:9090
```

## PromQL Practice

| Query | What it checks |
|-------|-----------------|
| `up` | Target status (1 = up, 0 = down) |
| `scrape_samples_scraped` | Number of samples scraped |
| `prometheus_http_requests_total` | Prometheus's own HTTP request count |

## Target Verification
In the Prometheus UI: `Status -> Targets`. Target should show as `UP`.

 
```

## Result
Successfully deployed Prometheus using Docker and verified monitoring targets and metrics.

## Git Commit
```bash
git add phase-08-monitoring-observability/day-38-prometheus
git commit -m "feat(monitoring): complete day 38 prometheus"
git push origin main
```

**Organized By:** MD.AL-AMIN

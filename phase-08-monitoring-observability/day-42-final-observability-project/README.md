# Day 42 — Final Observability Project

 

## Overview
Phase 8's final project: a Dockerized Flask application, Prometheus monitoring, and Grafana visualization integrated together.

## Objectives
- Deploy a Dockerized web application
- Add a health endpoint and expose application metrics
- Collect metrics with Prometheus and query them with PromQL
- Configure Prometheus as a Grafana data source
- Build a Grafana dashboard
- Configure a monitoring alert rule
- Put together the complete monitoring architecture

## Architecture
```
Browser
   |
   v
Flask App (5000)
   |
 /metrics
   |
   v
Prometheus (9090)
   |
 PromQL
   |
   v
Grafana (3000)
   |
Dashboard
   |
Alerts
```

## Project Structure
```
day-42-final-observability-project/
├── README.md
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── prometheus/
│   ├── prometheus.yml
│   └── alerts.yml
├── grafana/
│   └── dashboards/
├── alerts/
├── docs/
│   └── architecture.md
└── screenshots/
```

## Tools Used
Docker, Docker Compose concepts, Flask, Prometheus, PromQL, Grafana, Git, Git Bash

## Commands Used

| Command | What it does | Why |
|---------|---------------|-----|
| `docker network create monitoring` | Creates a shared network | Lets app, Prometheus, and Grafana reach each other by name |
| `docker build -t devsecops-monitoring-app ./app` | Builds the app image | Package the Flask app |
| `docker run -d --name monitoring-app --network monitoring -p 5000:5000 devsecops-monitoring-app` | Runs the app | Deploy the application |
| `docker run -d --name prometheus --network monitoring -p 9090:9090 -v "$(pwd)/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml" prom/prometheus` | Runs Prometheus with config | Deploy monitoring |
| `docker run -d --name grafana --network monitoring -p 3000:3000 grafana/grafana` | Runs Grafana | Deploy visualization |
| `docker ps` | Lists running containers | Confirm `monitoring-app`, `prometheus`, `grafana` are up |
| `docker logs <container>` | Shows container logs | Troubleshoot startup issues |
| `docker network inspect monitoring` | Shows network details | Verify connectivity between containers |

## Verification

| Service | URL | Expected |
|---------|-----|----------|
| App home | `http://localhost:5000` | App response |
| App health | `http://localhost:5000/health` | `healthy` |
| App metrics | `http://localhost:5000/metrics` | Prometheus metrics output |
| Prometheus | `http://localhost:9090` -> Status -> Targets | App target `UP` |
| Grafana | `http://localhost:3000` | Dashboard with live panels |

## PromQL Used
```promql
up
app_requests_total
```

## Grafana Data Source
`Connections -> Data Sources -> Add data source -> Prometheus`
URL: `http://prometheus:9090`, then `Save & Test`.

## Alert Rule
```yaml
groups:
  - name: devsecops-alerts
    rules:
      - alert: PrometheusTargetDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Monitoring target is down"
          description: "A monitored target is unavailable."
```

## Troubleshooting Checks
- Container status (`docker ps`)
- Application logs
- Prometheus targets and queries
- Grafana data source connection
- Docker network connectivity

 
```

## Result
Successfully built an integrated monitoring environment: Flask app + Prometheus + Grafana + alerting. The app exposes metrics, Prometheus collects and queries them, Grafana visualizes the data, and the alert rule detects target failures.

## Viva Summary

| Question | Answer |
|----------|--------|
| What is Prometheus? | Open-source monitoring/alerting system for collecting and querying time-series metrics |
| What is Grafana? | Visualization and dashboard platform for monitoring data |
| What is PromQL? | Prometheus Query Language, used to query metrics |
| What is `/metrics`? | An endpoint exposing app metrics in a format Prometheus can scrape |
| What is an Alert? | Generated when a predefined monitoring condition becomes true |

## Git Commit
```bash
git add phase-08-monitoring-observability/day-42-final-observability-project
git commit -m "feat(monitoring): complete day 42 final observability project"
git push origin main
```

**Organized By:** MD.AL-AMIN

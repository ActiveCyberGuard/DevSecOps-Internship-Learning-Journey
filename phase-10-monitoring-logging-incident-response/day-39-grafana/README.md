# Day 39 — Grafana Visualization

 

## Overview
Used Grafana to visualize Prometheus-collected metrics and build a dashboard.

## Objectives
- Understand Grafana
- Deploy a Grafana container
- Configure Prometheus as a Grafana data source
- Visualize Prometheus metrics
- Create a dashboard and a metrics panel

## What is Grafana?
An open-source visualization and dashboard platform. It takes data from monitoring data sources and turns it into charts, graphs, and dashboards.

## Architecture
```
Application
     |
     v
 Prometheus
     |
     | Metrics
     v
  Grafana
     |
     v
Dashboard
```

## Tools
Grafana, Prometheus, Docker, Git Bash, PromQL

## Project Structure
```
day-39-grafana/
├── README.md
├── dashboards/
├── notes/
└── screenshots/
```

## Commands Used

| Command | What it does | Why |
|---------|---------------|-----|
| `docker run -d --name grafana --network monitoring -p 3000:3000 grafana/grafana` | Runs Grafana on the same network as Prometheus | Deploy Grafana so it can reach Prometheus |
| `docker ps` | Lists running containers | Confirm Grafana is running |
| `docker logs grafana` | Shows container logs | Check for startup errors |

## Grafana Web UI
```
http://localhost:3000
```

## Add Prometheus Data Source
In Grafana: `Connections -> Data Sources -> Add data source -> Prometheus`

Prometheus URL:
```
http://prometheus:9090
```
Then click `Save & Test`.

## Create Dashboard
Create a new dashboard and add a visualization.

Example PromQL queries:
```
up
prometheus_http_requests_total
```

 
```

## Result
Successfully connected Grafana with Prometheus and created a monitoring dashboard.

## Git Commit
```bash
git add phase-08-monitoring-observability/day-39-grafana
git commit -m "feat(monitoring): complete day 39 grafana"
git push origin main
```

**Organized By:** MD.AL-AMIN

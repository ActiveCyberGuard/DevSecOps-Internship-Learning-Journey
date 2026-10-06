# Phase 8 — Monitoring & Observability

 

Building a complete monitoring and observability stack: a Dockerized Flask app, Prometheus metrics collection, Grafana dashboards, and alerting.

## Days

| Day | Topic | Folder |
|-----|-------|--------|
| 37 | Monitoring & Observability Fundamentals | [day-37-monitoring-fundamentals](./day-37-monitoring-fundamentals) |
| 38 | Prometheus Monitoring | [day-38-prometheus](./day-38-prometheus) |
| 39 | Grafana Visualization | [day-39-grafana](./day-39-grafana) |
| 40 | Monitoring Alerting | [day-40-alerting](./day-40-alerting) |
| 41 | Application Monitoring | [day-41-application-monitoring](./day-41-application-monitoring) |
| 42 | Final Observability Project | [day-42-final-observability-project](./day-42-final-observability-project) |

## Tools Used

- **Docker** - runs the app, Prometheus, and Grafana as containers
- **Flask + prometheus-client** - application exposing `/health` and `/metrics`
- **Prometheus** - collects and queries metrics (PromQL)
- **Grafana** - visualizes metrics as dashboards
- **Alertmanager-style Prometheus rules** - detects target failures

## Final Architecture

```
Browser -> Flask App (5000) -> /metrics -> Prometheus (9090) -> PromQL -> Grafana (3000) -> Dashboard -> Alerts
```

## Core Concepts

| Term | Meaning |
|------|---------|
| Metrics | Numerical data on performance/behavior |
| Logs | Event records from the application |
| Traces | How a request travels across components |
| SLI | Actual measured performance |
| SLO | Target performance |
| SLA | Agreed commitment with the customer |

## Folder Structure

```
phase-08-monitoring-observability/
├── README.md
├── day-37-monitoring-fundamentals/
├── day-38-prometheus/
├── day-39-grafana/
├── day-40-alerting/
├── day-41-application-monitoring/
└── day-42-final-observability-project/
```

Each day folder contains: `README.md`, configs/manifests, `notes/`, and `screenshots/`.

## Result

By the end of Phase 8, metrics flow from the application through Prometheus into Grafana dashboards, with an alert rule in place to detect when a monitored target goes down.


**Organized By:** MD.AL-AMIN

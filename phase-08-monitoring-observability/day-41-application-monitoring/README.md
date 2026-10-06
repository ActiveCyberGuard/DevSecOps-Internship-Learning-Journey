# Day 41 — Application Monitoring

 

## Overview
Built a Flask web application and monitored it with Prometheus by exposing Prometheus-compatible metrics from the app.

## Objectives
- Build a Flask application
- Add a health endpoint
- Add a Prometheus metrics endpoint
- Use the `prometheus_client` library
- Build a Docker image for the app
- Run the application container
- Monitor the app with Prometheus

## Architecture
```
Flask Application
       |
       +-- /
       +-- /health
       +-- /metrics
              |
              v
         Prometheus
```

## Project Structure
```
day-41-application-monitoring/
├── README.md
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── config/
│   └── prometheus.yml
├── notes/
└── screenshots/
```

## Application
File: `app/app.py`
```python
from flask import Flask
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

REQUEST_COUNT = Counter(
    "app_requests_total",
    "Total application requests"
)


@app.route("/")
def home():
    REQUEST_COUNT.inc()
    return "DevSecOps Monitoring App"


@app.route("/health")
def health():
    REQUEST_COUNT.inc()
    return "healthy"


@app.route("/metrics")
def metrics():
    return generate_latest(), 200, {
        "Content-Type": "text/plain"
    }


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

## Requirements
File: `app/requirements.txt`
```
Flask
prometheus-client
```

## Dockerfile
File: `app/Dockerfile`
```dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

## Commands Used

| Command | What it does | Why |
|---------|---------------|-----|
| `docker build -t devsecops-monitoring-app .` | Builds the app image (run from the `app` directory) | Package the app into a container image |
| `docker run -d --name monitoring-app --network monitoring -p 5000:5000 devsecops-monitoring-app` | Runs the app on the `monitoring` network | So Prometheus can reach it by name |
| `docker ps` | Lists running containers | Confirm the app is running |
| `docker logs monitoring-app` | Shows container logs | Check for startup errors |

## Application URLs

| URL | Expected result |
|-----|-------------------|
| `http://localhost:5000` | Home page |
| `http://localhost:5000/health` | `healthy` |
| `http://localhost:5000/metrics` | Prometheus metrics output |

## Application Metric
The app exposes `app_requests_total`, a counter of total application requests.

 

## Result
Successfully created a Dockerized Flask application and exposed Prometheus-compatible application metrics.

## Git Commit
```bash
git add phase-08-monitoring-observability/day-41-application-monitoring
git commit -m "feat(monitoring): complete day 41 application monitoring"
git push origin main
```
**Organized By:** MD.AL-AMIN

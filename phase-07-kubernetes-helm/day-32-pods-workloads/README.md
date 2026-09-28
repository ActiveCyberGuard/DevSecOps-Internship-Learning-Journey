# Day 32 — Pods & Workloads

 

## What
Deploy an Nginx web app, scale it, expose it with a Service, and practice breaking and fixing a selector.

## Concepts

| Object | Role |
|--------|------|
| Pod | Runs the container |
| ReplicaSet | Keeps the desired number of Pods running |
| Deployment | Manages ReplicaSets, updates, and scaling |
| Service | Stable network endpoint for a set of Pods |
| Label / Selector | Defines which Pods a Service targets |

## Files
- `manifests/deployment.yaml` - `nginx:alpine`, 2 replicas
- `manifests/service.yaml` - NodePort Service with selector `app: devsecops-web`

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `kubectl apply -f manifests/deployment.yaml` | Creates the Deployment | Deploy the app |
| `kubectl get deployments` | Lists Deployments | Check ready replicas |
| `kubectl get pods` | Lists Pods | Confirm Pods are Running |
| `kubectl apply -f manifests/service.yaml` | Creates the Service | Expose the app |
| `kubectl get svc` | Lists Services | See the NodePort/port |
| `minikube service devsecops-web-service` | Opens the Service in the browser | Verify the app works |
| `minikube service devsecops-web-service --url` | Prints the Service URL | Open it manually in a browser |
| `kubectl scale deployment devsecops-web --replicas=4` | Scales to 4 replicas | Test scaling |
| `kubectl get endpoints devsecops-web-service` | Shows backend Pod IPs of the Service | Check the selector matches Pods |

## Troubleshooting Lab: Wrong Selector
1. Changed Service selector from `app: devsecops-web` to `app: wrong-app` and ran `kubectl apply`.
2. `kubectl get endpoints` showed **no endpoints** (no Pod matched).
3. Restored selector to `app: devsecops-web` and applied again.
4. `kubectl get endpoints` showed Pod IPs. Fixed.

## Screenshots
Deployment, pods, service, browser, scaled pods, broken selector, fixed selector.


**Organized By:** MD.AL-AMIN

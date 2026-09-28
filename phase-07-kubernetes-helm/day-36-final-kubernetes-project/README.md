# Day 36 — Final Kubernetes Project

 

## What
Everything from Phase 7 combined: Deployment, Service, Ingress, ConfigMap, PVC, NetworkPolicy, health probes, resource limits, and Helm deployment.

## Architecture
```
Browser -> Ingress (Nginx) -> Service -> Pod 1 / Pod 2 (Nginx)
                                              |
                                       ConfigMap + PVC
```

## Structure
```
├── app/index.html
├── k8s/ (namespace, configmap, deployment, service, ingress, pvc, network-policy)
├── helm/devsecops-web/ (Chart.yaml, values.yaml, templates/)
├── docs/architecture.md
└── screenshots/
```

## Key Configuration

| Feature | Detail | Why |
|---------|--------|-----|
| Namespace `devsecops` | Keeps all resources separate | Isolation |
| Resource requests/limits | cpu 100m-500m, memory 64Mi-128Mi | Prevents Pods using too many resources |
| Readiness probe | `GET /` on port 80 | No traffic is sent until the Pod is ready |
| Liveness probe | `GET /` on port 80 | Container restarts if it fails |

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `kubectl apply -f k8s/namespace.yaml` | Creates the namespace | Separate space for the project |
| `kubectl apply -f k8s/deployment.yaml` | Creates the Deployment | Deploy the app |
| `kubectl get pods -n devsecops` | Lists Pods | Check Running/READY |
| `kubectl describe deployment devsecops-web -n devsecops` | Shows Deployment details | Verify resources and probes |
| `kubectl apply -f k8s/service.yaml` | Creates the Service | Expose the app |
| `kubectl get svc -n devsecops` | Lists Services | Check the Service |
| `kubectl apply -f k8s/ingress.yaml` | Creates the Ingress | HTTP routing |
| `kubectl get ingress -n devsecops` | Lists Ingress | Check the address |
| `kubectl describe pod -n devsecops` | Shows Pod details | Verify readiness/liveness probes |
| `helm lint helm/devsecops-web` | Validates the chart | Catch errors |
| `helm install devsecops-final helm/devsecops-web -n devsecops` | Installs the Helm release | Deploy with Helm |
| `helm list -n devsecops` | Lists releases | Verify the install |
| `kubectl get all -n devsecops` | Shows all resources together | Final verification |
| `kubectl get pods -n devsecops -o wide` | Shows Pods with node and IP | Detailed check |

## Troubleshooting Labs
1. **Wrong selector** - wrong label in Service -> no endpoints -> fix.
2. **Wrong image** - `nginx:wrong-tag` -> `ImagePullBackOff` -> `kubectl describe pod` -> correct the image.
3. **Wrong replica/resource config** - change -> observe -> fix.
4. **Helm rollback** - `helm upgrade` -> `helm history` -> `helm rollback`.

## Screenshots
Project structure, namespace, deployment, pods, service, ingress, probes, resource limits, configmap, pvc, helm lint/install/list, `kubectl get all`, browser, architecture.


**Organized By:** MD.AL-AMIN

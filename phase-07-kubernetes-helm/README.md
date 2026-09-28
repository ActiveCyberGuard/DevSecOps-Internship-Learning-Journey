# Phase 7 — Kubernetes & Helm

**Organized By:** MD.AL-AMIN

Deploying, configuring, exposing, and packaging applications on a local Kubernetes (Minikube) cluster using kubectl and Helm.

## Days

| Day | Topic | Folder |
|-----|-------|--------|
| 31 | Kubernetes Architecture | [day-31-kubernetes-architecture](./day-31-kubernetes-architecture) |
| 32 | Pods & Workloads | [day-32-pods-workloads](./day-32-pods-workloads) |
| 33 | ConfigMaps, Secrets & Storage | [day-33-config-secrets-storage](./day-33-config-secrets-storage) |
| 34 | Ingress & Networking | [day-34-ingress-networking](./day-34-ingress-networking) |
| 35 | Helm | [day-35-helm](./day-35-helm) |
| 36 | Final Kubernetes Project | [day-36-final-kubernetes-project](./day-36-final-kubernetes-project) |

## Tools Used

- **Minikube** - local Kubernetes cluster
- **kubectl** - command-line tool to control the cluster
- **Helm** - Kubernetes package manager
- **Docker** - driver used by Minikube

## Final Architecture

```
Browser -> Ingress (Nginx) -> Service -> Pod 1 / Pod 2 (Nginx)
                                              |
                                       ConfigMap + PVC
```

## Troubleshooting Labs

1. Wrong Service selector -> no endpoints -> fix
2. Wrong image tag -> ImagePullBackOff -> fix
3. Wrong replica/resource configuration -> observe -> fix
4. Helm upgrade -> rollback

## Security Note

No real passwords or credentials were committed to GitHub. The Secret file contains demo values only.

## Folder Structure

```
phase-07-kubernetes-helm/
├── README.md
├── day-31-kubernetes-architecture/
├── day-32-pods-workloads/
├── day-33-config-secrets-storage/
├── day-34-ingress-networking/
├── day-35-helm/
└── day-36-final-kubernetes-project/
```

Each day folder contains: `README.md`, manifests/charts, `notes/`, and `screenshots/`.

# Day 31 — Kubernetes Architecture

 

## What
Understand Kubernetes architecture and create a local cluster with Minikube to inspect it.

## Components

| Component | Role |
|-----------|------|
| API Server | Main entry point of the cluster. All requests go through it |
| Scheduler | Decides which node a new Pod runs on |
| Controller Manager | Keeps the current state matching the desired state |
| etcd | Key-value database that stores all cluster data |
| kubelet | Runs and monitors Pods on a node |
| Container runtime | Runs the containers |
| Pod | Smallest deployable unit |

```
Kubernetes
├── Control Plane: API Server, Scheduler, Controller Manager, etcd
└── Worker Node: kubelet, container runtime, Pods
```

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `minikube version` | Shows Minikube version | Check it is installed |
| `kubectl version --client` | Shows kubectl version | Check kubectl is installed |
| `minikube start --driver=docker` | Starts a local cluster using Docker | Create the cluster |
| `minikube status` | Shows status of cluster components | Confirm the cluster is running |
| `kubectl cluster-info` | Shows control plane address | Confirm the cluster is reachable |
| `kubectl get nodes` | Lists nodes | Check the node is `Ready` |
| `kubectl get namespaces` | Lists namespaces | See the default namespaces |
| `kubectl get pods -A` | Lists Pods in all namespaces | See control plane Pods (etcd, apiserver, etc.) |
| `kubectl get nodes -o wide` | Shows extra node info (IP, OS, runtime) | Inspect node details |
| `kubectl get svc -A` | Lists Services in all namespaces | See the default Services |

## Screenshots
Minikube status, cluster-info, nodes, namespaces, all pods.


**Organized By:** MD.AL-AMIN

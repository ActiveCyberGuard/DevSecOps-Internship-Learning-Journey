# Day 34 — Ingress & Networking

 

## What
Route HTTP traffic with an Ingress and restrict Pod traffic with a NetworkPolicy.

## Concepts

| Object | Role |
|--------|------|
| Ingress | Routes traffic to Services by host/path |
| Ingress Controller | Implements Ingress rules (Nginx here) |
| DNS / Service discovery | Pods find each other by Service name |
| NetworkPolicy | Controls which Pods can talk to which |

## Files
- `ingress/ingress.yaml` - host `devsecops.local` -> `devsecops-web-service:80`
- `network-policy/policy.yaml` - allows ingress to `app: devsecops-web` Pods only from Pods in the same namespace

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `minikube addons enable ingress` | Installs the Nginx ingress controller | Ingress needs a controller to work |
| `kubectl get pods -n ingress-nginx` | Shows controller Pods | Confirm the controller is running |
| `kubectl apply -f ingress/ingress.yaml` | Creates the Ingress | Enable HTTP routing |
| `kubectl get ingress` | Lists Ingress and address | Check the address is assigned |
| `kubectl apply -f network-policy/policy.yaml` | Creates the NetworkPolicy | Restrict traffic |
| `kubectl get networkpolicy` | Lists policies | Confirm it was created |

## Screenshots
Ingress addon, controller pods, ingress, ingress address, network policy, service discovery, browser.

**Organized By:** MD.AL-AMIN

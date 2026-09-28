# Day 35 — Helm

 

## What
Package the application as a Helm chart, then install, upgrade, and roll it back.

## Concepts

| Term | Meaning |
|------|---------|
| Chart | Package of Kubernetes app files |
| Values | Configurable settings (`values.yaml`) |
| Templates | YAML files rendered using values |
| Release | An installed instance of a chart in the cluster |
| Upgrade / Rollback | Update a release / return to an earlier revision |

## Structure
```
charts/devsecops-web/
├── Chart.yaml
├── values.yaml
└── templates/ (deployment.yaml, service.yaml, ingress.yaml)
```

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `helm version` | Shows Helm version | Check it is installed |
| `helm create charts/devsecops-web` | Generates a chart skeleton | Start the chart |
| `ls charts/devsecops-web` | Lists chart files | Check the structure |
| `helm lint charts/devsecops-web` | Checks the chart for errors | Validate before install |
| `helm template devsecops-web charts/devsecops-web` | Renders final YAML without installing | Preview what will be generated |
| `helm install devsecops-web charts/devsecops-web` | Installs the release | Deploy the app |
| `helm list` | Lists releases | Confirm the install |
| `helm upgrade devsecops-web charts/devsecops-web` | Updates the release (`replicaCount: 3`) | Apply changes |
| `helm history devsecops-web` | Shows revision history | Evidence of upgrade/rollback |
| `helm rollback devsecops-web 1` | Returns to revision 1 | Restore the previous state |
| `kubectl get pods` / `kubectl get svc` | Shows Pods/Services | Verify what Helm created |

## Screenshots
Version, chart created, lint, template, install, list, upgrade, history, rollback.
Most important: `helm history devsecops-web`.


**Organized By:** MD.AL-AMIN

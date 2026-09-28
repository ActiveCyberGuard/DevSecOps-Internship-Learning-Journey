# Day 33 — ConfigMaps, Secrets & Storage

 

## What
Manage application config, sensitive data, and persistent storage in Kubernetes.

## Concepts

| Object | Role |
|--------|------|
| ConfigMap | Stores non-sensitive config (APP_NAME, APP_ENV) |
| Secret | Stores sensitive data (username, password) |
| PVC | Requests storage so data survives Pod restarts |

## Files
- `manifests/configmap.yaml` - `APP_NAME`, `APP_ENV`
- `manifests/secret.yaml` - demo `DB_USER`, `DB_PASSWORD`
- `storage/pvc.yaml` - 1Gi, `ReadWriteOnce`

## Commands Used

| Command | What it does | Why |
|---------|--------------|-----|
| `kubectl apply -f manifests/configmap.yaml` | Creates the ConfigMap | Keep config separate from the app |
| `kubectl get configmap` | Lists ConfigMaps | Confirm it was created |
| `kubectl apply -f manifests/secret.yaml` | Creates the Secret | Keep sensitive data separate |
| `kubectl get secrets` | Lists Secrets | Confirm it was created |
| `kubectl apply -f storage/pvc.yaml` | Creates the PVC | Request storage |
| `kubectl get pvc` | Shows PVC status | Check it is `Bound` |

## Security Note
No real passwords were committed to GitHub. Only demo values are used.

## Screenshots
ConfigMap, Secret, PVC, PVC status, Pod with config, storage test, pod restart test.


**Organized By:** MD.AL-AMIN

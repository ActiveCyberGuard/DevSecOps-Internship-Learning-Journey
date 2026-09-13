
---

# 📄 `security-controls.md`

```markdown
# Security Controls

## 1. IAM

- Apply least privilege.
- Use roles for workloads where possible.
- Avoid unnecessary permissions.
- Avoid long-lived credentials.
- Never commit credentials to Git.

## 2. Network Security

- Keep application services in private network boundaries.
- Keep databases private.
- Expose only required public-facing services.
- Restrict network traffic using security rules.

## 3. Data Security

- Protect sensitive information.
- Restrict storage access.
- Protect backups.

## 4. Logging

Collect application and infrastructure logs for:

- Troubleshooting
- Security investigation
- Operational monitoring

## 5. Backup

- Maintain backups of important data.
- Restrict backup access.
- Test restoration.

## 6. Cost Security

- Remove unused resources.
- Stop unnecessary compute.
- Monitor cloud usage.
- Configure budgets or alerts where available.
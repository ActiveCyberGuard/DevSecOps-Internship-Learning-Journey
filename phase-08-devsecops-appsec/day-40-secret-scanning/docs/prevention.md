# Day 40 — Secret Scanning and Prevention

- Never put credentials in source code, Dockerfiles, screenshots or logs.
- Use environment variables or an approved secrets manager.
- Add secret scanning to pull-request CI.
- Use a pre-commit hook for fast local feedback.
- Restrict access and rotate/revoke a real credential immediately if exposed.
- Removing a secret from the latest file does not remove it from Git history.
- Scan reports may contain sensitive context; redact before sharing.

## Evidence
Record the Gitleaks version, exact command, scan outcome and any false-positive decision.
Do not include actual credentials in this document.

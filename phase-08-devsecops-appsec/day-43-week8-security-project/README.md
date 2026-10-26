# Day 43 — Phase 8 DevSecOps Security Project

## Pipeline stages
1. Unit tests
2. SAST (Bandit)
3. Code quality (Ruff)
4. Dependency audit (pip-audit)
5. Secret scan (Gitleaks)
6. Container image scan (Trivy)

## Gate policy
The workflow should fail when required checks fail. Review the actual Actions logs; do not claim success without a completed run.

## Limitations
This starter pipeline does not publish an image or deploy to staging. Add those stages only after registry credentials, deployment target, approval and DAST scope are configured safely.

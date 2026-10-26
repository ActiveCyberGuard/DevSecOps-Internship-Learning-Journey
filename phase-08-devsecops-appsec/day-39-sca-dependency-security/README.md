# Day 39 — SCA and Dependency Security

## Objectives
Audit Python dependencies, understand CVEs and document remediation decisions.

## Tools
Python, pip, pip-audit.

## Commands
- `python -m pip freeze > reports/installed-packages.txt`
- `python -m pip_audit -r requirements.txt -f json -o reports/pip-audit.json`

## Evidence
See `reports/` and `docs/triage.md`. Findings must match the actual scan output.

## Limitations
An audit result depends on the package ecosystem and advisory data available at scan time.

# Day 38 — SAST and Code Quality

## Objectives
Run static checks, test the application, classify findings and prepare a security gate.

## Tools
Python, Flask, pytest, Bandit, Ruff.

## Commands
- `python -m pytest tests -q`
- `python -m bandit -r app -f txt -o reports/bandit-report.txt`
- `python -m ruff check app tests`

## Findings
See `docs/findings.md` and the actual report in `reports/`.

## Limitations
Static analysis can produce false positives and cannot prove the application is free of vulnerabilities.

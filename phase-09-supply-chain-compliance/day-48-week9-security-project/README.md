# Day 48 — Security Automation and Compliance Project

## Objective
Combine SBOM generation, vulnerability scanning, policy checks and auditable remediation evidence.

## Workflow
1. Identify the image and immutable digest.
2. Generate an SBOM.
3. Scan the image for known vulnerabilities.
4. Test security policies against manifests.
5. Prioritize findings and document fixes/exceptions.
6. Collect actual evidence and review it before commit.

## Deliverables
- `sbom/` — generated SBOM artifacts
- `reports/` — actual scan/policy outputs
- `policies/` — project policy copy or reference
- `evidence/evidence-index.md` — evidence index
- `docs/project-checklist.md` — completion checklist
- `screenshots/` — real screenshots

## Gate and exception policy
Critical/high findings or failed mandatory policies should block progression unless an authorized, time-bound exception is recorded. Adjust severity thresholds and SLA to the supervisor's requirements.

## Limitations
Do not claim the project passed unless the tools ran successfully and the reports support that conclusion. An SBOM or signature alone does not prove an artifact is vulnerability-free.

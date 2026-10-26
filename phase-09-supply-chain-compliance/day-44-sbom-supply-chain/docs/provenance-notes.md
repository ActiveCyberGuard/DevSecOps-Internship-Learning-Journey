# Day 44 — SBOM and Provenance

## Image
Record the exact image name and immutable digest if available.

## Generator
Record Syft or Trivy version and the exact command.

## SBOM format
Record CycloneDX JSON or SPDX JSON and the generated filename.

## Interpretation
SBOM lists detected components and metadata. It does not prove that all components are vulnerability-free, nor does it by itself prove who built the image.

## Evidence
Attach actual command output and the generated SBOM artifact.

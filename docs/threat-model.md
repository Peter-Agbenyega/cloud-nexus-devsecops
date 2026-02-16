# Threat Model (Initial)

## System Context
- Terraform-based AWS infrastructure template in `07-templates/devsecops-starter/infra`.
- GitHub-hosted source code with GitHub Actions CI workflows.
- Dev environment defined under `infra/environments/dev`.

## Critical Assets
- Cloud credentials and CI tokens.
- Terraform state and infrastructure configuration.
- Source code integrity and deployment workflows.

## Trust Boundaries
- Developer workstation to git repository.
- GitHub Actions runner to cloud provider APIs.
- Terraform state backend to infrastructure control plane.

## Key Threats (STRIDE-oriented)
- Spoofing: compromised CI identity or developer credentials.
- Tampering: unauthorized IaC changes merged to `main`.
- Repudiation: insufficient audit trail for privileged changes.
- Information disclosure: secrets committed in code or workflow logs.
- Denial of service: pipeline misuse or malicious IaC changes.
- Elevation of privilege: over-privileged IAM roles in CI/deploy paths.

## Current Controls
- Terraform formatting/validation and IaC scans in template CI workflow.
- Security guardrails documented in `07-templates/devsecops-starter/docs/SECURITY_GUARDRAILS.md`.
- Required tags and input validation in VPC module variables.

## Gaps / Actions
- Add branch protection with required status checks.
- Enforce secrets scanning in CI and pre-commit.
- Configure remote Terraform state encryption/locking in environment backends.
- Add logging/monitoring controls (e.g., VPC Flow Logs) in baseline modules.

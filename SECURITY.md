# Security Policy

## Scope
This policy applies to this repository and all templates under `07-templates/`.

## Supported Security Baseline
- Infrastructure changes must be made through pull requests.
- CI security checks must pass before merge.
- Secrets must not be committed to git history.

## Reporting a Vulnerability
- Email: `security@cloudnexushub.com`
- Include: affected path, impact, reproduction steps, and proposed remediation.
- Do not open a public issue for sensitive vulnerabilities.

## Response Expectations
- Initial acknowledgement: within 2 business days.
- Triage outcome: within 5 business days.
- Remediation timeline: risk-based, documented in tracking artifacts.

## Handling Secrets
- Use secret managers or CI secret stores, never plaintext files.
- Rotate any exposed credential immediately.
- Record incident and corrective action in internal security logs.

# Security Guardrails

## Required Controls
- Enforce least-privilege IAM for CI and deployment identities.
- Require pull requests, at least one reviewer, and passing CI checks before merge.
- Store Terraform state remotely with encryption at rest and state locking enabled.
- Prevent plaintext secrets in repository files, Terraform variables, and workflow logs.
- Use customer-managed KMS keys for sensitive data when applicable.

## CI Security Gates
- `terraform fmt -check` must pass.
- `terraform validate` must pass.
- `tflint` must pass.
- `tfsec` must pass for high and critical findings (or stricter policy as configured).

## IaC Baseline Requirements
- All resources must include common tags: `Owner`, `Project`, and `Env`.
- All network inputs must pass CIDR and shape validation before apply.
- New modules should include input validations and explicit outputs.
- Public internet routes must be intentional and documented.

## Exception Process
- Security exceptions must be documented in pull request description.
- Exceptions require explicit approval from repository maintainers.
- Exceptions must include expiry date and a remediation plan.

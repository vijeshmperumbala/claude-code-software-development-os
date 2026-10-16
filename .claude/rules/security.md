# Security Rules

- Never expose credentials or copy secrets into documentation, logs, test fixtures, or commits.
- Do not weaken authentication, authorization, tenant isolation, CSRF protections, validation, or rate limits to make tests pass.
- Treat access-control failures, injection, SSRF, path traversal, unsafe uploads, deserialization, secrets exposure, and tenant-boundary leaks as high-priority risks.
- Verify authorization for each object/action, not merely whether a user is authenticated.
- Do not run exploit tests against systems unless the scope is authorized and the target is controlled.
- Security agents should default to read-only analysis; remediation requires approval when broad or behavior-changing.

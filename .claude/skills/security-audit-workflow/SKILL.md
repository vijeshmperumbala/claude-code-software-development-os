---
name: security-audit-workflow
description: Perform an authorized, read-only security review.
---

# Security audit

1. Confirm the authorized scope is this repository or an explicitly approved test target.
2. Review trust boundaries, authentication, object-level authorization, tenant isolation, input validation, output encoding, file handling, SSRF, injection, secrets, dependencies, logging, rate limits, and sensitive-data lifecycle as relevant.
3. Use security-agent, vulnerability-agent, threat-modeling-agent, authentication-authorization-agent, dependency-security-agent, secrets-privacy-agent, and security-testing-agent as appropriate.
4. Do not perform exploitation against third-party or production systems without explicit scope and approval. Do not expose secrets in output.
5. Report evidence, severity, confidence, impact, safe remediation and retest steps. Do not claim compliance or complete security.

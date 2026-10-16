---
name: test-environment-isolation
description: 1. Identify environment variables, external services, databases, queues, filesystem and clock dependencies.
---

# Test Environment Isolation Skill

1. Identify environment variables, external services, databases, queues, filesystem and clock dependencies.
2. Prefer ephemeral or isolated resources and synthetic fixtures.
3. Prevent tests from touching production/shared data; require explicit safeguards for destructive tests.
4. Make setup/teardown deterministic and safe after failure.
5. Track flaky tests separately from product failures and preserve reproduction evidence.
6. Document parity gaps between local, CI, staging, and production.

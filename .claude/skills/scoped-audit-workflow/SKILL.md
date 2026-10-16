---
name: scoped-audit-workflow
description: Run a scoped, read-only engineering audit.
---

# Scoped audit

Ask which scope if it is unclear: security, architecture, code quality, performance, database, API, reliability, concurrency, caching, testing, frontend, accessibility, observability, scalability, configuration, deployment, AI code, documentation, or all.

Inspect repository evidence and delegate only to relevant read-only agents. Do not modify files or automatically fix findings. Deduplicate findings and use the shared finding schema from `workflows/audit-protocol.md`. Clearly state scope, checks run, checks not run, and limitations.

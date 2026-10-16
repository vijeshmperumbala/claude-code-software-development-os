---
name: full-audit-workflow
description: Coordinate all 20 legacy audit agents and relevant lifecycle specialists in read-only mode.
---

# Full engineering audit

1. Capture git status, current branch, changed files, repo map, and available verification commands.
2. Coordinate the 20 legacy agents: security-agent, vulnerability-agent, code-quality-agent, duplication-agent, architecture-agent, performance-agent, database-agent, api-agent, reliability-agent, concurrency-agent, caching-agent, testing-agent, frontend-agent, accessibility-agent, observability-agent, scalability-agent, configuration-agent, deployment-agent, ai-code-agent, documentation-agent.
3. Add lifecycle specialists only when useful (e.g. threat-modeling-agent, authentication-authorization-agent, dependency-security-agent, device-compatibility-agent).
4. Keep the audit read-only. Agents should report findings, not edit code. Avoid redundant overlapping scans; identify the owner for each issue.
5. Consolidate duplicate findings, preserve disagreement where evidence differs, assign IDs like `SEC-001`, `PERF-001`, `TEST-001`, and rank severity/confidence.
6. Do not claim tools ran unless their output is available. Separate not-run checks from passed checks.
7. Write the consolidated report to `docs/audits/` only after asking approval if creating the file is a material repository change; otherwise return it in the conversation.
8. End with prioritized remediation batches and the specific verification needed.

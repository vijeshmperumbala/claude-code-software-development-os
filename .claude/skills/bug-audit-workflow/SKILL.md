---
name: bug-audit-workflow
description: Reproduce, investigate, prioritize, and document a bug without making unapproved changes.
---
# Bug Audit Workflow

## Required inputs
Collect the report, expected and actual behavior, reproduction steps, environment/version, logs or screenshots, and business impact. If inputs are missing, inspect the repository and state assumptions explicitly.

## Procedure
1. Confirm repository state and inspect relevant files before editing.
2. Reproduce the behavior or document why reproduction is blocked.
3. Trace the execution path and identify the root cause; separate evidence from hypotheses.
4. Assess severity, scope, security/privacy implications, data integrity, and related edge cases.
5. Ask relevant specialist agents for focused reviews; avoid duplicate broad audits.
6. Propose a minimal fix and regression tests.
7. Do not edit until the user approves the plan.

## Output
Provide a concise report with reproduction status, root cause, severity, evidence, affected files, proposed fix, tests, and unresolved questions. Use PASS / FAIL / BLOCKED / NOT RUN honestly.

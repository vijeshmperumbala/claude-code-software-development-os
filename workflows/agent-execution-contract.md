# Agent Execution Contract

## Modes
Every delegated task must declare exactly one mode:
- `REVIEW_ONLY`: inspect and report; no edits.
- `PLAN_ONLY`: produce plan/patch guidance; no edits.
- `IMPLEMENTATION`: may edit only when the actual Claude Code tool configuration permits writes and the user-approved plan covers the change.
- `INDEPENDENT_REVIEW`: inspect the resulting diff without implementing fixes.

Agent markdown frontmatter and available tools are the execution boundary. A role description cannot grant tools that are not configured. The main session performs delegation and verifies actual invocation results; never claim an agent ran without an invocation record.

## Task packet
Include task ID, objective, mode, scope/exclusions, file ownership, dependencies, approval state, expected outputs, tests, and evidence.

## Routing and overlap
- `frontend-agent`: frontend architecture/quality review; `frontend-development-agent`: approved frontend implementation guidance under its configured tools.
- `api-agent`: API behavior and endpoint review; `api-contract-agent`: cross-boundary schema/version compatibility.
- `testing-agent`: broad test quality review; `test-strategy-agent`: test planning; specialized testing agents own their named test level/domain.
- `database-agent`: schema/query review; `database-governance-agent`: policy and lifecycle; `migration-agent`: migration execution design and compatibility; `database-optimization-agent`: measured query/index performance.
- `security-agent`: security posture; `vulnerability-agent`: concrete vulnerability validation; `threat-modeling-agent`: design-time threats; `security-testing-agent`: authorized test design/execution evidence.
- `accessibility-agent`: expert/manual accessibility review; `accessibility-automation-agent`: automated tooling and output interpretation.

When scopes overlap, designate one lead specialist, use others for bounded subquestions, deduplicate by root cause, and record the resolution. Read-only agents do not become implementers by instruction alone.

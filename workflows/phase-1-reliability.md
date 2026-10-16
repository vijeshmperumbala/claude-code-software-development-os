# Phase 1 — Reliability and Operational Correctness

## Goal
Make orchestration deterministic, observable, and honest about what was actually executed.

## Required procedure
1. Validate the installed project's instructions, agent definitions, skills, commands, and referenced paths before doing work.
2. Create or update `docs/engineering/task-ledger.md` for multi-step work. Each task has a stable ID, owner, dependencies, status, approval state, evidence, and retry count.
3. Give every delegated task a bounded scope, file ownership, output schema, acceptance criteria, and failure path.
4. Record agent dispatch only when the real Claude Code mechanism was invoked. If unavailable, report `BLOCKED` and continue only with safe main-session work.
5. Track task statuses as `NOT STARTED`, `IN PROGRESS`, `BLOCKED`, `FAILED`, `VERIFIED`, or `CANCELLED`.
6. Retry only transient failures, with a bounded retry count (default: one retry) and no repeated destructive actions.
7. Require a final reconciliation: compare planned tasks with ledger tasks and report omissions.
8. Never infer test success from an agent's claim; capture actual command output or clearly label it unverified.

## Required artifacts
- `docs/engineering/task-ledger.md`
- Relevant module `TODO.md`
- A completion report for substantial work

## Acceptance gate
No task may be marked `VERIFIED` without evidence; no overall status may be `PASS` while required tasks are failed, blocked, or unverified. Explain exceptions explicitly.

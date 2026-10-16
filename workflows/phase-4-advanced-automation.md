# Phase 4 — Advanced Automation, Efficiency, and Release Safety

## Agent efficiency
- Route only relevant agents based on change impact and risk.
- Parallelize independent read-only investigations; serialize overlapping edits and dependent tasks.
- Record selected agents, reason for selection, actual invocation result, findings, and duration when available.
- Consolidate duplicate findings by stable ID and evidence; retain source-agent attribution.
- Track token/cost data only when the environment exposes reliable measurements; otherwise use `NOT AVAILABLE` rather than estimates presented as facts.

## Release and rollout
- Use feature flags only when the project already has or explicitly approves a flag mechanism.
- Record flag owner, purpose, default state, rollout/rollback plan, monitoring, and removal condition.
- Include release checklist, migration ordering, rollback/recovery, observability, and post-release verification for releases.
- Never deploy, publish, spend money, alter production, commit, or push without the required explicit authorization.

## Automation safeguards
- Every automation has a dry-run/preview where feasible, bounded scope, idempotency expectations, timeout/failure behavior, and audit trail.
- Destructive or irreversible actions require explicit approval and a recovery plan.
- Avoid repeated polling or redundant agent calls when no new evidence is available.
- Measure before optimizing. Performance and cost improvements require comparable baseline and after evidence.

## Acceptance gate
Automation must fail safely, surface partial completion, preserve user work, and distinguish simulated/planned actions from actions actually performed.

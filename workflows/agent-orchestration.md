# Agent Orchestration Protocol

## Ownership
- Main Claude Code session: accountable orchestrator, plan owner, conflict resolver, acceptance coordinator.
- Specialist agents: bounded investigation, design, implementation, or independent review.
- Human user: approves scope and consequential actions.

## Task packet
Every delegated task should specify:
1. Objective and context
2. In-scope and out-of-scope areas
3. Files or modules owned
4. Dependencies and assumptions
5. Expected output and evidence
6. Tests/checks required
7. Whether the agent is read-only, implementer, or reviewer

## Scheduling
- Parallel: independent read-only analysis, separate components with non-overlapping ownership.
- Sequential: requirements before design; schema/API contracts before dependent implementation; implementation before independent review; fixes before re-audit.
- Avoid parallel write access to shared files. Assign one implementation owner and let other agents review.

## Reconciliation
- Deduplicate findings by root cause and location.
- Resolve conflicts using repository evidence, approved requirements, security constraints, and minimal-change principles.
- Record rejected recommendations and reasons when the conflict is material.
- Re-dispatch only focused follow-up tasks.

## Completion
A task is complete only when acceptance criteria are checked, relevant verification has run or is marked NOT RUN/BLOCKED, independent review is complete where required, and the user receives an evidence-based summary.


## Specialist routing and review matrix

| Change impact | Recommended specialists | Minimum evidence before acceptance |
|---|---|---|
| Any material implementation | `code-review-agent`, `test-strategy-agent` | Independent diff review and relevant test outcomes |
| Database schema or data transformation | `migration-agent`, `database-agent`, `database-governance-agent`, `test-data-agent` | Compatibility, integrity, migration/rollback plan, edge-case fixtures |
| API consumed across a boundary | `api-contract-agent`, `api-agent`, `integration-testing-agent` | Contract compatibility and consumer/provider verification |
| Dependency add/upgrade/removal | `dependency-management-agent`, `dependency-security-agent`, `dependency-license-agent` | Compatibility, security, license/policy assessment |
| Localization, language, or RTL | `internationalization-agent`, `accessibility-agent`, `responsive-design-agent` | Locale and RTL scenarios, formatting and layout checks |
| Recurring defect or incident | `root-cause-analysis-agent`, `reliability-agent`, `observability-agent`, `regression-testing-agent` | Evidence-backed causal analysis and recurrence-prevention test/action |
| Technical-debt cleanup | `technical-debt-agent`, `code-quality-agent`, `duplication-agent` | Prioritized debt rationale and regression verification |
| Cost/resource concern | `cost-optimization-agent`, `resource-efficiency-agent`, `performance-agent` | Baseline and comparable measurements where feasible; no invented savings |
| Automated accessibility | `accessibility-automation-agent`, `accessibility-agent` | Tool output plus documented manual-check gaps |
| Feature flag or rollout | `feature-flag-agent`, `configuration-agent`, `testing-agent`, `observability-agent` | Rollout/rollback, flag ownership, test coverage, removal lifecycle |

The table is a routing guide, not a requirement to invoke every listed agent for every task. The main session selects specialists from repository evidence and records skipped agents as `NOT APPLICABLE` with a brief reason when their domain is material enough to be considered.

## Agent invocation ledger

For multi-agent work, include a compact ledger in the completion report with columns: agent, assigned task, status (`DISPATCHED`, `COMPLETED`, `BLOCKED`, `NOT RUN`, `NOT APPLICABLE`), result/evidence, and follow-up. Record actual invocations only. The main session reconciles duplicate findings and resolves conflicting advice; specialists do not independently overrule approved requirements.

## Acceptance gates

- Independent code review is complete for material changes.
- Relevant tests/checks have actual outcomes or explicit `NOT RUN`/`BLOCKED` status.
- Data migrations have compatibility and recovery review before execution. Destructive or production-impacting operations still require explicit user approval.
- API, dependency, accessibility, localization, rollout, and cost gates are applied only when relevant, but their applicability decision is recorded.
- The report does not declare completion while a required gate is failed or blocked.


## Extended specialist routing
| Concern | Lead agent | Supporting agents / evidence |
|---|---|---|
| CI quality gates | `ci-quality-gate-agent` | `testing-agent`, `deployment-agent`; actual check outputs and gate matrix |
| Requirements traceability | `requirements-traceability-agent` | `requirements-agent`, `test-strategy-agent`; requirement → task → code → test → evidence links |
| Backup/restore | `backup-restore-validation-agent` | `recovery-agent`, `database-governance-agent`; isolated restore evidence and RPO/RTO status |
| Event-driven systems | `event-messaging-agent` | `api-contract-agent`, `reliability-agent`, `integration-testing-agent`; contract and failure-path tests |
| Infrastructure as code | `infrastructure-as-code-agent` | `devops-agent`, `security-agent`, `cost-optimization-agent`; plan/static-check evidence |
| Test environment | `test-environment-agent` | `test-data-agent`, `integration-testing-agent`, `reliability-agent`; isolation and reproducibility evidence |

Every task packet must declare execution mode (`REVIEW_ONLY`, `PLAN_ONLY`, `IMPLEMENTATION`, `INDEPENDENT_REVIEW`). Only dispatch implementation work to an agent whose actual configured tools support edits and whose scope is approved. Do not assume agent markdown role text grants missing tools.

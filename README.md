# Claude Code Software Development OS

An approval-first, agent-assisted engineering system for planning, building, improving, testing, auditing, and releasing software. It is designed to adapt to the repository's **actual stack and conventions** rather than force a fixed technology choice.

> **Capability note:** This package contains instructions, agent definitions, skills, commands, workflows, templates, and a structural validator. Their presence does not prove Claude Code has invoked an agent or run a check. Runtime behavior depends on your installed Claude Code version, configuration, permissions, tools, and target project's environment. Always report execution evidence honestly.

## Contents

- [Goals and principles](#goals-and-principles)
- [Package inventory](#package-inventory)
- [Installation and first run](#installation-and-first-run)
- [Claude Code integration guide](#claude-code-integration-guide)
- [Command reference](#command-reference)
- [Orchestrator lifecycle](#orchestrator-lifecycle)
- [Agent directory](#agent-directory)
- [Module-wise TODO.md](#module-wise-todomd)
- [Phases 1–4](#phases-14)
- [Project intelligence and architecture](#project-intelligence-and-architecture)
- [Audits and remediation](#audits-and-remediation)
- [Database governance and migrations](#database-governance-and-migrations)
- [Testing and release readiness](#testing-and-release-readiness)
- [Reports and evidence](#reports-and-evidence)
- [Approval and safety model](#approval-and-safety-model)
- [Validation](#validation)
- [Troubleshooting](#troubleshooting)
- [Recommended operating routine](#recommended-operating-routine)

## Goals and principles

The system is intended to help you:

1. Discover an existing codebase, technology stack, modules, APIs, data model, tests, and deployment setup.
2. Plan new features with business requirements, acceptance criteria, architecture, security, data, UI states, and test strategy.
3. Enhance existing applications without replacing their stack or ignoring their conventions.
4. Route work to relevant specialist agents instead of invoking every agent for every task.
5. Maintain module-wise `TODO.md` files and a shared task ledger without losing history.
6. Audit, prioritize, remediate, and re-verify defects and risks.
7. Compare audit baselines and distinguish pre-existing findings from regressions.
8. Produce evidence-based completion and release reports.

Core principles: inspect before changing; plan before implementation; request approval for consequential work; keep changes scoped; verify independently; preserve user changes; never invent test results or measurements.

## Package inventory

This edition contains **72 agent definition files, 27 skills, and 36 command files**, plus workflows, templates, and a Python structural validator. The manifest should be treated as the registry for agent discovery; use `/validate-os` and the validation script to detect drift.

Main directories:

```text
.claude/
  agents/       Specialist and orchestration agent definitions
  commands/     Slash-command workflow entry points
  skills/       Reusable workflow instructions
workflows/      Cross-agent lifecycle and phase procedures
templates/      Reusable plans, ledgers, maps, reports, and checklists
scripts/
  validate_os.py
README.md
```

Other project files may be present in the archive. Keep the supplied directory structure intact when installing.

## Installation and first run

### Requirements

- Claude Code installed and available in your terminal.
- A repository you are authorized to inspect and modify.
- Appropriate runtime, package manager, database, and test dependencies for the target application.
- A clean or understood Git working tree before implementation is strongly recommended.
- Python 3 for the structural validation script.

### Install into an existing project

1. Extract the archive.
2. Review the package's `.claude/`, `workflows/`, `templates/`, `scripts/`, and `README.md`.
3. Copy or merge the contents into the target repository root. If `.claude/`, `CLAUDE.md`, or any target files already exist, compare before merging; do not blindly overwrite project-specific instructions, hooks, settings, commands, or agents.
4. Review agent manifest and settings for paths and options supported by your installed Claude Code version.
5. Open a terminal at the target repository root:

```bash
cd /path/to/your-project
claude
```

PowerShell example:

```powershell
Set-Location C:\path\to\your-project
claude
```

6. Ask Claude Code to inspect what it actually recognizes before making changes:

```text
Inspect the installed Software Development OS configuration. List the commands,
skills, agents, hooks, and settings you can actually discover. Identify missing
references, conflicts, and version-specific incompatibilities. Do not modify
application code yet.
```

7. Start with read-only discovery or validation. Approve an explicit plan before implementation.

### First safe run

Use `/validate-os` to inspect the package structure, then:

```text
/enhance-project Assess this repository in read-only mode. Detect its real stack,
map modules and dependencies, inspect tests, database, security, performance,
reliability, and UI where applicable. Establish a baseline and create a prioritized
plan. Do not edit application code until I approve the scope.
```

## Windows existing-project installer

The ZIP includes `install-to-existing-project.bat`. Extract the package, open PowerShell in the **existing project's root directory**, then invoke the BAT by its full path (for example, `& "F:\claude-code-software-development-os\install-to-existing-project.bat"`). The script uses the current directory as the destination and its own directory as the source. It copies missing files only, preserves existing files, reports root-file conflicts for manual merging, and writes `software-os-install.log`. Review project-specific Claude Code instructions and settings before use.

## Claude Code integration guide

For detailed step-by-step instructions to merge this package safely, inspect what Claude Code discovers, verify slash commands and skills, run an approval-first smoke test, test failure handling, and record runtime evidence, follow [`CLAUDE_CODE_INTEGRATION.md`](CLAUDE_CODE_INTEGRATION.md).

Do not treat static validation as runtime verification. Use a disposable repository first, merge existing `.claude/` configuration carefully, and do not promote the setup until the runtime checklist has evidence for each required check.

## Command reference

Commands are defined in `.claude/commands/`. Command availability and invocation syntax can vary by Claude Code version. If a command is not recognized, inspect the corresponding file and verify the installed version's supported command conventions.

| Command | Purpose |
|---|---|
| `/project-init` | Inspect and initialize a project; identify stack and setup needs. |
| `/engineering-orchestrator <goal>` | Coordinate an end-to-end task from discovery through verification and report. |
| `/build-module <module>` | Run the end-to-end module-development workflow. |
| `/enhance-project <goal>` | Audit and improve an existing application within an approved scope. |
| `/plan-feature <feature>` | Prepare requirements, design, risks, acceptance criteria, and tests. |
| `/implement-feature <feature>` | Implement an already-approved feature plan. |
| `/audit` | Run a scoped general audit. |
| `/audit-all` | Coordinate applicable audits and consolidate findings. |
| `/audit-api` | Review API design, behavior, and implementation. |
| `/audit-architecture` | Review architectural boundaries and consistency. |
| `/audit-configuration` | Inspect configuration and environment handling. |
| `/audit-database` | Review schema, relations, indexes, migrations, and query patterns. |
| `/audit-database-governance` | Trace data-model usage and identify cleanup candidates safely. |
| `/audit-deployment` | Review deployment configuration and operational readiness. |
| `/audit-device` | Review device compatibility and responsive behavior. |
| `/audit-documentation` | Review documentation completeness and accuracy. |
| `/audit-frontend` | Review frontend implementation and quality. |
| `/audit-performance` | Investigate performance risks and available measurements. |
| `/audit-reliability` | Review error handling, recovery, and reliability. |
| `/audit-security` | Review security boundaries and vulnerabilities. |
| `/audit-testing` | Review test strategy, coverage gaps, and test reliability. |
| `/audit-ai` | Review AI-related code or model integration where present. |
| `/audit-diff` | Review a change set against relevant quality and risk criteria. |
| `/audit-documentation` | Assess project documentation. |
| `/bug-audit` | Diagnose a bug and record evidence and likely root cause. |
| `/bug-fix-orchestrator` | Coordinate an approved bug fix and regression verification. |
| `/fix-audit` | Remediate approved audit findings. |
| `/re-audit` | Re-check findings after remediation. |
| `/plan-database-cleanup` | Prepare a safe, staged database-cleanup plan. |
| `/architecture-map` | Create or refresh the evidence-based project map. |
| `/agent-efficiency-review` | Review routing, unnecessary delegation, duplication, and efficiency. |
| `/validate-os` | Run or coordinate structural configuration validation. |
| `/module-report` | Produce a module completion report. |
| `/release-check` | Evaluate release gates without deploying. |

If the local command files differ from this list, trust the checked-out files and validator output; update this table when commands are added or removed. Avoid treating duplicated documentation as proof that a command exists.

## Orchestrator lifecycle

The orchestrator is the coordination layer, not a substitute for the specialist agents. It should use the actual Claude Code-supported agent/task invocation mechanism available in the running environment.

1. **Discover:** Read project instructions, inspect Git status, detect the real stack, and map modules, dependencies, tests, database, and deployment.
2. **Define:** Clarify the goal, users, business rules, constraints, and acceptance criteria.
3. **Plan:** Propose architecture, task breakdown, ownership, dependencies, risks, test plan, and TODO updates.
4. **Approve:** Present the plan and wait for approval where required before editing application code or taking consequential actions.
5. **Delegate:** Select only relevant specialists, give each bounded work and expected evidence, and define file ownership for concurrent work.
6. **Implement:** Work in small, scoped changes while preserving unrelated user modifications.
7. **Verify:** Run available tests and checks, inspect diffs, conduct independent review, and re-run failed checks after fixes.
8. **Reconcile:** Compare planned tasks with actual results; mark skipped, blocked, failed, and incomplete work accurately.
9. **Report:** Update module TODOs, task ledger, findings, architecture decisions when needed, and the completion report.

An agent file existing does not prove it was invoked. A response saying a check passed does not prove the check ran. Record actual tool calls, commands, outputs, and limitations where available.

## Agent directory

All agent definitions live in `.claude/agents/`. The `agents-manifest.json` registry should include all 66 definitions. Agents should be selected by task relevance and risk, not by a blanket instruction to invoke every agent.

### Orchestration, product, and requirements

- `engineering-orchestrator-agent` — coordinates the overall workflow and quality gates.
- `project-initializer-agent` — initial repository inspection and setup planning.
- `repository-architect-agent` — repository structure and architecture mapping.
- `product-strategist-agent`, `market-research-agent` — product direction and market context when relevant.
- `business-analyst-agent`, `requirements-agent` — business rules, requirements, acceptance criteria.
- `technical-debt-agent` — prioritized debt and refactoring recommendations.
- `root-cause-analysis-agent` — recurring failures and systemic causes.

### Architecture, backend, frontend, and integration

- `architecture-agent` — system design and boundaries.
- `backend-development-agent`, `frontend-development-agent` — implementation support.
- `frontend-agent`, `api-agent`, `api-contract-agent`, `integration-agent` — UI implementation, APIs, contracts, and integrations.
- `design-system-agent`, `ui-ux-design-agent`, `ux-research-agent`, `responsive-design-agent`, `internationalization-agent` — user experience, design consistency, RTL and localization.
- `device-compatibility-agent` — supported device and platform behavior.
- `feature-flag-agent` — flag lifecycle and staged rollout.

### Data, dependencies, and efficiency

- `database-agent`, `database-governance-agent`, `database-optimization-agent`, `migration-agent`, `data-governance-agent` — schema, use tracing, performance, migration safety, and data policy.
- `caching-agent`, `concurrency-agent`, `performance-agent`, `scalability-agent`, `resource-efficiency-agent`, `cost-optimization-agent` — runtime and resource behavior.
- `dependency-management-agent`, `dependency-security-agent`, `dependency-license-agent` — dependency health, vulnerability exposure, and license obligations.

### Security, quality, and testing

- `security-agent`, `vulnerability-agent`, `threat-modeling-agent`, `authentication-authorization-agent`, `secrets-privacy-agent`, `security-testing-agent`, `compliance-review-agent` — security and risk reviews.
- `code-quality-agent`, `code-review-agent`, `duplication-agent` — maintainability, independent review, and duplication.
- `test-strategy-agent`, `testing-agent`, `unit-testing-agent`, `integration-testing-agent`, `e2e-testing-agent`, `regression-testing-agent`, `test-data-agent`, `usability-testing-agent`, `accessibility-agent`, `accessibility-automation-agent`, `load-testing-agent` — test planning, execution, regression, accessibility, and load behavior.

### Operations, recovery, and documentation

- `devops-agent`, `deployment-agent`, `configuration-agent`, `observability-agent`, `reliability-agent`, `recovery-agent`, `documentation-agent`, `ai-code-agent` — operational configuration, releases, monitoring, recovery, documentation, and AI-specific code review where relevant.

Descriptions above are routing summaries; consult each agent's own definition for its detailed instructions and boundaries.

## Module-wise TODO.md

Each application or substantial module should have a `TODO.md` close to its code. Use a root-level `TODO.md` only for genuinely cross-module work. Before creating a file, search for existing TODO trackers and read them. If one exists, update it without discarding IDs, history, completed items, or unrelated tasks.

Example structure (adapt paths to the actual repository):

```text
your-project/
  TODO.md                    # Cross-module tasks only
  apps/
    calls/TODO.md
    attendance/TODO.md
    payroll/TODO.md
```

Use the supplied TODO template or follow the screenshot-inspired format:

```markdown
# <Module Name> Improvements

## Status Legend
- [ ] Open — Not started
- [~] In Progress — Work underway
- [x] Resolved — Implementation verified; deployment tracked separately
- [!] Blocked — Cannot proceed; reason recorded
- [-] Won't Do — Explicitly deferred/rejected with rationale

## Functional Improvements

### <MODULE-ID>: <Short title>
- **ID:** <MODULE-ID>
- **Status:** [ ] Open
- **Priority:** Critical / High / Medium / Low
- **Description:** <Current behavior and problem>
- **Changes Needed:**
  - [ ] <Specific change>
- **Implemented:**
  - <Leave empty until work is actually performed>
- **Verification:** <Tests/evidence and result>
- **Deployment:** Not deployed / Deployed / Not applicable
- **Related Files:** <Relevant paths>
- **Progress Notes:** <Dated notes; preserve history>
```

Recommended sections include Functional Improvements, Bug Fixes, Security, Performance & Reliability, UX & Accessibility, Technical Debt, and Documentation & Operations.

Rules:

- Use stable, unique IDs (for example, `CALL-001`, `PAY-012`). Do not renumber existing entries casually.
- Deduplicate findings, but preserve useful evidence and link related issues.
- Record priority, impact, confidence, acceptance criteria, and dependencies when known.
- Do not mark an item resolved merely because code was edited; require relevant verification evidence.
- Keep implementation and deployment status distinct.
- Record blocked tasks and reasons instead of silently dropping them.
- Update TODOs after approved planning, implementation, verification, and reporting steps.
- Do not invent a completed change, test result, deployment, or measurement.

## Phases 1–4

### Phase 1 — Reliability

Workflow guidance and templates support:

- A task ledger with task IDs, owners, status, dependencies, approval state, retries, and evidence.
- A consistent agent-result format.
- Bounded retry and failure handling rather than endless retries.
- Reconciliation of planned, completed, failed, skipped, and blocked work.
- Explicit escalation when delegation or verification fails.

Templates: `templates/AGENT-TASK-LEDGER.md`, `templates/AGENT-RESULT.md`.

### Phase 2 — Quality assurance

- Audit baseline capture and comparison.
- Stable finding IDs and status transitions for new, fixed, recurring, reopened, and accepted-risk findings.
- Independent review for important changes.
- Evidence-based resolution and re-verification.
- Separation of baseline defects from regressions introduced by current work.

Template: `templates/AUDIT-BASELINE.md`; see `workflows/phase-2-quality-assurance.md`.

### Phase 3 — Project intelligence

- Evidence-based project/module maps.
- Module dependency and impact analysis.
- Adaptive stack detection based on repository files and conventions.
- Architecture decision records for consequential decisions.
- Refreshable project understanding rather than assumptions based on a fixed stack.

Templates: `templates/PROJECT-MAP.md`, `templates/ADR.md`; see `workflows/phase-3-project-intelligence.md`.

### Phase 4 — Advanced automation

- Risk-based specialist routing.
- Safer parallel work with explicit ownership and dependencies.
- Agent-efficiency review for duplication and unnecessary delegation.
- Release, rollback, recovery, and feature-flag lifecycle checks where relevant.
- Cost/effort observations when real evidence is available.

See `workflows/phase-4-advanced-automation.md` and `workflows/agent-orchestration.md`.

These phases describe packaged workflows and requirements. They do not imply that all behaviors are automatically enforced by a runtime service; Claude Code must follow the instructions and have the necessary capabilities and permissions.

## Project intelligence and architecture

Use `/architecture-map` to request a repository map. The map should be grounded in inspected files and identify:

- Languages, frameworks, package managers, and runtime entry points.
- Apps, modules, boundaries, shared services, and dependency relationships.
- API routes/contracts, data models, migrations, and external integrations.
- Test suites and available quality gates.
- CI/CD, configuration, deployment, observability, and recovery components.
- Unknowns and assumptions requiring confirmation.

Use `templates/PROJECT-MAP.md` for the map and `templates/ADR.md` for significant decisions. ADRs should capture context, decision, alternatives, consequences, and status. Avoid introducing new frameworks or replacing architecture unless the approved plan calls for it.

## Audits and remediation

Choose the scope based on the task and the repository. A broad audit can inspect architecture, API, configuration, database, deployment, device behavior, documentation, frontend, performance, reliability, security, testing, and AI code where relevant.

Every finding should ideally include:

- Stable identifier and concise title.
- Severity/priority, impact, confidence, and affected scope.
- Concrete file/line or runtime evidence.
- Reproduction or validation method when available.
- Root cause versus hypothesis, clearly distinguished.
- Recommended remediation and regression tests.
- Status and verification evidence.

Recommended lifecycle: discover → baseline → prioritize → approve → remediate → test → independent review → re-audit → update TODO → report. Accepted risks should include rationale, approver, scope, and review/expiry date when appropriate. A source-code search alone is not proof that a resource is unused.

## Database governance and migrations

Responsibilities are complementary:

- `database-agent`: schema, relationships, constraints, integrity, and migrations.
- `database-optimization-agent`: query patterns, query plans, indexing, and performance.
- `database-governance-agent`: model/table/column use tracing and cleanup candidates.
- `data-governance-agent`: access, classification, retention, and deletion policy.
- `migration-agent`: migration sequencing, compatibility, transformations, and rollback safety.

Safe workflow:

1. Inventory tables, columns, constraints, indexes, migrations, and application references.
2. Trace models through services, APIs, jobs, reports, integrations, dynamic SQL, and runtime evidence when available.
3. Label apparent orphans and duplicates as candidates, with evidence and confidence—not confirmed dead objects by default.
4. Check external consumers, reporting, historical records, retention, and audit requirements.
5. Prepare a staged plan including compatibility, data validation, backups, and rollback/recovery.
6. Obtain explicit approval before destructive operations or production data changes.
7. Test in a safe environment and verify dependent workflows after migration.

Never drop tables, delete records, or remove columns solely because static analysis finds no obvious references.

## Testing and release readiness

Discover test commands from actual project manifests, scripts, CI workflows, and documentation. Select checks relevant to the change, such as unit, integration, end-to-end, regression, security, API contract, migration, accessibility, performance, load, or device tests.

For performance work, capture a comparable baseline where feasible. If no suitable benchmark environment exists, say that measurement was unavailable and avoid claiming quantified improvement.

Use `/release-check` to assess readiness. The check should examine relevant tests, open findings, migrations, configuration/secrets, monitoring, backup/recovery, rollback, documentation, and unresolved risks. It does not deploy or authorize deployment.

## Reports and evidence

Use `templates/MODULE_COMPLETION_REPORT.md` and the `/module-report` command for substantial work. Keep reports in `docs/reports/` when that matches the target repository's conventions.

A report should include:

- Goal, scope, baseline revision, and acceptance criteria.
- Summary of actual changes and affected files/modules.
- Tasks added, updated, resolved, blocked, or remaining in TODO files.
- Tests/checks run with exact commands and actual outcomes.
- Relevant audit findings, security/data/performance implications, and review results.
- Migration and rollback notes where relevant.
- Known limitations, deferred work, and outstanding approvals.
- Release readiness and deployment status.

Use consistent result labels: `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, and `NOT APPLICABLE`. Never fabricate baseline values, test execution, coverage, screenshots, deployment status, or before/after percentages. If an agent or test could not run, record that limitation.

## Approval and safety model

- Read-only discovery and reporting may proceed within granted permissions.
- Present a plan and wait for approval before implementation where the workflow requires it.
- Keep changes within the approved scope; ask again if the scope or risk materially changes.
- Preserve unrelated local changes and user-authored files.
- Require explicit authorization for destructive database changes, production mutations, deployments, commits/pushes, publishing, spending money, or external side effects.
- Never bypass Claude Code permission controls or expose secrets in logs/reports.
- Use backups, rollback plans, and safe environments for high-risk data operations.
- Do not state that a task is complete until acceptance criteria and applicable checks have evidence.

## Validation

### Run the structural validator

From the extracted package root:

```bash
python scripts/validate_os.py
```

On Windows, this is usually also:

```powershell
py scripts/validate_os.py
```

Inspect the script's output and exit code. A structural validator can check package consistency and references; it cannot prove live agent invocation, correctness of application code, or that a test environment works.

### Runtime smoke test

In a safe test repository:

1. Start Claude Code and confirm the expected commands/skills are discovered.
2. Run `/validate-os` and review any findings.
3. Ask for a read-only `/architecture-map`.
4. Run a small `/enhance-project` assessment without editing code.
5. Approve a tiny, reversible change and observe agent routing, TODO updates, test evidence, and report generation.
6. Test failure handling by asking the system to report a deliberately unavailable test command as `NOT RUN`, not as a pass.
7. Confirm no commit, push, deployment, or destructive database operation occurs without authorization.

## Troubleshooting

**A slash command is not recognized**
- Confirm the file exists under `.claude/commands/` and matches the command name.
- Check your Claude Code version and its supported command conventions.
- Restart/reopen the session if configuration discovery requires it.
- Ask Claude Code to inspect the command file rather than claiming it ran.

**An agent is not invoked**
- Confirm the agent definition and manifest entry exist.
- Check the orchestrator's routing rules and available Claude Code agent/task mechanism.
- Distinguish “agent definition exists” from “agent was invoked.” Record the reason if it could not be called.

**TODO.md is duplicated or overwritten**
- Search for existing TODO files before creating one.
- Use the module map to determine the correct tracker.
- Preserve existing IDs, history, and completed items; consolidate duplicates carefully.

**Validation fails**
- Read the exact failed check and referenced path.
- Fix or document the underlying mismatch; do not weaken checks just to obtain a pass.
- Re-run validation and record the actual output.

**Tests cannot run**
- Inspect the repository's documented setup and available dependencies.
- Do not install or modify dependencies without appropriate approval.
- Record the exact command, reason, and `NOT RUN`/`BLOCKED` status.

**Agents disagree or edit overlapping files**
- Stop conflicting edits, compare evidence, and have the orchestrator resolve the conflict.
- Use explicit file ownership and sequential execution for shared or high-risk resources.

## Recommended operating routine

For every substantial task:

1. Start with `/validate-os` when installing or changing this framework.
2. Inspect the repository and working tree.
3. Map the affected module and read its existing `TODO.md`.
4. Establish a baseline and create a plan with acceptance criteria.
5. Obtain approval for implementation and any consequential operations.
6. Delegate only to relevant agents with clear scope and expected output.
7. Implement incrementally and preserve unrelated changes.
8. Run appropriate tests and independent reviews.
9. Re-audit affected findings and update TODO status with evidence.
10. Generate a completion report that distinguishes verified outcomes from limitations.

The goal is not maximum agent count or maximum automation. The goal is a controlled, traceable workflow that produces maintainable changes and trustworthy evidence.


## Extended engineering controls (v1.2.0)

This edition preserves the existing agents, legacy 20-agent audit set, commands, skills, approval-first rules, and module-wise `TODO.md` process. It adds six specialist agents: `ci-quality-gate-agent`, `requirements-traceability-agent`, `backup-restore-validation-agent`, `event-messaging-agent`, `infrastructure-as-code-agent`, and `test-environment-agent`.

### Agent execution contracts
Every delegation declares `REVIEW_ONLY`, `PLAN_ONLY`, `IMPLEMENTATION`, or `INDEPENDENT_REVIEW`. Actual configured tools—not role wording—determine whether an agent can write. Read-only agents must return findings or patch guidance. The main session owns dispatch, approval checks, conflict resolution, and final acceptance. See `workflows/agent-execution-contract.md`.

### Requirements and task lifecycle
Use `/trace-requirements` to map approved requirements to TODO/task IDs, changed files, tests, and evidence. Existing module TODO files are updated in place; stable IDs and progress history must be preserved. The task ledger coordinates active delegated work. `RESOLVED` requires acceptance evidence; deployment remains a separate state. See `workflows/requirements-traceability.md` and `workflows/todo-task-lifecycle.md`.

### Recovery, event systems, IaC, and test isolation
- `/validate-recovery` reviews backup/restore readiness and isolated recovery evidence. Never run destructive restores without explicit approval.
- `event-messaging-agent` reviews event schemas, delivery semantics, retries, idempotency, ordering, and dead-letter handling.
- `infrastructure-as-code-agent` reviews plans and configuration; it does not apply infrastructure without approval.
- `test-environment-agent` reviews reproducibility, environment parity, fixture isolation, and safe cleanup.

### CI quality gates and validation
Use `/check-ci-gates` to inspect the repository's existing checks and their actual results. Reusable matrices are available in `templates/REQUIREMENTS-TRACEABILITY.md` and `templates/CI-QUALITY-GATES.md`. A structural validator and GitHub Actions workflow are included at `scripts/validate_os.py` and `.github/workflows/validate-os.yml`. Run locally from the package root:

```bash
python scripts/validate_os.py
```

The validator checks manifest/file consistency, required artifacts, skill and command references, agent frontmatter, and key orchestration conventions. It does **not** prove that Claude Code recognizes every command or that live agent dispatch works; validate runtime behavior in your installed Claude Code version.

### New skills
`requirements-traceability`, `ci-quality-gates`, `backup-restore-validation`, `event-driven-system-development`, and `test-environment-isolation` provide reusable procedures for these domains. The new specialist agents are review-only by default because their frontmatter exposes read-only tools.

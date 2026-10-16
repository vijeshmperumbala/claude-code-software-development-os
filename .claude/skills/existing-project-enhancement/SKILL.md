---
name: existing-project-enhancement
description: Audit and improve an existing software project incrementally while preserving working behavior, architecture, data, and user changes.
---
# Existing Project Enhancement Workflow

Use this skill when the user asks to improve, optimize, refactor, modernize, clean up, stabilize, or audit an existing application.

## 1. Establish a baseline before changing anything
- Read root and nested project instructions.
- Inspect Git status and current revision; preserve uncommitted and unrelated user changes.
- Inventory stack, modules, dependencies, architecture, routes, database schema, integrations, tests, CI/CD, configuration, and deployment approach.
- Run safe, relevant baseline checks when feasible and record exact commands/results.
- Capture current behavior and measurable metrics where practical. If no baseline can be measured, say so; never invent numbers.

## 2. Build an evidence-based assessment
Review the project for relevant areas:
- Architecture and module boundaries
- Duplicate logic, dead code candidates, over-abstraction and maintainability
- Database complexity, table/column usage evidence, relationships, indexes, query patterns and migrations
- Security, authentication, authorization, tenant boundaries, secrets and data handling
- Performance, memory, network requests, caching and concurrency
- Tests, regressions, reliability, error handling and observability
- UI/UX, responsive behavior, accessibility and supported devices
- Dependencies, configuration, documentation and operational readiness

Use existing specialist agents in `.claude/agents/`. Choose based on evidence and risk; don't invoke every agent indiscriminately. Keep broad audits read-only until the user approves a change plan.

## 3. Prioritize findings
For each finding, record:
- Evidence and affected component
- User/business impact
- Severity and confidence
- Proposed solution and alternatives
- Estimated risk and dependencies
- Verification plan
- Whether a migration, downtime, data change, or compatibility impact is involved

Prioritize security/data-integrity defects and user-facing failures first, then correctness/reliability, measured performance bottlenecks, maintainability, and cosmetic cleanup.

## 4. Present an enhancement roadmap
Separate findings into:
- Immediate blockers / critical fixes
- High-value improvements
- Safe low-risk cleanups
- Larger refactors requiring separate planning
- Not recommended / insufficient evidence

Show benefits, trade-offs, risks, affected files/modules, and acceptance criteria. Do not begin implementation until the user approves the proposed scope.

## 5. Implement incrementally after approval
- Make focused, reversible changes.
- Avoid broad rewrites unless explicitly approved and justified.
- Assign one implementation owner per overlapping file set.
- Add or update tests before or alongside fixes.
- Preserve public APIs, migrations, user data, configuration, and unrelated working behavior unless the approved plan says otherwise.
- Do not delete tables, columns, workflows, or dependencies solely because they appear unused. Seek static and runtime evidence and plan deprecation/migration safely.

## 6. Verify and compare
- Re-run the original reproduction and baseline checks.
- Run relevant unit, integration, regression, security, performance, accessibility/device, and build checks.
- Compare before/after using equivalent conditions and actual evidence.
- Mark checks PASS, FAIL, BLOCKED, NOT RUN, or NOT APPLICABLE.
- Have a relevant agent independently review high-risk changes.
- If a check fails, fix within approved scope or report the blocker; do not hide failures.

## 7. Report
Create `docs/reports/existing-project-enhancement-report.md` or a user-approved path. Include:
- Project baseline and revision
- Findings with severity, evidence, and priorities
- Approved changes and rejected/deferred recommendations
- Before/after comparison
- Files/components changed
- Tests and exact results
- Database/migration and rollback notes
- Known issues, remaining risks, and next recommended improvements

Never claim that the whole project is “perfect” or bug-free. State what was and was not checked. Commit, push, deploy, destructive changes, and external actions require separate explicit approval.

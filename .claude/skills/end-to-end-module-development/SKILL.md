---
name: end-to-end-module-development
description: Brainstorm, plan, coordinate specialist agents, implement, test, audit, and document a module that fits the existing project.
---
# End-to-End Module Development

Use this skill for requests such as “brainstorm the Asset Management module and plan it, then build it to fit the existing project.”

## Phase 1 — Discover existing project
- Read root `CLAUDE.md`, repository instructions, and Git status.
- Inspect the existing architecture, package manifests, modules, route structure, data models, API patterns, UI/design system, permissions, tests, CI and deployment approach.
- Identify reusable components and similar existing workflows.
- Infer the stack from evidence. Do not scaffold a new project or impose a new stack.

## Phase 2 — Brainstorm and define requirements
- Define users/roles, user journeys, business rules, CRUD and lifecycle workflows, search/filter/sort, validation, states, audit history, notifications, integrations, reporting, and edge cases as relevant.
- Identify data ownership, tenancy boundaries, permissions and retention requirements.
- Define target devices and accessibility needs from the product's actual scope.
- Separate MVP requirements from optional enhancements.
- Record assumptions and ask concise questions only where ambiguity blocks safe planning.

## Phase 3 — Build the agent work breakdown
The main Claude Code session acts as orchestrator and delegates through its available subagent/task mechanism. Do not assume a subagent can recursively launch other subagents.

Create a task matrix with:
- Agent name (must exist under `.claude/agents/`)
- Bounded task and files/areas in scope
- Inputs and dependencies
- Expected evidence/deliverable
- Read-only reviewer or implementation owner
- Verification criteria

Use relevant specialists, not all agents indiscriminately. Parallelize independent reviews and discovery; sequence dependent work. Keep one write owner per overlapping file set.

## Phase 4 — Produce an approval-ready plan
Include:
- Feature requirements and acceptance criteria
- Existing architecture fit and affected components
- Data model/API/UI changes
- Security and threat considerations
- Accessibility, responsive/device requirements
- Test strategy and regression scenarios
- Migration, rollout, rollback and observability plan
- Documentation changes and unresolved risks

Stop before implementation and ask the user to approve the plan. Their general permission to orchestrate agents does not authorize destructive operations or production actions.

## Phase 5 — Implement approved scope
- Delegate implementation tasks after approval.
- Follow existing conventions and make the smallest coherent changes.
- Update tests and documentation with code.
- Do not introduce dependencies or architectural layers without justification.
- Preserve unrelated user changes.

## Phase 6 — Independent verification
Select reviewers according to change impact. Common checks include:
- Architecture/code quality
- API and database integrity
- Security/authentication/authorization
- Unit/integration/E2E/regression tests
- Accessibility and supported-device behavior
- Performance/reliability
- Documentation and configuration

Run commands discovered from the repository; never invent test scripts. Record exact results. A reviewer should not merely repeat the implementer's claims.

## Phase 7 — Closeout
Return:
1. Implemented scope and user-visible workflows
2. Files changed
3. Tests/checks and PASS/FAIL/BLOCKED/NOT RUN status
4. Security, data migration, device and performance notes
5. Known limitations and deferred work
6. Rollback/recovery instructions where applicable
7. Explicit approval needed for commit, push, deploy, destructive migration, or external action


## Required completion report
After implementation and verification, invoke `module-completion-report` and write `docs/reports/<module-slug>-completion-report.md`. The report must compare baseline and after-state where evidence exists, list changed files, test commands/results, relevant best-case and edge-case scenarios, database/duplicate/security/performance/UI checks, limitations, and release readiness. Mark missing measurements as not measured; never fabricate improvement claims.

---
description: Audit an existing project, propose prioritized improvements, then implement approved changes and generate a before/after report.
---
Act as the Engineering Orchestrator and follow the `existing-project-enhancement` skill.

User request: treat the text following this command as the enhancement objective; if no objective is provided, perform a broad read-only assessment.

Workflow:
1. Inspect repository instructions, Git status, stack, architecture, modules, database, tests, CI, and deployment setup.
2. Establish a baseline using safe checks and measurements where feasible.
3. Delegate focused read-only assessments to relevant existing specialist agents, including code quality/duplication, architecture, database governance/optimization, security, testing, performance, reliability, frontend/accessibility/device compatibility, and documentation as appropriate.
4. Consolidate and deduplicate findings. Rank them by severity, confidence, user impact, implementation risk, and dependencies.
5. Present a prioritized enhancement roadmap with acceptance criteria and verification plan. Do not edit until the user approves the scope.
6. After approval, implement focused changes with clear file ownership and preserve unrelated user changes.
7. Run relevant checks and independent reviews. Compare results with the baseline using actual evidence.
8. Generate `docs/reports/existing-project-enhancement-report.md` using the `module-completion-report` skill/template where applicable. Include before/after status, tests, changed files, unresolved risks, and next steps.

Do not delete database objects or workflows based only on apparent lack of use. Do not commit, push, deploy, or perform destructive operations without explicit authorization. Do not fabricate metrics or claim checks passed without output.

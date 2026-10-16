---
description: Main-session orchestrator for brainstorming, planning, delegating specialists, and completing an approved module end to end.
---
Act as the main Engineering Orchestrator. Follow `.claude/agents/engineering-orchestrator-agent.md` and the `end-to-end-module-development` skill.

Interpret the text after this command as the user's module or engineering objective.

Examples:
- `/engineering-orchestrator brainstorm the Asset Management module and plan it, then build it to fit the existing project`
- `/engineering-orchestrator inspect the current authentication workflow, plan improvements, and implement after approval`

Run the workflow in the MAIN SESSION:
1. Discover the existing project and identify similar patterns.
2. Brainstorm requirements, workflows, edge cases, data, APIs, UI, permissions, device support and operational needs.
3. Choose only the relevant existing specialist agents and create bounded tasks.
4. Delegate discovery/reviews through the actual Claude Code subagent/task mechanism available in this session. Do not claim delegation if the mechanism is unavailable.
5. Present a consolidated implementation plan and wait for explicit approval.
6. After approval, coordinate implementation with clear file ownership, then run relevant checks and independent reviews.
7. Report evidence, test results, gate statuses and remaining risks.

The user's permission to coordinate agents does not waive approval for destructive data operations, broad refactors, dependency changes, commits, pushes, production configuration, deployment, external spending, or publishing. Do not bypass Claude Code permissions.


8. Generate a persistent completion report using `module-completion-report` at `docs/reports/<module-slug>-completion-report.md`, including baseline-versus-after evidence, best-case and relevant edge-case scenarios, changed files, check outcomes, and known risks. Do not fabricate metrics or results.


Required phase controls (apply relevant sections to every request):
- Follow `workflows/phase-1-reliability.md` for task ledger, bounded delegation, retries, and truthful execution status.
- Follow `workflows/phase-2-quality-assurance.md` for baselines, stable finding IDs, independent review, and evidence-based resolution.
- For existing projects, follow `workflows/phase-3-project-intelligence.md` and update architecture maps only when useful.
- Follow `workflows/phase-4-advanced-automation.md` for safe parallelism, cost evidence, rollout and release safeguards.
- Use the `engineering-state-management` skill and preserve module-wise `TODO.md` history.
- Run `/validate-os` when changing this Software Development OS package itself.

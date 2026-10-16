# Existing Project Enhancement Workflow

## Operating modes
- Assessment-only: inspect, test safely, report findings, and propose a roadmap. No code edits.
- Approved enhancement: implement only the explicitly approved scope, verify, and report.
- Emergency remediation: address an agreed critical issue with the smallest safe fix and focused regression coverage.

## Baseline record
Capture available revision, Git status, current tests, current architecture/schema, known behavior, and measurable performance. Clearly label missing baseline evidence.

## Finding record
Each finding includes ID, category, severity, confidence, evidence, impact, affected files/components, recommendation, risk, dependencies, and verification steps.

## Prioritization
1. Critical security, data integrity, or production correctness issues.
2. High-impact user-facing failures and reliability problems.
3. Measured performance bottlenecks and scaling constraints.
4. Maintainability and duplication that create concrete risk or cost.
5. UX/accessibility improvements and low-risk cleanup.
6. Cosmetic or speculative refactoring.

Adjust priority to the user's goals and project context.

## Approval and safety
The user approves the scope before implementation. General permission to orchestrate agents does not authorize destructive schema changes, data deletion, broad rewrites, commits, pushes, deployment, or external actions.

## Final report
Create `docs/reports/existing-project-enhancement-report.md` unless another path is approved. Compare baseline and after-state only where evidence exists; list tests, results, changed files, unresolved findings, trade-offs, and recommendations.

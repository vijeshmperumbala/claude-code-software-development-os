---
name: bug-fix-orchestration
description: Coordinate approval-first bug fixing with regression tests and independent review.
---
# Bug Fix Orchestration

1. Read the bug report and relevant repository instructions.
2. Reproduce the issue and create a failing regression test where practical.
3. Document root cause, impact, blast radius, and a minimal change plan.
4. Request explicit approval before implementation.
5. Delegate to one implementation owner; ask other agents for review, not conflicting edits.
6. Run targeted tests, then relevant regression, security, accessibility, compatibility, or performance checks based on the change.
7. Have an independent reviewer inspect the diff and test adequacy.
8. Re-run the original reproduction and confirm the regression test passes.
9. Report exact evidence, changed files, remaining risks, and checks not run.

## Guardrails
- Preserve unrelated user changes.
- Do not hide errors or weaken tests to make a build pass.
- Avoid broad refactors during a focused bug fix unless required and approved.
- Do not perform destructive data operations, commit, push, or deploy without explicit authorization.

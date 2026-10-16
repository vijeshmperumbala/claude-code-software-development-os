---
description: Coordinate an approval-first bug fix across diagnosis, implementation, tests, independent review, and regression verification.
---
Use the bug-fix-orchestration skill.

Workflow:
1. Establish reproduction and expected behavior.
2. Produce a root-cause hypothesis with supporting evidence and confidence.
3. Identify blast radius and related cases.
4. Present a minimal implementation plan, test plan, and rollback considerations for approval.
5. After approval, delegate implementation to the appropriate engineering agent.
6. Run focused tests, regression tests, and relevant security/performance checks.
7. Ask a reviewer agent that did not implement the fix to inspect the diff.
8. Reproduce the original case again and verify the regression test fails before the fix and passes after it when practical.
9. Summarize changed files, evidence, remaining risks, and checks not run.

Never claim a bug is fixed solely because code was changed. Never perform destructive operations or deploy without explicit approval.

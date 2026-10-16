---
name: feature-implementation-workflow
description: Implement an approved feature and verify it against acceptance criteria.
---

# Feature implementation workflow

1. Confirm the approved plan and inspect current git status/diff.
2. Break work into small steps; assign clear file ownership if agents work in parallel.
3. Follow detected stack conventions and approved architecture; do not silently expand scope.
4. Implement tests alongside behavior. Validate authorization at trusted boundaries and cover negative paths.
5. Run relevant formatting, lint, type, unit, integration, build, and E2E checks based on actual project scripts.
6. Request independent review for security-sensitive or high-impact changes.
7. Stop and ask if scope expands, a destructive change is needed, tests require external access, or an important assumption is unresolved.
8. Report files changed, behavior delivered, exact checks/results, unrun checks, risks, and docs updated.

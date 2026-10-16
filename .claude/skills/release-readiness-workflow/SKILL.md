---
name: release-readiness-workflow
description: Assess release readiness without deploying or publishing.
---

# Release readiness assessment

1. Inspect git status, release scope, tests, build, security/dependency results, configuration, migrations, backups, observability, feature flags, rollback, support/runbooks, and documentation.
2. Run only project-defined, safe checks that are appropriate and approved. Never deploy or publish.
3. Use `.claude/quality-gates/release.yaml` and the gate protocol. Mark missing evidence `BLOCKED` or `NOT RUN`, not pass.
4. Identify unresolved critical/high risks and explicit risk acceptance requirements.
5. Return a release decision: `READY FOR HUMAN APPROVAL`, `NOT READY`, or `BLOCKED`, with evidence and actions.

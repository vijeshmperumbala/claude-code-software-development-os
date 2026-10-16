---
name: audit-remediation-workflow
description: Remediate explicitly approved audit findings only.
---

# Audit remediation

1. Require finding IDs or an explicit approved report and confirm the user's intended scope.
2. Read the findings and inspect current code; verify they still apply before changing anything.
3. Group changes into small safe batches; identify behavior, migration, dependency, security and compatibility risks.
4. Present the remediation plan, files, risks, tests and rollback for approval before material changes.
5. Fix the root cause; add regression tests; avoid unrelated refactors.
6. Run relevant checks and report remaining findings. Do not claim a fix is verified until the appropriate check passes.
7. Never auto-fix all findings indiscriminately or make destructive changes without explicit approval.
